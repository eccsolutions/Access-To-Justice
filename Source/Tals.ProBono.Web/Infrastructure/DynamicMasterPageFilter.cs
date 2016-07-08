using System.Web.Mvc;
using Tals.ProBono.Domain.Abstract;
using Tals.ProBono.Domain.Services;

namespace Tals.ProBono.Web.Infrastructure
{
    public class DynamicMasterPageFilter : ActionFilterAttribute
    {
        readonly IRoles _roles;

        public DynamicMasterPageFilter() : this(new RolesWrapper()) {
            
        }

        public DynamicMasterPageFilter(IRoles roles) {
            _roles = roles;
        }

        public override void OnActionExecuted(ActionExecutedContext filterContext) {
            var result = filterContext.Result as ViewResult;
            if(result == null)
                return;

            if (!filterContext.IsChildAction) {
                result.MasterName = "Guest";

                if (_roles.IsUserInRole(UserRoles.Attorney))
                    result.MasterName = "Attorney";
                else if (_roles.IsUserInRole(UserRoles.BasicUser))
                    result.MasterName = "Client";
                else if (_roles.IsUserInRole(UserRoles.Administrators))
                    result.MasterName = "Admin";
            }

            base.OnActionExecuted(filterContext);
        }
    }
}