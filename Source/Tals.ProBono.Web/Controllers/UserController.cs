using System.Collections.Generic;
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
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRoles _roles;
        readonly IUser _currentUser;

        public UserController(IUnitOfWork unitOfWork, IRoles roles, IUser currentUser)
        {
            _unitOfWork = unitOfWork;
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
                                                       QuestionsAsked = _unitOfWork.QuestionRepository.Get().WithCreatedBy(userName).Count(),
                                                       QuestionsInQueue = _unitOfWork.QuestionRepository.Get().WithCreatedBy(userName).Active().NotTaken().Count(),
                                                       QuestionsTaken = _unitOfWork.QuestionRepository.Get().WithCreatedBy(userName).Active().Taken().Count()
                                                   };

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
            model.SetCountySelectList(_unitOfWork.CountyRepository.Get());

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

            model.SetCountySelectList(_unitOfWork.CountyRepository.Get());

            return View("EditAttorneyProfile", model);
        }


        public ActionResult QuestionHistory(string userName, int page = 1) {
            var pageIndex = page - 1;
            var questionsToShow = (Roles.IsUserInRole(userName, UserRoles.Attorney)
                                       ? _unitOfWork.QuestionRepository.Get().WithTakenBy(userName)
                                       : _unitOfWork.QuestionRepository.Get().WithCreatedBy(userName)).OrderBy(
                                           x => x.CreatedDate);

            var model = questionsToShow.ToPagedList(pageIndex, PageSize);

            ViewBag.UserName = userName;
            return View("QuestionHistory", model);
        }

        public ActionResult YearToDateHours(string userName)
        {
            //<%: Model.YearToDateHours == null ? 0 : Model.YearToDateHours.Value %>
            //if _unitOfWork.WorkEntryRepository.Get().YearToDateHours == null ? 0
            //var yearToDateLoggedHours = _unitOfWork.WorkEntryRepository.Get().YearToDateFor(userName);

            var entries = _unitOfWork.WorkEntryRepository.Get().YearToDateFor(UserModel.Current.UserName);
            double model = entries.Any()
                                      ? entries.Sum(x => x.Hours)
                                      : 0;
            //double model = _unitOfWork.WorkEntryRepository.Get().YearToDateFor(userName).Sum(w => w.Hours);

            return View(model);
        }
    }
}
