//------------------------------------------------------------------------------
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
    
    public partial class BBCodeItem
    {
        public BBCodeItem()
        {
            this.RequireClosingTag = true;
            this.AutoRenderContent = true;
        }
    
        public int BBCodeID { get; set; }
        public string Tag { get; set; }
        public string BeginTag { get; set; }
        public string EndTag { get; set; }
        public bool RequireClosingTag { get; set; }
        public bool AutoRenderContent { get; set; }
    }
}
