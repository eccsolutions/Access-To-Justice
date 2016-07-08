using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web.Mvc;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Resources;

namespace Tals.ProBono.Domain.Entities
{
    public interface IRuleQuestion<T>
    {
        string Question { get; }
        T Answer { get; set; }
        bool IsValid { get; }
    }

    public class AgeQuestion : IRuleQuestion<int>
    {
        public string Question
        {
            get { return SignUpStep4.Title.Replace("{{MinimumAge}}", ConfigSettings.MinimumAgeRequirement.ToString()); }
        }

        [Required]
        [Range(1, 999, ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "AgeRangeError")]
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
            get { return SignUpStep2.Title.Replace("{{StateName}}", ConfigSettings.StateName); }
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
            get { return SignUpStep3.Title; }
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
                return SignUpStep1.Title; 
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
        public string Question
        {
            get
            {
                return SignUpStep5.Title;
            }
        }

        [Range(1, 999, ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "EnterAtLeastOne")]
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
                return SignUpStep6.Title;
            }
        }

        [UIHint("IncomeEditor")]
        public List<IncomeItem> Answer { get; set; }

        public bool IsValid
        {
            get
            {
                return Answer.Sum(i => i.AnnualIncome) <= AllowedIncome;
            }
        }

        public IEnumerable<SelectListItem> Frequencies
        {
            get
            {
                var list = new Dictionary<int, string>
                       {
                           {0, SignUpStep6.Weekly},
                           {1, SignUpStep6.EveryTwoWeeks},
                           {2, SignUpStep6.TwiceAMonth},
                           {3, SignUpStep6.Monthly}
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