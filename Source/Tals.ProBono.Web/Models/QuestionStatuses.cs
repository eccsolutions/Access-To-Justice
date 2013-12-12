using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Tals.ProBono.Web.Models
{
    public static class QuestionStatuses
    {
        public static string Closed { get { return "Closed"; } }
        public static string Taken { get { return "Taken"; } }
        public static string NotTaken { get { return "NotTaken"; } }
    }
}