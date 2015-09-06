using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web.Mvc;
using Tals.ProBono.Domain.Services;

namespace Tals.ProBono.Domain.Entities
{
    public interface IRuleQuestion<T>
    {
        string Question { get; }
        T Answer { get; set; }
        bool IsValid { get; }
    }

    /*public class AgeQuestion : IRuleQuestion<int>
    {
        public string Question
        {
            get { return "How old are you? (You must be at least "+ConfigSettings.MinimumAgeRequirement+" years old)."; }
        }

        [Required]
        [Range(1, 999)]
        [DisplayName("Age")]
        public int Answer { get; set; }

        public bool IsValid
        {
            get { return Answer >= ConfigSettings.MinimumAgeRequirement; }
        }

        public override string ToString()
        {
            return Answer.ToString();
        }
    }*/

    public class BirthDateQuestion : IRuleQuestion<DateTime?>
    {
        public string Question
        {
            get { return "When where you born? (You must be at least " + ConfigSettings.MinimumAgeRequirement + " years old). "; }
        }

        [Required]
        [DisplayName("Date of Birth")]
        [UIHint("BirthDateEditor")]
        public DateTime? Answer { get; set; }

        public bool IsValid
        {
            get
            {
                if (Answer == null)
                {
                    return false;
                }

                return new DateTime(Answer.Value.Year, Answer.Value.Month, Answer.Value.Day, 0, 0, 0).AddYears(ConfigSettings.MinimumAgeRequirement) <= DateTime.Now;
            }
        }

        public override string ToString()
        {
            return Answer.ToString();
        }
    }

    public class OpposingPartyQuestion : IRuleQuestion<string>
    {
        public string Question
        {
            get { return "Please enter the name of the opposing party."; }
        }

        [DisplayName("Opposing Party Name")]
        public string Answer { get; set; }

        public bool IsValid
        {
            get { return true; }
        }

        public override string ToString()
        {
            return Answer.ToString();
        }
    }

    public class CountyQuestion : IRuleQuestion<int>
    {
        public string Question
        {
            get { return "This website is only for " + ConfigSettings.StateName + " residents.  What " + ConfigSettings.StateName + " county do you live in? (If you do not live in " + ConfigSettings.StateName + " but have a legal problem here please choose that county.)"; }
        }

        [UIHint("CountyEditor")]
        public int Answer { get; set; }

        public bool IsValid
        {
            get { return true; }
        }

        public override string ToString()
        {
            return Answer.ToString();
        }
    }

    public class CategoryQuestion : IRuleQuestion<int>
    {
        public string Question
        {
            get { return "What type of legal issue do you have?"; }
        }

        [UIHint("CategoryEditor")]
        public int Answer { get; set; }

        public bool IsValid
        {
            get { return true; }
        }

        public override string ToString()
        {
            return Answer.ToString();
        }
    }

    public class UserAgreementQuestion : IRuleQuestion<bool>
    {
        public string Question
        {
            get { return "User Agreement"; }
        }

        [UIHint("UserAgreementEditor")]
        public bool Answer { get; set; }

        public bool IsValid
        {
            get { return Answer; }
        }

        public override string ToString()
        {
            return Answer.ToString();
        }
    }

    public class StartSignupQuestion : IRuleQuestion<bool>
    {
        public string Question
        {
            get
            {
                return "New User Signup"; 
            }
        }           

        [UIHint("UserSignupEditor")]
        public bool Answer { get; set; }

        public bool IsValid
        {
            get { return true; }
        }

        public override string ToString()
        {
            return Answer.ToString();
        }
    }

    //public class IncarceratedQuestion : IRuleQuestion<bool>
    //{
    //    public string Question
    //    {
    //        get { return "Are you currently in a jail or prison?"; }
    //    }

    //    [UIHint("BoolEditor")]
    //    public bool Answer { get; set; }

    //    public bool IsValid
    //    {
    //        get { return !Answer; }
    //    }

    //    public override string ToString()
    //    {
    //        return Answer.ToString();
    //    }
    //}

    public class HouseHoldSizeQuestion : IRuleQuestion<int>
    {

        public HouseHoldSizeQuestion()
        {
            this.Answer = 1;
        }
        
        public string Question
        {
            get
            {
                return
                    "List the number of people that live in your household. Include yourself as one of the people. Include anyone else in your household who you support or who helps support you.";
            }
        }

        [Range(1, 999, ErrorMessage = "You must enter at least 1.")]
        public int Answer { get; set; }

        public bool IsValid
        {
            get { return true; }
        }

        public override string ToString()
        {
            return Answer.ToString();
        }
    }

    public class IncomeQuestion : IRuleQuestion<List<IncomeItem>>
    {
        public int HouseHoldSize { get; set; }

        public IncomeQuestion() { }

        public IncomeQuestion(int houseHoldSize)
        {
            HouseHoldSize = houseHoldSize;
            Answer = new List<IncomeItem>();

            for(int i = 0; i< HouseHoldSize; i++)
            {
                Answer.Add(new IncomeItem());
            }
        }

        private int AllowedIncome
        {
            get {
                const int baseAmount = 13963;
                const int perHouseHoldMemberAmount = 4950;
                const int twoHundredPercent = 2;
                var houseHoldMembers = Answer.Count() - 1;

                return (baseAmount + (houseHoldMembers*perHouseHoldMemberAmount))*twoHundredPercent;
            }
        }
        public string Question
        {
            get
            {
                return
                    "Income is money you get from things like jobs and government benefits (like unemployment). Specify the income for you and for each person in your household.";
            }
        }

        [UIHint("IncomeEditor")]
        public List<IncomeItem> Answer { get; set; }

        public bool IsValid
        {
            get
            {
                if (Answer == null) return false;
                //EDG: Commented out to allow all users regardless of income.
                //return Answer.Sum(i => i.AnnualIncome) <= AllowedIncome;
                return true;
            }
        }

        public IEnumerable<SelectListItem> Frequencies
        {
            get
            {
                var list = new Dictionary<int, string>
                       {
                           {0, "Weekly"},
                           {1, "Every two weeks"},
                           {2, "Twice a month"},
                           {3, "Monthly"}
                       };

                return new SelectList(list, "Key", "Value");
            }
        }

        public override string ToString()
        {
            return (Answer != null ? Answer.Sum(a => a.AnnualIncome).Value : 0).ToString();
        }
    }

    //public class InvestmentQuestion : IRuleQuestion<List<double>>
    //{
    //    public InvestmentQuestion()
    //    {
    //        Answer = new List<double> {0, 0, 0};
    //    }
    //    public string Question
    //    {
    //        get { return "Please answer the following question in regards to assets"; }
    //    }

    //    [UIHint("InvestmentEditor")]
    //    public List<double> Answer { get; set; }

    //    public bool IsValid
    //    {
    //        get { return Answer.Sum(a => a) < 5000.01; }
    //    }

    //    public override string ToString()
    //    {
    //        return Answer.Sum(a => a).ToString();
    //    }
    //}

    public class MeetsRules : IRuleQuestion<bool>
    {
        public string Question
        {
            get { return "IsEligible"; }
        }

        public bool Answer { get; set; }

        public bool IsValid
        {
            get { return Answer; }
        }

        public override string ToString()
        {
            return Answer.ToString();
        }
    }

    public class IncomeItem
    {
        [Required(ErrorMessage = "Gross Income is required")]
        [DisplayName("Gross Income")]
        public double GrossIncome { get; set; }

        [Required(ErrorMessage = "Frequency is required")]
        public int Frequency { get; set; }

        public double? AnnualIncome
        {
            get
            {
                switch (Frequency)
                {
                    case 0:
                        return GrossIncome * 52; // Weekly
                    case 1:
                        return GrossIncome * 26; // Every two weeks
                    case 2:
                        return GrossIncome * 24; // Twice a month
                    case 3:
                        return GrossIncome * 12; // Monthly
                    default:
                        return 0;
                }
            }
        }
    }
}