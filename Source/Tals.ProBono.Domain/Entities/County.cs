//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Tals.ProBono.Domain.Entities
{
    using System.Collections.Generic;
    
    public class County
    {
        //public County()
        //{
        //    this.Questions = new HashSet<Question>();
        //    this.CaseQuestions = new HashSet<Question>();
        //}
    
        public int Id { get; set; }

        [Required]
        [DisplayName("County Name")]
        [StringLength(300)]
        public string CountyName { get; set; }
    
        public virtual ICollection<Question> Questions { get; set; }
        public virtual ICollection<Question> CaseQuestions { get; set; }
    }
}
