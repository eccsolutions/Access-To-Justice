using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Tals.ProBono.Domain.Abstract;
using Tals.ProBono.Domain.Filters;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Infrastructure;
using Tals.ProBono.Web.Models;
using ViewRes;

namespace Tals.ProBono.Web.Controllers
{

    [HandleError]
    [DynamicMasterPageFilter]
    public class AccountController : Controller
    {
        private readonly IQuestionRepository _repository;
        private readonly IEmailService _emailService;
        readonly IUser _currentUser;

        public AccountController(IQuestionRepository repository, IFormsAuthenticationService formsService, IMembershipService membershipService, IEmailService emailService, IUser currentUser)
        {
            _repository = repository;
            FormsService = formsService;
            MembershipService = membershipService;
            _emailService = emailService;
            _currentUser = currentUser;
        }
        
        public IFormsAuthenticationService FormsService { get; set; }
        public IMembershipService MembershipService { get; set; }

        // **************************************
        // URL: /Account/SignIn
        // **************************************

        public ActionResult SignIn()
        {
            InitializeMembership();
            return View("SignIn", "Guest");
        }

        private void InitializeMembership()
        {
            if (!Roles.RoleExists(UserRoles.Administrators))
            {
                Roles.CreateRole(UserRoles.Administrators);
            }
            if (!Roles.RoleExists(UserRoles.Attorney))
            {
                Roles.CreateRole(UserRoles.Attorney);
            }
            if (!Roles.RoleExists(UserRoles.BasicUser))
            {
                Roles.CreateRole(UserRoles.BasicUser);
            }
            if (!Roles.RoleExists(UserRoles.PendingApproval))
            {
                Roles.CreateRole(UserRoles.PendingApproval);
            }
            if (Membership.GetUser("atjadmin") == null)
            {
                Membership.CreateUser("atjadmin", "@tj@dm1n");
                Roles.AddUserToRole("atjadmin", UserRoles.Administrators);
            }
        }


        [HttpPost]
        public ActionResult SignIn(SignInModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                if (MembershipService.ValidateUser(model.UserName, model.Password))
                {
                    FormsService.SignIn(model.UserName, model.RememberMe);
                    if (!String.IsNullOrEmpty(returnUrl))
                    {
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "The user name or password provided is incorrect.");
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        // **************************************
        // URL: /Account/SignOut
        // **************************************

        public ActionResult SignOut()
        {
            FormsService.SignOut();
            Session.Abandon();

            if (UserModel.Current.IsInRole(UserRoles.BasicUser))
                return Redirect("http://survey.constantcontact.com/survey/a07e3ge5rijgkh0hfdr/start");

            return RedirectToAction("Index", "Home");
        }

        // **************************************
        // URL: /Account/SignUp
        // **************************************

        public ActionResult SignUp()
        {
            if (!_repository.RuleAnswers.IsUserEligible(Session.SessionID)) return RedirectToAction("Index", "Rules");
            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;

            var model = new SignUpClientModel();

            return View(model);
        }

        [HttpPost]
        public ActionResult SignUp(SignUpClientModel model, string returnUrl)
        {
            if (!_repository.RuleAnswers.IsUserEligible(Session.SessionID)) return RedirectToAction("Index", "Rules");

            if (ModelState.IsValid)
            {
                // Attempt to register the user
                MembershipCreateStatus createStatus = MembershipService.CreateUser(model.UserName, model.Password, model.Email);

                if (createStatus == MembershipCreateStatus.Success)
                {
                    var profile = UserProfile.GetUserProfile(model.UserName);
                    profile.FirstName = model.FirstName;
                    profile.MiddleInitial = model.MiddleInitial;
                    profile.LastName = model.LastName;
                    profile.RegistrationDate = DateTime.Now;
                    if(Session["County"] != null)
                    {
                        var countyId = int.Parse(Session["County"].ToString());
                        profile.County = _repository.Counties.First(x => x.Id == countyId).CountyName;
                    }
                    
                    profile.Save();

                    Roles.AddUserToRole(model.UserName, UserRoles.BasicUser);
                    FormsService.SignIn(model.UserName, false /* createPersistentCookie */);

                    _emailService.SendEmailTo(model.Email, new ClientRegistrationEmail(model.UserName));

                    if (!String.IsNullOrEmpty(returnUrl))
                    {
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ModelState.AddModelError("", AccountValidation.ErrorCodeToString(createStatus));
                }
            }

            // If we got this far, something failed, redisplay form
            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
            return View(model);
        }

        public ActionResult AttorneyFAQ() {
            return View("AttorneyFAQ");
        }

        public ActionResult UseAgreement()
        {
            return View();
        }

        public ActionResult AcceptUseAgreement(bool accepted)
        {
            Session["AcceptedUseAgreement"] = accepted;

            if (!accepted)
                return RedirectToAction("Index", "Home");

            return RedirectToAction("AttorneySignUp");
        }

        public ActionResult AttorneyUseAgreement()
        {
            return View();
        }

        public ActionResult AttorneySignUp()
        {
            if (Session["AcceptedUseAgreement"] != null && ((bool)Session["AcceptedUseAgreement"]) == true)
            {
                ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
                
                var model = new AttorneySignUpModel
                {
                    Counties = new SelectList(_repository.Counties.ToList(), "Id", "CountyName")
                };

                return View(model);
            }

            return RedirectToAction("UseAgreement");
        }

        [HttpPost]
        public ActionResult AttorneySignUp(AttorneySignUpModel model)
        {
            if (ModelState.IsValid)
            {
                // Attempt to register the user
                MembershipCreateStatus createStatus = MembershipService.CreateAttorney(model.UserName, model.Password, model.Email);

                if (createStatus == MembershipCreateStatus.Success)
                {
                    var profile = UserProfile.GetUserProfile(model.UserName);
                    profile.FirstName = model.FirstName;
                    profile.MiddleInitial = model.MiddleInitial;
                    profile.LastName = model.LastName;
                    profile.AddressLine1 = model.AddressLine1;
                    profile.AddressLine2 = model.AddressLine2;
                    profile.City = model.City;
                    profile.County = _repository.Counties.First(x => x.Id == model.County).CountyName;
                    profile.DisciplinaryBoardNumber = model.DisciplinaryBoardNumber;
                    profile.LawFirm = model.Organization;
                    profile.Phone = model.Phone;
                    profile.State = model.State;
                    profile.Zip = model.Zip;
                    profile.RegistrationDate = DateTime.Now;

                    profile.Save();

                    Roles.AddUserToRole(model.UserName, UserRoles.PendingApproval);
                    FormsService.SignIn(model.UserName, false /* createPersistentCookie */);

                    _emailService.SendEmailTo(model.Email, new LawyerRegistrationEmail(model.UserName, model.Password));

                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", AccountValidation.ErrorCodeToString(createStatus));
                }
            }

            // If we got this far, something failed, redisplay form
            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
            model.Counties = new SelectList(_repository.Counties.ToList(), "Id", "CountyName");

            return View(model);
        }

        // **************************************
        // URL: /Account/ChangePassword
        // **************************************

        [Authorize]
        public ActionResult ChangePassword()
        {
            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
            var model = new ChangePasswordModel {UserName = UserModel.Current.UserName};

            return View(model);
        }

        [HttpPost]
        public ActionResult ChangePassword(ChangePasswordModel model)
        {
            if (ModelState.IsValid)
            {
                if (MembershipService.ChangePassword(model.UserName, model.OldPassword, model.NewPassword))
                {
                    return RedirectToAction("ChangePasswordSuccess");
                }
                else
                {
                    ModelState.AddModelError("", "The current password is incorrect or the new password is invalid.");
                }
            }

            // If we got this far, something failed, redisplay form
            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
            return View(model);
        }

        // **************************************
        // URL: /Account/ChangePasswordSuccess
        // **************************************

        public ActionResult ChangePasswordSuccess()
        {
            return View();
        }

        [Authorize(Roles = "Administrators")]
        public ActionResult DisableAccount(string userName)
        {
            var user = Membership.GetUser(userName);
            user.IsApproved = false;
            Membership.UpdateUser(user);

            TempData["userName"] = userName;

            return RedirectToAction("Profile", "User", userName);
        }

        [Authorize(Roles = "Administrators")]
        public ActionResult EnableAccount(string userName)
        {
            var user = Membership.GetUser(userName);
            user.IsApproved = true;
            Membership.UpdateUser(user);

            TempData["userName"] = userName;

            return RedirectToAction("Profile", "User", userName);
        }

        [Authorize(Roles = "Administrators")]
        public ActionResult ResetPassword(string userName)
        {
            if (!Roles.IsUserInRole(UserRoles.Administrators, userName))
            {
                var user = Membership.GetUser(userName);

                if (user.IsLockedOut)
                {
                    user.UnlockUser();
                    Membership.UpdateUser(user);
                }

                string newPassword = user.ResetPassword();

                Membership.UpdateUser(user);

                var model = new ResetPasswordViewModel
                                {
                                    UserName = userName,
                                    NewPassword = newPassword
                                };

                return RedirectToAction("ResetPasswordSuccess", "Account", model);
            }

            return RedirectToAction("Profile", "User", userName);
        }

        public ActionResult ResetPasswordSuccess(ResetPasswordViewModel model)
        {
            return View(model);
        }

        public ActionResult ChangeCulture(string lang, string returnUrl)
        {
            // Validate input
            lang = CultureHelper.GetValidCulture(lang);

            // Save culture in a cookie
            HttpCookie cookie = Request.Cookies["_culture"];
            if (cookie != null)
                cookie.Value = lang;
            else
            {
                cookie = new HttpCookie("_culture") { HttpOnly = false, Value = lang, Expires = DateTime.Now.AddYears(1) };
            }
            Response.Cookies.Add(cookie);

            return Redirect(returnUrl);
        }

        public ActionResult DisplayAdminActions(string username) {
            var user = Membership.GetUser(username);
            return View(user);
        }

        public ActionResult QuestionAndAnswer() {
            var questions = QuestionSelectListItems;

            var model = new QuestionAndAnswerModel() {
                                                         Questions = new SelectList(questions, "Text", "Value")
                                                     };

            return View(model);
        }

        [HttpPost]
        public ActionResult QuestionAndAnswer(QuestionAndAnswerModel model) {
            if(ModelState.IsValid) {
                if(MembershipService.ChangeQuestionAndAnswer(_currentUser.UserName, model.Password, model.Question, model.Answer))
                    return View("QuestionAndAnswerSuccess");

                ModelState.AddModelError("Password", "Incorrect password provided. Please try again.");
            }

            model.Questions = new SelectList(QuestionSelectListItems, "Text", "Value");

            return View(model);
        }

        static IEnumerable<SelectListItem> QuestionSelectListItems
        {
            get
            {
                var questions = new List<SelectListItem>() {
                                                               new SelectListItem()
                                                               {Text = Index.Question1, Value = Index.Question1},
                                                               new SelectListItem()
                                                               {Text = Index.Question2, Value = Index.Question2},
                                                               new SelectListItem()
                                                               {Text = Index.Question3, Value = Index.Question3},
                                                               new SelectListItem()
                                                               {Text = Index.Question4, Value = Index.Question4},
                                                               new SelectListItem()
                                                               {Text = Index.Question5, Value = Index.Question5},
                                                               new SelectListItem()
                                                               {Text = Index.Question6, Value = Index.Question6}
                                                           };
                return questions;
            }
        }

        public ActionResult ForgotPassword() {
            var model = new ForgotPasswordModel();
            return View(model);
        }

        [HttpPost]
        public ActionResult ForgotPassword(ForgotPasswordModel model) {
            if (!ModelState.IsValid) return View(model);

            var question = MembershipService.GetUserQuestion(model.UserName);
            model.Question = question;
            
            return View("ForgotPasswordAnswer", model);
        }

        [HttpPost]
        public ActionResult ForgotPasswordAnswer(ForgotPasswordModel model) {
            if(ModelState.IsValid) {
                var password = MembershipService.ResetPassword(model.UserName, model.Answer);
                var changePasswordModel = new ChangePasswordModel() {UserName = model.UserName, OldPassword = password};

                return View("ChangePassword", changePasswordModel);
            }

            return View(model);
        }
    }

    public class ForgotPasswordModel {
        [Required]
        [DisplayName("User name")]
        public string UserName { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }
    }
}
