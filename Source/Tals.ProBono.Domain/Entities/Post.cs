//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.Web.Mvc;

namespace Tals.ProBono.Domain.Entities
{
    using System;
    using System.Collections.Generic;
    
    public class Post
    {
        public int Id { get; set; }
        public int QuestionId { get; set; }
        public string Subject { get; set; }
        [AllowHtml]
        public string Body { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public bool Accepted { get; private set; }
    
        public virtual Question Question { get; set; }

        public void MarkAccepted()
        {
            Accepted = true;
        }

        public void UnAccept()
        {
            Accepted = false;
        }
    }
}
