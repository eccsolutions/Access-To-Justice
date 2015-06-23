using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Tals.ProBono.Web.Models.View.Shared;

namespace Tals.ProBono.Web.Models.View.Account
{
    public class ForgotPasswordModel : ViewModelBase
    {
        [Required]
        [DisplayName("User name")]
        public string UserName { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }
    }
}