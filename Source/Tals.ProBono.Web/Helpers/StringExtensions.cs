using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Tals.ProBono.Web.Helpers
{
    public static class StringExtensions
    {
        public static string FormatWith(this string str, params object[] args)
        {
            return string.Format(str, args);
        }
    }
}