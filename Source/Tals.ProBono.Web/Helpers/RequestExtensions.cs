using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace Tals.ProBono.Web.Helpers
{
    public static class RequestExtensions
    {
        public static bool IsCurrentRoute(this RequestContext context, String areaName, String controllerName, params String[] actionNames)
        {
            var routeData = context.RouteData;
            var routeArea = routeData.DataTokens["area"] as String;
            var current = false;

            if (((String.IsNullOrEmpty(routeArea) && String.IsNullOrEmpty(areaName)) || (routeArea == areaName)) && 
                ((String.IsNullOrEmpty(controllerName)) || (routeData.GetRequiredString("controller") == controllerName)) &&
                ((actionNames == null) || actionNames.Contains(routeData.GetRequiredString("action"))))
            {
                current = true;
            }

            return current;
        }

        public static string CurrentAction(this RequestContext context)
        {
            return context.RouteData.GetRequiredString("action");
        }
    }
}