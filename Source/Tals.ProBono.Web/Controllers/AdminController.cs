using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Web.Profile;
using System.Web.Security;
using Tals.ProBono.Domain.Abstract;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Filters;
using Tals.ProBono.Domain.Services;
using System.Linq;
using Tals.ProBono.Web.Helpers;
using Tals.ProBono.Web.Infrastructure;
using Tals.ProBono.Web.Models;
using MvcPaging;

namespace Tals.ProBono.Web.Controllers
{
    [Authorize(Roles = UserRoles.Administrators)]
    [DynamicMasterPageFilter]
    public class AdminController : Controller
    {
        private readonly IEmailService _emailService;
        private readonly IUnitOfWork _unitOfWork;

        public AdminController(IEmailService emailService, IUnitOfWork unitOfWork)
        {
            _emailService = emailService;
            _unitOfWork = unitOfWork;
        }
        
        public ViewResult List(string category = null, string status = null, bool? taken = null, int page = 1) {
            var pageIndex = page - 1;
            var questions = _unitOfWork.QuestionRepository.Get();
            if (category != null)
                questions = questions.WithCategory(category);

            questions = status == "Active" ? questions.Active()
                            : status == "Closed" ? questions.Closed() : questions;

            questions = taken == null ? questions : taken.Value ? questions.Taken() : questions.NotTaken();
            questions = questions.OrderBy(x => x.CreatedDate);

            ViewBag.Category = category;
            ViewBag.Status = status;
            ViewBag.Taken = taken;

            var model = questions.ToPagedList(pageIndex, 5);

            return View(model);
        }

        [HttpGet]
        public ActionResult ConfirmDenial(string username)
        {
            var model = UserProfile.GetUserProfile(username);

            return View(model);
        }

        [HttpPost]
        public ActionResult Deny(string username)
        {
            Membership.DeleteUser(username);

            return RedirectToAction("AccountList");
        }

        public ActionResult ConfirmApproval(string username) {
            var model = UserProfile.GetUserProfile(username);

            return View(model);
        }

        public ActionResult Approve(string username)
        {
            Roles.RemoveUserFromRole(username, UserRoles.PendingApproval);
            Roles.AddUserToRole(username, UserRoles.Attorney);

            var user = Membership.GetUser(username);

            if (user != null)
                _emailService.SendEmailTo(user.Email, new StandardEmail(StandardEmail.EmailTemplate.AccountApproved));

            return RedirectToAction("AccountList");
        }

        [HttpPost]
        public JsonResult FindAccounts(string searchText, int maxResults)
        {
            var users = Membership.GetAllUsers().Cast<MembershipUser>().ToList();
            var profiles = users.Select(u => UserProfile.GetUserProfile(u.UserName)).ToList();

            var model = profiles.Search(searchText)
                .Select(x => new
                    {
                        Key = x.UserName,
                        Value = string.Format("{0} ({1}, DBN: {2})", x.FullName, x.UserName, x.DisciplinaryBoardNumber)
                    }).ToList();

            return Json(model);
        }

        [HttpPost]
        public PartialViewResult SearchAccounts(string searchText, string searchTextBox)
        {
            var text = string.IsNullOrEmpty(searchText) ? searchTextBox : searchText;
            var users = Membership.GetAllUsers().Search(searchText);

            var model = users.ToUserModels().ToPagedList(0, 5);
            //var model = AccountListViewModel.CreateViewModel(null, 1, users);

            return PartialView("_AccountList", model);
        }

        public ActionResult AccountList(string role, int page = 1, string userName = null) {
            var pageIndex = page - 1;
            var usersInRole = userName != null ? new[] { userName} : role != null ? Roles.GetUsersInRole(role) : null;

            var users = usersInRole != null
                            ? Membership.GetAllUsers().Cast<MembershipUser>().Where(u => usersInRole.Contains(u.UserName))
                            : Membership.GetAllUsers().Cast<MembershipUser>();

            ViewBag.Role = role;
            ViewBag.UserName = userName;

            var model = users.ToUserModels().ToPagedList(pageIndex, 5);

            return View(model);
        }

        public ActionResult Edit(int id)
        {
            var question = _unitOfWork.QuestionRepository.Get().WithId(id);
            var posts = _unitOfWork.PostRepository.Get().WithQuestionId(id);
            var categories = _unitOfWork.CategoryRepository.Get();
            var users = Roles.GetUsersInRole(UserRoles.Attorney);

            var model = EditViewModel.CreateViewModel(question, posts, categories, users);
            return View(model);
        }

        //
        // POST: /Attorney/Edit/EditViewModel
        [HttpPost]
        public ActionResult Edit(EditViewModel editViewModel)
        {
            var question = _unitOfWork.QuestionRepository.Get().WithId(editViewModel.QuestionId);

            question.CategoryId = editViewModel.CategoryId;
            question.Assign(editViewModel.AssignedTo);

            _unitOfWork.Save();

            if (!string.IsNullOrEmpty(editViewModel.AssignedTo))
            {
                var user = Membership.GetUser(editViewModel.AssignedTo);

                if (user != null)
                    _emailService.SendEmailTo(user.Email,
                                              new StandardEmail(StandardEmail.EmailTemplate.QuestionAssigned));
            }

            return RedirectToAction("Details", "Attorney", new { id = editViewModel.QuestionId });
        }

        [HttpPost]
        public ActionResult UnTake(int id)
        {
            var question = _unitOfWork.QuestionRepository.Get().WithId(id);

            question.UnTake();
            _unitOfWork.Save();

            return RedirectToAction("Details", "Attorney", new {id = id});
        }


        [HttpPost]
        public ActionResult Open(int id, string returnUrl)
        {
            var question = _unitOfWork.QuestionRepository.Get().WithId(id);
            question.Open();
            _unitOfWork.Save();
            return Redirect(returnUrl);
        }

        [HttpPost]
        public ActionResult RemoveUsers(string[] userNames)
        {
#if FUTURES
            //var usersToDelete = userNames.Where(x => x != "false");
            var usersToDelete = Membership.GetAllUsers().Cast<MembershipUser>()
                .Where(m => m.UserName.ToLower() != "talsadmin")
                .Select(m => m.UserName);

            _unitOfWork.DeleteDataFor(usersToDelete);

            foreach (string userName in usersToDelete)
            {
                Membership.DeleteUser(userName);
            }
#endif
            return RedirectToAction("AccountList");
        }

        [HttpGet]
        public ViewResult UsersOnline()
        {
            var users = Membership.GetAllUsers().Cast<MembershipUser>();
            var attorneys = Roles.GetUsersInRole(UserRoles.Attorney);
            var clients = Roles.GetUsersInRole(UserRoles.BasicUser);

            var model = new UsersOnlineViewModel
                            {
                                TotalUsers = users.Where(x => x.IsOnline).Count(),
                                Attorneys = users.Where(x => attorneys.Contains(x.UserName) && x.IsOnline).Count(),
                                Clients = users.Where(x => clients.Contains(x.UserName) && x.IsOnline).Count()
                            };

            return View(model);
        }
    }
}
