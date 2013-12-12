using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Web.Mvc;
using FakeItEasy;
using Machine.Specifications;
using Tals.ProBono.Domain.Abstract;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Infrastructure;

namespace Tals.ProBono.Web.Specs
{
    public class AuthorizeCurrentUserFilterSpecs
    {
        public class when_client_requests_another_client_profile {
            Establish context = () => {
                filterContext = A.Fake<ActionExecutingContext>();
                roles = A.Fake<IRoles>();
                const string userNameKey = "userName";

                A.CallTo(() => filterContext.ActionParameters.ContainsKey(userNameKey)).Returns(true);
                A.CallTo(() => filterContext.ActionParameters[userNameKey]).Returns(otheruser);
                A.CallTo(() => filterContext.HttpContext.User.Identity.Name).Returns(currentuser);
                A.CallTo(() => roles.IsUserInRole(UserRoles.BasicUser)).Returns(true);
                filter = new AuthorizeCurrentUserFilter(roles);
            };

            Because of = () => filter.OnActionExecuting(filterContext);

            It should_redirect_to_login_page = () => filterContext.Result.ShouldBeOfType<RedirectToRouteResult>();
            static ActionExecutingContext filterContext;
            static AuthorizeCurrentUserFilter filter;
            static IRoles roles;
            const string currentuser = "currentuser";
            const string otheruser = "otheruser";
        }

        public class when_attorney_requests_client_profile
        {
            Establish context = () =>
            {
                filterContext = A.Fake<ActionExecutingContext>();
                roles = A.Fake<IRoles>();
                const string userNameKey = "userName";

                A.CallTo(() => filterContext.ActionParameters.ContainsKey(userNameKey)).Returns(true);
                A.CallTo(() => filterContext.ActionParameters[userNameKey]).Returns(otheruser);
                A.CallTo(() => filterContext.HttpContext.User.Identity.Name).Returns(currentuser);
                A.CallTo(() => roles.IsUserInRole(UserRoles.Attorney)).Returns(true);

                filter = new AuthorizeCurrentUserFilter(roles);
            };

            Because of = () => filter.OnActionExecuting(filterContext);

            It should_not_redirect_to_login_page = () => filterContext.Result.ShouldBeNull();

            static ActionExecutingContext filterContext;
            static AuthorizeCurrentUserFilter filter;
            static IRoles roles;
            const string currentuser = "currentuser";
            const string otheruser = "otheruser";
        }
    }
}
