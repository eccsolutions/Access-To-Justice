using System;
using System.Linq;
using System.Web.Mvc;
using System.Web.Security;
using Tals.ProBono.Domain.Abstract;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Filters;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Helpers;
using Tals.ProBono.Web.Infrastructure;
using Tals.ProBono.Web.Models;

namespace Tals.ProBono.Web.Controllers
{
    [Authorize(Roles = UserRoles.BasicUser)]
    [SecurityQuestionFilter]
    [DynamicMasterPageFilter]
    public class ClientController : Controller
    {
        private readonly IEligibilityService _eligibilityService;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IEmailService _emailService;
        readonly IAuditor _auditor;
        readonly IUser _currentUser;

        public ClientController(IEligibilityService eligibilityService, IUnitOfWork unitOfWork, IEmailService emailService, IAuditor auditor, IUser currentUser)
        {
            this._eligibilityService = eligibilityService;
            this._unitOfWork = unitOfWork;
            _emailService = emailService;
            _auditor = auditor;
            _currentUser = currentUser;
        }

        public ActionResult Index()
        {
            return RedirectToAction("Questions");
        }

        //
        // GET: /Client/Details/1
        public ActionResult Details(int id)
        {
            var question = _unitOfWork.QuestionRepository.Get().WithId(id);

            if (question == null)
                return View("NotFound");

            _auditor.Audit(_currentUser.UserName, id);

            var posts = _unitOfWork.PostRepository.Get().WithQuestionId(question.Id);
            var model = DetailsViewModel.CreateViewModel(question, posts);

            return (!question.IsOwner(UserModel.Current.UserName)) ? View("InvalidOwner") : View(model);
        }

        //
        // GET: /Client/Ask
        public ActionResult Ask()
        {
#if DEBUG
#else
            if (_unitOfWork.QuestionRepository.Get().ReachedLimit(UserModel.Current.UserName))
                return View("ReachedMax");

            if (!_eligibilityService.IsEligible(Session.SessionID))
                return RedirectToAction("Index", "Rules");
#endif

            ViewData["categories"] = _unitOfWork.CategoryRepository.Get();
            ViewData["casecounties"] = _unitOfWork.CountyRepository.Get();

            return View(new Question());
        }

        //
        // POST: /Client/Create

        [HttpPost]
        public ActionResult Ask(Question question)
        {
            if (this.ModelState.IsValid)
            {
                try
                {
                    question.CreatedBy = UserModel.Current.UserName;
                    question.CreatedDate = DateTime.Now;
                    question.CountyId = _unitOfWork.CountyRepository.Get().WithCounty(UserModel.Current.UserProfile.County).First().Id;

                    _unitOfWork.QuestionRepository.Insert(question);
                    _unitOfWork.Save();

                    var detailsUrl = Url.AttorneyQuestionDetailsLink(question.Id);
                    var unsubscribeUrl = ConfigSettings.SiteUrl.TrimEnd('/') +
                                         Url.Action("Unsubscribe", "Attorney", new {id = question.CategoryId});

                    _emailService.SendEmailFor(question.Category, new SubscriptionEmail(question.Category.ShortDescription, question.CourtDateAsShortString,
                                                                      question.Subject, question.Body, detailsUrl, unsubscribeUrl));

                    _auditor.Audit(_currentUser.UserName, question.Id);

                    return View("QuestionSubmitted");
                }
                catch (Exception e)
                {
                    this.ModelState.AddModelError("*", e.Message);
                }
            }

            ViewData["categories"] = _unitOfWork.CategoryRepository.Get();

            return View(question);
        }

        //
        // GET: /Client/
        public ActionResult Questions()
        {
            var questions = _unitOfWork.QuestionRepository.Get().WithCreatedBy(UserModel.Current.UserName);

            return !questions.Any() ? View("NoRecords") : View(questions);
        }

        //
        // GET: /Client/FollowUp/1
        public ActionResult FollowUp(int? id)
        {
            if (id == null)
                return View("NotFound");

            var question = _unitOfWork.QuestionRepository.Get().WithId(id.Value);

            return question == null
                       ? View("NotFound")
                       : (!question.IsOwner(UserModel.Current.UserName)
                              ? View("InvalidOwner")
                              : View(new ReplyViewModel(question)));
        }

        //
        // POST: /Client/FollowUp/1

        [HttpPost]
        public ActionResult FollowUp(Post reply, int id)
        {
            var question = _unitOfWork.QuestionRepository.Get().WithId(id);

            if (this.ModelState.IsValid)
            {
                try
                {
                    reply.CreatedBy = UserModel.Current.UserName;
                    reply.CreatedDate = DateTime.Now;

                    question.Posts.Add(reply);
                    _unitOfWork.Save();

                    if (!string.IsNullOrEmpty(question.TakenBy))
                    {
                        var user = Membership.GetUser(question.TakenBy);

                        if (user != null) {
                            var detailsUrl = Url.AttorneyQuestionDetailsLink(question.Id);
                            _emailService.SendEmailTo(user.Email,
                                                      new ClientReplyEmail(question.Category.CategoryName,
                                                                           question.CourtDateAsShortString,
                                                                           question.Subject, question.Body, detailsUrl));
                        }
                    }

                    return RedirectToAction("Details", new { id = id });
                }
                catch (Exception e)
                {
                    if (e.InnerException != null)
                        this.ModelState.AddModelError("*", e.InnerException.Message);
                    else
                        this.ModelState.AddModelError("*", e.Message);
                }
            }

            return View(new ReplyViewModel(question));
        }

        public ViewResult AcceptAnswer(int questionId, int postId)
        {
            var post = _unitOfWork.PostRepository.Get().WithId(postId);
            return View("MarkAsAnswer", post);
        }

        [HttpPost]
        public ActionResult AcceptAnswer(Post post)
        {
            var question = _unitOfWork.QuestionRepository.Get().WithId(post.QuestionId);
            var postToUpdate = _unitOfWork.PostRepository.Get().WithId(post.Id);

            if (!question.IsOwner(UserModel.Current.UserName)) return View("InvalidOwner");

            postToUpdate.MarkAccepted();
            question.Closed(UserModel.Current.UserName);
            _unitOfWork.Save();

            return RedirectToAction("Details", new { id = question.Id });
        }
    }
}
