using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Tals.ProBono.Domain.Constants;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Filters;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Resources;
using Tals.ProBono.Web.Infrastructure;
using Tals.ProBono.Web.Models;
using Tals.ProBono.Web.Models.Shared;
using Tals.ProBono.Web.Models.View.Account;

namespace Tals.ProBono.Web.Controllers
{

    [HandleError]
    [DynamicMasterPageFilter]
    public class AccountController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IEmailService _emailService;
        readonly IUser _currentUser;

        private bool profileAnswersAreValid()
        {
            return (Session[ApplicationConstants.SIGN_UP_COUNTY_KEY] != null && Session[ApplicationConstants.SIGN_UP_INCOME_KEY] != null && Session[ApplicationConstants.SIGN_UP_HOUSEHOLD_SIZE_KEY] != null);
        }

        public AccountController(IUnitOfWork unitOfWork, IFormsAuthenticationService formsService, IMembershipService membershipService, IEmailService emailService, IUser currentUser)
        {
            _unitOfWork = unitOfWork;
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
            return View("SignIn", "Guest");
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

            return RedirectToAction("Index", "Home");
        }

        // **************************************
        // URL: /Account/SignUp
        // **************************************

        public ActionResult SignUp()
        {
            if (!_unitOfWork.RuleAnswerRepository.Get().IsUserEligible(Session.SessionID) || !profileAnswersAreValid())
            {
                return RedirectToAction("Index", "Rules");
            }

            if (!profileAnswersAreValid())
            {
                this.SetTempMessage(MessageDto.CreateWarningMessage(Resources.SignUp.SessionExpired));
                return RedirectToAction("Index", "Rules");
            }

            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;

            var model = new SignUpClientModel()
            {
                SecurityQuestions = new SelectList(QuestionSelectListItems, "Text", "Value")
            };

            return View(model);
        }

        [HttpPost]
        public ActionResult SignUp(SignUpClientModel model, string returnUrl)
        {
            if (!_unitOfWork.RuleAnswerRepository.Get().IsUserEligible(Session.SessionID))
            {
                return RedirectToAction("Index", "Rules");
            }

            if (!profileAnswersAreValid())
            {
                this.SetTempMessage(MessageDto.CreateWarningMessage(Resources.SignUp.SessionExpired));
                return RedirectToAction("Index", "Rules");
            }

            if (ModelState.IsValid)
            {
                //EDG: Check if  e-mail is unique
                if (!String.IsNullOrWhiteSpace(model.Email) && Membership.FindUsersByEmail(model.Email).Count > 0)
                {
                    ModelState.AddModelError("Email", Messages.EmailInUse);
                }
                else
                {
                    // Attempt to register the user
                    MembershipCreateStatus createStatus = MembershipService.CreateUser(model.UserName, model.Password, model.Email, model.SecurityQuestion, model.SecurityQuestionAnswer);

                    if (createStatus == MembershipCreateStatus.Success)
                    {
                        var profile = UserProfile.GetUserProfile(model.UserName);
                        profile.FirstName = model.FirstName;
                        profile.MiddleInitial = model.MiddleInitial;
                        profile.LastName = model.LastName;
                        profile.RegistrationDate = DateTime.Now;

                        var countyId = int.Parse(Session[ApplicationConstants.SIGN_UP_COUNTY_KEY].ToString());
                        profile.County = _unitOfWork.CountyRepository.Get().First(x => x.Id == countyId).CountyName;

                        profile.Income = Session[ApplicationConstants.SIGN_UP_INCOME_KEY] as int?;
                        profile.HouseholdSize = Session[ApplicationConstants.SIGN_UP_HOUSEHOLD_SIZE_KEY] as int?;

                        profile.Save();

                        Roles.AddUserToRole(model.UserName, UserRoles.BasicUser);
                        FormsService.SignIn(model.UserName, false /* createPersistentCookie */);

                        _emailService.SendEmailTo(model.Email, new ClientRegistrationEmail(model.UserName),true);

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
            }

            // If we got this far, something failed, redisplay form
            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;

            model.SecurityQuestions = new SelectList(QuestionSelectListItems, "Text", "Value");
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
                    Counties = new SelectList(_unitOfWork.CountyRepository.Get().ToList(), "Id", "CountyName"),
                    ReferralOrganizations = new SelectList(_unitOfWork.ReferralOrganizationRepository.Get().ToList(),"Id","OrgName"),
                    SecurityQuestions = new SelectList(QuestionSelectListItems, "Text", "Value")
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
                //EDG: Check if attorney e-mail is unique
                if (Membership.FindUsersByEmail(model.Email).Count > 0)
                {
                    ModelState.AddModelError("Email", Messages.EmailInUse);
                }
                else
                {
                    // Attempt to register the user
                    MembershipCreateStatus createStatus = MembershipService.CreateAttorney(model.UserName, model.Password, model.Email, model.SecurityQuestion, model.SecurityQuestionAnswer);

                    if (createStatus == MembershipCreateStatus.Success)
                    {
                        var profile = UserProfile.GetUserProfile(model.UserName);
                        profile.FirstName = model.FirstName;
                        profile.MiddleInitial = model.MiddleInitial;
                        profile.LastName = model.LastName;
                        profile.AddressLine1 = model.AddressLine1;
                        profile.AddressLine2 = model.AddressLine2;
                        profile.City = model.City;
                        profile.County = _unitOfWork.CountyRepository.Get().First(x => x.Id == model.County).CountyName;
                        profile.DisciplinaryBoardNumber = model.DisciplinaryBoardNumber;
                        profile.LawFirm = model.Organization;
                        profile.Phone = model.Phone;
                        profile.State = model.State;
                        profile.Zip = model.Zip;
                        profile.RegistrationDate = DateTime.Now;
                        profile.ReferralOrganization = _unitOfWork.ReferralOrganizationRepository.Get().OrgNameWithId(model.ReferralOrganization.GetValueOrDefault());

                        profile.Save();

                        Roles.AddUserToRole(model.UserName, UserRoles.PendingApproval);
                        FormsService.SignIn(model.UserName, false /* createPersistentCookie */);

                        _emailService.SendEmailTo(model.Email, new LawyerRegistrationEmail(model.UserName), false);

                        //EDG: Send e-mail to admin to approve new attorney
                        _emailService.SendEmailTo(ConfigSettings.SiteEmail, new LawyerRegistrationNotificationEmail(model.UserName, model.FirstName, model.LastName, model.Organization, model.Email, model.Phone, model.DisciplinaryBoardNumber), false);

                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        ModelState.AddModelError("", AccountValidation.ErrorCodeToString(createStatus));
                    }    
                }
            }

            // If we got this far, something failed, redisplay form
            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
            model.Counties = new SelectList(_unitOfWork.CountyRepository.Get().ToList(), "Id", "CountyName");
            model.ReferralOrganizations = new SelectList(_unitOfWork.ReferralOrganizationRepository.Get().ToList(), "Id", "OrgName");
            model.SecurityQuestions = new SelectList(QuestionSelectListItems, "Text", "Value");

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

            return RedirectToAction("Profile", "User", new {userName=userName});
        }

        [Authorize(Roles = "Administrators")]
        public ActionResult EnableAccount(string userName)
        {
            var user = Membership.GetUser(userName);
            user.IsApproved = true;
            Membership.UpdateUser(user);

            TempData["userName"] = userName;

            return RedirectToAction("Profile", "User", new { userName = userName });
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

            return RedirectToAction("Profile", "User", new { userName = userName });
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
            var cookie = Request.Cookies["_culture"];
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
                                                               {Text = Resources.SignUp.SecurityQuestion1, Value = Resources.SignUp.SecurityQuestion1},
                                                               new SelectListItem()
                                                               {Text = Resources.SignUp.SecurityQuestion2, Value = Resources.SignUp.SecurityQuestion2},
                                                               new SelectListItem()
                                                               {Text = Resources.SignUp.SecurityQuestion3, Value = Resources.SignUp.SecurityQuestion3},
                                                               new SelectListItem()
                                                               {Text = Resources.SignUp.SecurityQuestion4, Value = Resources.SignUp.SecurityQuestion4},
                                                               new SelectListItem()
                                                               {Text = Resources.SignUp.SecurityQuestion5, Value = Resources.SignUp.SecurityQuestion5},
                                                               new SelectListItem()
                                                               {Text = Resources.SignUp.SecurityQuestion6, Value = Resources.SignUp.SecurityQuestion6}
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

            var questionModel = new ForgotPasswordQuestionModel()
            {
                Question = question,
                UserName = model.UserName
            };

            return View("ForgotPasswordAnswer", questionModel);
        }

        [HttpPost]
        public ActionResult ForgotPasswordAnswer(ForgotPasswordQuestionModel questionModel)
        {
            if(ModelState.IsValid)
            {
                try
                {
                    var password = MembershipService.ResetPassword(questionModel.UserName, questionModel.Answer);
                    var changePasswordModel = new ChangePasswordModel() { UserName = questionModel.UserName, OldPassword = password };
                    return View("ChangePassword", changePasswordModel);
                }
                catch (MembershipPasswordException ex)
                {
                    this.SetViewMessage(MessageDto.CreateErrorMessage("Answer to security question is not correct"));
                    return View("ForgotPasswordAnswer", questionModel);   
                }
            }

            return View(questionModel);
        }
    }
}
