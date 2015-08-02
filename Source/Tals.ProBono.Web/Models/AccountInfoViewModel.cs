using System;
using System.ComponentModel.DataAnnotations;

namespace Tals.ProBono.Web.Models {
    public class AccountInfoViewModel {
        
        public string Email { get; set; }
        
        public DateTime LastLoginDate { get; set; }
        
        [Required]
        public string UserName { get; set; }
    }
}