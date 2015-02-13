using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using MvcPaging;
using Tals.ProBono.Domain.Concrete;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Filters;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Infrastructure;
using Tals.ProBono.Web.Models;

namespace Tals.ProBono.Web.Controllers
{
    [Authorize(Roles = UserRoles.AdministratorsAndAttorny)]
    [SecurityQuestionFilter]
    [DynamicMasterPageFilter]
    public class AttorneyController : Controller
    {
        private readonly IEmailService _emailService;
        private readonly ISecurityService _security;
        readonly IRepositoryFactory _repositories;
        readonly IUser _currentUser;
        readonly IAuditor _auditor;
        public int PageSize = 5;

        public AttorneyController(IEmailService emailService, ISecurityService security, IRepositoryFactory repositories, IUser currentUser, IAuditor auditor)
        {
            _emailService = emailService;
            _security = security;
            _repositories = repositories;
            _currentUser = currentUser;
            _auditor = auditor;
        }

        public ViewResult List(string category, int page = 1)
        {
            var pageIndex = page - 1;
            var questionsToShow = ((category == null)
                                      ? _repositories.Questions.Get().Active().NotTaken()
                                      : _repositories.Questions.Get().Active().NotTaken().WithCategory(category))
                                      .OrderBy(x => x.CreatedDate);

            var model = questionsToShow.ToPagedList(pageIndex, PageSize);

            ViewBag.Category = category;

            return View(model);
        }

        public ActionResult Resources()
        {
            return View();
        }

        public ViewResult Drafts(int page = 1)
        {
            var posts = _repositories.Posts.Get().AsQueryable().DraftsFor(UserModel.Current.UserName);

            return View(posts);
        }

        public ViewResult Details(int id)
        {
            var question = _repositories.Questions.Get().WithId(id);
            var model = DetailsViewModel.CreateViewModel(question);

            if (question.IsTaken())
                if (!question.IsTaker(UserModel.Current.UserName))
                    return View("AlreadyTaken");

            _auditor.Audit(_currentUser.UserName, id);

            return View(model);
        }

        public ViewResult PracticeAreas()
        {
            var categories = _repositories.Categories.Get();
            return View(categories);
        }

        public ActionResult Take(int id)
        {
            var question = _repositories.Questions.Get().WithId(id);

            if(!_security.CanTake(question, UserModel.Current.UserName))
            {
                TempData["message"] = _security.ErrorMessage;
                return RedirectToAction("Details", new {id = id});
            }

            return View(question);
        }

        [HttpPost]
        public ActionResult Take(Question question)
        {
            var questionToEdit = _repositories.Questions.Get().WithId(question.Id);

            if (questionToEdit.IsTaken())
                return View("AlreadyTaken");

            questionToEdit.Take(UserModel.Current.UserName);
            _repositories.Questions.SaveChanges();

            return RedirectToAction("Details", new RouteValueDictionary(new {id = question.Id}));
        }

        [HttpGet]
        public ActionResult Reply(int id)
        {
            var question = _repositories.Questions.Get().WithId(id);

            if (question == null) return View("NotFound");

            if (!_security.HasReplyAccess(question, UserModel.Current.UserName))
            {
                TempData["message"] = _security.ErrorMessage;
                return RedirectToAction("Details", new {id = id});
            }

            return View(new ReplyViewModel(question));
        }

        //
        // POST: /Attorney/Reply

        [HttpPost]
        public ActionResult Reply(Post reply, int id, ReturnUrl url)
        {
            var question = _repositories.Questions.Get().WithId(id);

            if (question == null) return View("NotFound");

            if (!_security.HasReplyAccess(question, UserModel.Current.UserName))
            {
                TempData["message"] = _security.ErrorMessage;
                return RedirectToAction("Details", new { id = id, r = url.Url });
            }

            if (this.ModelState.IsValid)
            {
                try
                {
                    reply.CreatedBy = UserModel.Current.UserName;
                    reply.CreatedDate = DateTime.Now;

                    question.AddReply(reply);

                    _repositories.Questions.SaveChanges();

                    var user = Membership.GetUser(question.CreatedBy);
                    if (user != null)
                        _emailService.SendEmailTo(user.Email,
                                                  new StandardEmail(StandardEmail.EmailTemplate.LawyerReply));

                    return RedirectToAction("Details", new { id, r = url.Url });
                }
                catch (Exception e)
                {
                    this.ModelState.AddModelError("*", e.ToString());
                }
            }

            return View(new ReplyViewModel(question));
        }

        public ActionResult MarkAsAnswer(int questionId, int postId, ReturnUrl url)
        {
            var question = _repositories.Questions.Get().WithId(questionId);

            if(!_security.CanMarkAsAnswer(question, UserModel.Current.UserName))
            {
                TempData["message"] = _security.ErrorMessage;
                return RedirectToAction("Details", new { id = questionId });
            }

            var post = question.Responses.WithId(postId);

            return View(post);
        }

        [HttpPost]
        public ActionResult MarkAsAnswer(Post post, ReturnUrl url)
        {
            var question = _repositories.Questions.Get().WithId(post.QuestionId);

            if (!_security.CanMarkAsAnswer(question, UserModel.Current.UserName))
            {
                TempData["message"] = _security.ErrorMessage;
                return RedirectToAction("Details", new { id = question.Id });
            }

            question.MarkAsAnswer(post.Id, UserModel.Current.UserName);
            _repositories.Questions.SaveChanges();

            TempData["message"] = "You have successfully marked this question as answered. The question is now closed.";

            return RedirectToAction("Details", new {id = question.Id});
        }

        public ViewResult Urgent(int page = 1) {
            var pageIndex = page - 1;
            var questions = _repositories.Questions.Get().Urgent().OrderBy(x => x.CreatedDate);

            var model = questions.ToPagedList(pageIndex, PageSize);

            ViewBag.Category = "Urgent";

            return View("List", model);
        }

        public ViewResult MyTaken(int page = 1) {
            var pageIndex = page - 1;
            var questions = _repositories.Questions.Get().Active().WithTakenBy(UserModel.Current.UserName).OrderBy(x => x.CreatedDate);

            var model = questions.ToPagedList(pageIndex, PageSize);

            ViewBag.Category = "My Taken Questions";

            return View("List", model);
        }

        public ActionResult Subscribe(int id, string returnUrl)
        {
            var category = _repositories.Categories.Get(id);
            var model = SubscribeViewModel.CreateViewModel(category, returnUrl);
            model.ReturnUrl = Request.UrlReferrer == null ? null : Request.UrlReferrer.PathAndQuery;

            return View(model);
        }

        [HttpPost]
        public ActionResult Subscribe(Subscription subscription, string returnUrl) {
            var category = _repositories.Categories.Get(subscription.CategoryId);
            category.Subscriptions.Add(subscription);
            _repositories.Categories.SaveChanges();

            Message = "You have successfully subscribed to " + subscription.Category.ShortDescription;

            _emailService.SendEmailTo(UserModel.Current.Email, new SubscribeEmail(subscription.Category.ShortDescription,
                ConfigSettings.SiteUrl.TrimEnd('/') + Url.Action("Unsubscribe", new {id = subscription.CategoryId})));

            if (returnUrl == string.Empty) returnUrl = null;

            return Redirect(returnUrl ?? "~/Attorney/PracticeAreas");
        }

        protected string Message
        {
            get { return (string)TempData["message"]; }
            set { TempData["message"] = value; }
        }

        public ActionResult Unsubscribe(int id, string returnUrl) {
            var category = _repositories.Categories.Get(id);
            var subscription = category.GetSubscriptionFor(_currentUser.UserName);
            var model = UnsubscribeViewModel.CreateViewModel(subscription, returnUrl);

            return View(model);
        }

        [HttpPost]
        public ActionResult Unsubscribe(Subscription subscription, string returnUrl) {
            var s = _repositories.Subscriptions.Get(subscription.Id);
            var c = s.Category;
            
            _repositories.Subscriptions.Delete(s);

            TempData["message"] = "You have successfully unsubscribed from " + c.ShortDescription;

            if (returnUrl == string.Empty) returnUrl = null;

            return Redirect(returnUrl ?? "~/Attorney/PracticeAreas");
        }

        [Authorize(Roles = UserRoles.Attorney)]
        public ActionResult LogHours()
        {
            var questionsAnswered = _repositories.Questions.Get().AnsweredBySinceLastLogin(UserModel.Current.UserName, UserModel.Current.LastLoginDate);
            var entries = _repositories.WorkEntries.Get().YearToDateFor(UserModel.Current.UserName);
            var yearToDateHours = entries.Any()
                                      ? entries.Sum(x => x.Hours)
                                      : 0;

            var model = new WorkEntryViewModel
                            {
                                Entry = new WorkEntry(),
                                QuestionsAnswered = questionsAnswered,
                                YearToDateHours = yearToDateHours
                            };

            return View(model);
        }

        [Authorize(Roles = UserRoles.Attorney)]
        [HttpPost]
        public ActionResult LogHours(WorkEntry entry)
        {
            if (entry.Hours > 0)
            {
                entry.UserName = UserModel.Current.UserName;
                entry.Logged = DateTime.Now;

                _repositories.WorkEntries.Add(entry);
                _repositories.WorkEntries.SaveChanges();

                TempData["message"] = "Your hours have been logged and you have been successfully logged out.";
            }

            TempData["message"] = "You have been successfully logged out.";

            return RedirectToAction("SignOut", "Account");
        }
    }
}
