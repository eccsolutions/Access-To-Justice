﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Tals.ProBono.Domain.Entities
{
    using System;
    using System.Collections.Generic;

    public class CaseCounty
    {
        //public County()
        //{
        //    this.Questions = new HashSet<Question>();
        //    this.CaseQuestions = new HashSet<Question>();
        //}

        public int Id { get; set; }
        public string CountyName { get; set; }

        public virtual ICollection<Question> Questions { get; set; }
        public virtual ICollection<Question> CaseQuestions { get; set; }
    }
}
