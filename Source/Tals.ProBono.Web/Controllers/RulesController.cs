using System;
using System.Linq;
using System.Web.Mvc;
using Tals.ProBono.Domain.Constants;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Web.Controllers
{
    public class RulesController : ControllerBase
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
            this.SetViewMessage(this.GetTempMessage());
            return RenderStep(new StartSignupQuestion(), 1);
        }

        [HttpPost]
        public ActionResult Step1(StartSignupQuestion signupQuestion)
        {
            return ExecuteStep(signupQuestion, 1);
        }
        
        public ActionResult Step2()
        {
            ViewData["Counties"] = new SelectList(UnitOfWork.CountyRepository.Get().OrderBy(x => x.CountyName), "Id", "CountyName");
            return RenderStep(new CountyQuestion(), 2);
        }

        [HttpPost]
        public ActionResult Step2(CountyQuestion countyQuestion)
        {
            Session[ApplicationConstants.SIGN_UP_COUNTY_KEY] = countyQuestion.ToString();
            return ExecuteStep(countyQuestion, 2);
        }

        public ActionResult Step3()
        {
            ViewData["Categories"] = new SelectList(UnitOfWork.CategoryRepository.Get(), "Id", "CategoryName");
            return RenderStep(new CategoryQuestion(), 3);
        }

        [HttpPost]
        public ActionResult Step3(CategoryQuestion categoryQuestion)
        {
            return ExecuteStep(categoryQuestion, 3);
        }     
        
        public ActionResult Step4()
        {
            return RenderStep(new AgeQuestion(), 4);
        }

        [HttpPost]
        public ActionResult Step4(AgeQuestion ageQuestion)
        {
            return ExecuteStep(ageQuestion, 4);
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

        public ActionResult Step5()
        {
            return RenderStep(new HouseHoldSizeQuestion(), 5);
        }

        [HttpPost]
        public ActionResult Step5(HouseHoldSizeQuestion houseHoldSizeQuestion)
        {
            return ExecuteStep(houseHoldSizeQuestion, 5, new { HouseHoldSize = houseHoldSizeQuestion.Answer });
        }

        public ActionResult Step6(int? houseHoldSize)
        {
            if (houseHoldSize == null) CurrentStepNumber = 5;
            var value = houseHoldSize ?? 0;
            Session[ApplicationConstants.SIGN_UP_HOUSEHOLD_SIZE_KEY] = value;
            var question = new IncomeQuestion(value);
            ViewData["Frequencies"] = question.Frequencies;

            return RenderStep(question, 6);
        }

        [HttpPost]
        public ActionResult Step6([Bind(Prefix = "Answer")]IncomeQuestion incomeQuestion)
        {
            ViewData["Frequencies"] = incomeQuestion.Frequencies;

            if (CurrentStepNumber != 6)
                return RedirectToAction("Step" + CurrentStepNumber);

            var answer = RecordAnswer(incomeQuestion);

            int parsedInt;
            if (Int32.TryParse(answer.Answer, out parsedInt))
            {
                Session[ApplicationConstants.SIGN_UP_INCOME_KEY] = parsedInt;
            }

            if (!ModelState.IsValid) return View("CheckRule", incomeQuestion);

            if (IsValid(incomeQuestion))
            {
                CurrentStepNumber++;
                return RedirectToAction("Step" + CurrentStepNumber);
            }

            CurrentStepNumber = 1;
            return View("NotEligible");
        }

        public ActionResult Step7()
        {
            return RenderStep(new UserAgreementQuestion(), 7);
        }

        public ActionResult AcceptUseAgreement(bool accepted)
        {
            return ExecuteStep(new UserAgreementQuestion() { Answer = accepted }, 7);
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

        public ActionResult Step8()
        {
            if (CurrentStepNumber != 8)
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

        private RuleAnswer RecordAnswer<T>(IRuleQuestion<T> question)
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

            return answer;
        }
    }
}
