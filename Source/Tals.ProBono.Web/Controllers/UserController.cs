using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using MvcPaging;
using Tals.ProBono.Domain.Abstract;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Filters;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Infrastructure;
using Tals.ProBono.Web.Models;

namespace Tals.ProBono.Web.Controllers
{
    [AuthorizeCurrentUserFilter]
    [DynamicMasterPageFilter]
    public class UserController : Controller
    {
        private readonly IQuestionRepository _questionRepository;
        private readonly IRoles _roles;
        readonly IUser _currentUser;

        public UserController(IQuestionRepository questionRepository, IRoles roles, IUser currentUser)
        {
            _questionRepository = questionRepository;
            _roles = roles;
            _currentUser = currentUser;
        }

        public int PageSize { get { return 5; } }

        public ActionResult Profile(string userName) {
            userName = userName ?? _currentUser.UserName;
            ViewData["UserName"] = userName;

            if (_roles.IsUserInRole(userName, UserRoles.Attorney) || _roles.IsUserInRole(userName, UserRoles.PendingApproval))
                return View("AttorneyProfile");

            return View("ClientProfile");
        }

        public ActionResult DisplayAccountInfo(string userName) {
            var model = new AccountInfoViewModel();
            var user = Membership.GetUser(userName);

            if (user != null) {
                model.Email = user.Email;
                model.LastLoginDate = user.LastLoginDate;
                model.UserName = user.UserName;
            }

            return View(model);
        }

        public ActionResult EditAccountInfo(string userName) {
            var model = new AccountInfoViewModel();
            var user = Membership.GetUser(userName);

            if (user != null)
            {
                model.Email = user.Email;
                model.LastLoginDate = user.LastLoginDate;
                model.UserName = user.UserName;
            }

            return View("EditAccountInfo", model);
        }

        [HttpPost]
        public ActionResult EditAccountInfo(AccountInfoViewModel model) {
            if (ModelState.IsValid) {
                var user = Membership.GetUser(model.UserName);

                if (user != null) {
                    user.Email = model.Email;
                    Membership.UpdateUser(user);
                }

                return RedirectToAction("Profile", new { userName = model.UserName });
            }

            return View("EditAccountInfo", model);
        }

        public ActionResult DisplayClientProfile(string userName) {
            var model = new ClientProfileViewModel {
                                                       QuestionsAsked = _questionRepository.Questions.WithCreatedBy(userName).Count(),
                                                       QuestionsInQueue = _questionRepository.Questions.WithCreatedBy(userName).Active().NotTaken().Count(),
                                                       QuestionsTaken = _questionRepository.Questions.WithCreatedBy(userName).Active().Taken().Count()
                                                   };

            return View(model);
        }

        [Authorize(Roles = UserRoles.Administrators)]
        public ActionResult EditClientProfile(string userName) {
            var model = new EditClientProfileViewModel(UserProfile.GetUserProfile(userName));
            model.SetCountySelectList(_questionRepository.Counties);

            return View(model);
        }

        [HttpPost]
        public ActionResult EditClientProfile(EditClientProfileViewModel model) {
            if (ModelState.IsValid) {
                var profile = UserProfile.GetUserProfile(model.UserName);
                profile.FirstName = model.FirstName;
                profile.LastName = model.LastName;
                profile.MiddleInitial = model.MiddleInitial;
                profile.County = model.County;

                profile.Save();

                return RedirectToAction("Profile", new {userName = model.UserName});
            }

            model.SetCountySelectList(_questionRepository.Counties);
            return View(model);
        }

        public ActionResult DisplayAttorneyProfile(string userName)
        {
            IUserProfile model = UserProfile.GetUserProfile(userName);
            return View(model);
        }

        public ActionResult EditAttorneyProfile(string userName) {
            var profile = UserProfile.GetUserProfile(userName);
            var model = new AttorneyProfileViewModel(profile);
            model.SetCountySelectList(_questionRepository.Counties);

            return View("EditAttorneyProfile", model);
        }

        [HttpPost]
        public ActionResult EditAttorneyProfile(AttorneyProfileViewModel model) {
            if (ModelState.IsValid) {
                var profile = UserProfile.GetUserProfile(model.UserName);
                profile.LawFirm = model.LawFirm;
                profile.Phone = model.Phone;
                profile.AddressLine1 = model.AddressLine1;
                profile.AddressLine2 = model.AddressLine2;
                profile.City = model.City;
                profile.State = model.State;
                profile.Zip = model.Zip;
                profile.County = model.County;

                profile.Save();

                return RedirectToAction("Profile", new {userName = model.UserName });
            }

            model.SetCountySelectList(_questionRepository.Counties);

            return View("EditAttorneyProfile", model);
        }


        public ActionResult QuestionHistory(string userName, int page = 1) {
            var pageIndex = page - 1;
            var questionsToShow = (Roles.IsUserInRole(userName, UserRoles.Attorney)
                                       ? _questionRepository.Questions.WithTakenBy(userName)
                                       : _questionRepository.Questions.WithCreatedBy(userName)).OrderBy(
                                           x => x.CreatedDate);

            var model = questionsToShow.ToPagedList(pageIndex, PageSize);

            ViewBag.UserName = userName;

            return View("QuestionHistory", model);
        }
    }
}