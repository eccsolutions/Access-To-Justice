using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace Tals.ProBono.Web.Models
{
    public class NavLink
    {
        public string Text { get; set; }
        public string Count { get; set; }
        public RouteValueDictionary RouteValues { get; set; }
        public bool IsSelected { get; set; }
    }
}