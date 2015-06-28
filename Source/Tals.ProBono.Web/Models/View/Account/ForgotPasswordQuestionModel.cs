using System.ComponentModel.DataAnnotations;

namespace Tals.ProBono.Web.Models.View.Account
{
    public class ForgotPasswordQuestionModel : ForgotPasswordModel
    {
        public string Question { get; set; }
        
        [Required]
        public string Answer { get; set; }
    }
}