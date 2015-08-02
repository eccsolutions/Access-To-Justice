using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Tals.ProBono.Web.Models.View.Account
{
    public class ForgotPasswordModel
    {
        [Required]
        [DisplayName("User Name")]
        public string UserName { get; set; }
    }
}