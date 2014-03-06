using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Web.Models;

namespace Tals.ProBono.Web.Controllers
{
    public class RulesController : Controller
    {
        public int CurrentStepNumber
        {
            get
            {
                var value = Session["CurrentStepNumber"];
                return value == null ? 1 : (int)value;
            }
            set { Session["CurrentStepNumber"] = value; }
        }

        public IUnitOfWork UnitOfWork { get; set; }

        public RulesController()
        {
            if (UnitOfWork == null) UnitOfWork = new UnitOfWork();
        }

        //
        // GET: /Rules/

        public ActionResult Index()
        {
            CurrentStepNumber = 1;
            return RedirectToAction("Step" + CurrentStepNumber);
        }

        public ActionResult Step1()
        {
            return RenderStep(new StartSignupQuestion(), 1);
        }

        public ActionResult StartSignup()
        {
            return ExecuteStep(new StartSignupQuestion(), 1);
        }
        
        public ActionResult Step2()
        {
            ViewData["Counties"] = new SelectList(UnitOfWork.CountyRepository.Get().OrderBy(x => x.CountyName), "Id", "CountyName");
            return RenderStep(new CountyQuestion(), 2);
        }

        [HttpPost]
        public ActionResult Step2(CountyQuestion countyQuestion)
        {
            Session["County"] = countyQuestion.ToString();
            return ExecuteStep(countyQuestion, 2);
        }

        public ActionResult Step3()
        {
            ViewData["Counties"] = new SelectList(UnitOfWork.CountyRepository.Get().OrderBy(x => x.CountyName), "Id", "CountyName");
            return RenderStep(new CaseCountyQuestion(), 3);
        }

        [HttpPost]
        public ActionResult Step3(CaseCountyQuestion casecountyQuestion)
        {
            Session["CaseCounty"] = casecountyQuestion.ToString();
            return ExecuteStep(casecountyQuestion, 3);
        }

        public ActionResult Step4()
        {
            ViewData["Categories"] = new SelectList(UnitOfWork.CategoryRepository.Get(), "Id", "CategoryName");
            return RenderStep(new CategoryQuestion(), 4);
        }

        [HttpPost]
        public ActionResult Step4(CategoryQuestion categoryQuestion)
        {
            return ExecuteStep(categoryQuestion, 4);
        }     
        
        public ActionResult Step5()
        {
            return RenderStep(new AgeQuestion(), 5);
        }

        [HttpPost]
        public ActionResult Step5(AgeQuestion ageQuestion)
        {
            return ExecuteStep(ageQuestion, 5);
        }

        //public ActionResult Step4()
        //{
        //    return RenderStep(new IncarceratedQuestion(), 4);
        //}

        //[HttpPost]
        //public ActionResult Step4(IncarceratedQuestion incarceratedQuestion)
        //{
        //    return ExecuteStep(incarceratedQuestion, 4);
        //}

        public ActionResult Step6()
        {
            return RenderStep(new HouseHoldSizeQuestion(), 6);
        }

        [HttpPost]
        public ActionResult Step6(HouseHoldSizeQuestion houseHoldSizeQuestion)
        {
            return ExecuteStep(houseHoldSizeQuestion, 6, new { HouseHoldSize = houseHoldSizeQuestion.Answer });
        }

        public ActionResult Step7(int? houseHoldSize)
        {
            if (houseHoldSize == null) CurrentStepNumber = 6;
            var value = houseHoldSize ?? 0;
            var question = new IncomeQuestion(value);
            ViewData["Frequencies"] = question.Frequencies;

            return RenderStep(question, 7);
        }

        [HttpPost]
        public ActionResult Step8([Bind(Prefix = "Answer")]IncomeQuestion incomeQuestion)
        {
            ViewData["Frequencies"] = incomeQuestion.Frequencies;
            return ExecuteStep(incomeQuestion, 8);
        }

        public ActionResult Step9()
        {
            return RenderStep(new UserAgreementQuestion(), 9);
        }

        public ActionResult AcceptUseAgreement(bool accepted)
        {
            return ExecuteStep(new UserAgreementQuestion() { Answer = accepted }, 9);
        }
        

        //public ActionResult Step7()
        //{
        //    return RenderStep(new InvestmentQuestion(), 7);
        //}

        //[HttpPost]
        //public ActionResult Step7([Bind(Prefix = "Answer")]InvestmentQuestion investmentQuestion)
        //{
        //    return ExecuteStep(investmentQuestion, 7);
        //}

        public ActionResult Step10()
        {
            if (CurrentStepNumber != 10)
                return RedirectToAction("Step" + CurrentStepNumber);

            RecordAnswer(new MeetsRules() { Answer = true });

            return Request.IsAuthenticated ? RedirectToAction("Ask", "Client") : RedirectToAction("SignUp", "Account");
        }

        private ActionResult RenderStep<T>(IRuleQuestion<T> question, int currentStepNumber)
        {
            if (currentStepNumber != CurrentStepNumber)
                return RedirectToAction("Step" + CurrentStepNumber);

            ViewData["StepName"] = "Step " + CurrentStepNumber;
            return View("CheckRule", question);
        }

        private ActionResult ExecuteStep<T>(IRuleQuestion<T> question, int currentStep, object routeValues = null)
        {
            if (currentStep != CurrentStepNumber)
                return RedirectToAction("Step" + CurrentStepNumber);

            RecordAnswer(question);

            if (!ModelState.IsValid) return View("CheckRule", question);

            if (IsValid(question))
            {
                CurrentStepNumber++;
                return RedirectToAction("Step" + CurrentStepNumber, routeValues);
            }

            CurrentStepNumber = 1;
            return View("NotEligible");
        }

        private static bool IsValid<T>(IRuleQuestion<T> question)
        {
            return question.IsValid;
        }

        private void RecordAnswer<T>(IRuleQuestion<T> question)
        {
            var answer = new RuleAnswer()
            {
                Question = question.Question,
                Answer = question.ToString(),
                IsEligible = question.IsValid,
                SessionID = System.Web.HttpContext.Current.Session.SessionID,
                UserHostAddress = System.Web.HttpContext.Current.Request.UserHostAddress
            };

            //UnitOfWork.AddToRuleAnswers(answer);
            UnitOfWork.RuleAnswerRepository.Insert(answer);
            UnitOfWork.Save();
        }
    }
}
