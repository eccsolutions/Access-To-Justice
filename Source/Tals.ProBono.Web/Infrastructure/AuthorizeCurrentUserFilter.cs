using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Tals.ProBono.Domain.Abstract;
using Tals.ProBono.Domain.Services;

namespace Tals.ProBono.Web.Infrastructure
{
    public class AuthorizeCurrentUserFilter : ActionFilterAttribute {
        readonly IRoles _roles;
        const string UserNameKey = "userName";

        public AuthorizeCurrentUserFilter() : this(new RolesWrapper()) {
            
        }

        public AuthorizeCurrentUserFilter(IRoles roles) {
            _roles = roles;
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext) {
            if (filterContext.ActionParameters.ContainsKey(UserNameKey)) {
                var userName = filterContext.ActionParameters[UserNameKey] as string;
                var currentUserName = filterContext.HttpContext.User.Identity.Name;

                userName = string.IsNullOrEmpty(userName) ? currentUserName : userName;

                if (currentUserName != userName) {
                    if (_roles.IsUserInRole(UserRoles.BasicUser))
                        SetResult(filterContext);

                    if (_roles.IsUserInRole(UserRoles.Attorney) && _roles.IsUserInRole(userName, UserRoles.Attorney))
                        SetResult(filterContext);
                }
            }
            base.OnActionExecuting(filterContext);
        }

        static void SetResult(ActionExecutingContext filterContext) {
            filterContext.Result = new RedirectToRouteResult(
                new RouteValueDictionary {
                    {"controller", "Account"},
                    {"action", "SignIn"}
                });
        }
    }
}