using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;

namespace Tals.ProBono.Web.Infrastructure
{
    public class SecurityQuestionFilter : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext) {
            var currentUser = Membership.GetUser();

            if(string.IsNullOrEmpty(currentUser.PasswordQuestion)) {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary {
                                                                                              {"controller", "Account"},
                                                                                              {"action", "QuestionAndAnswer"}
                                                                                          });
            }

            base.OnActionExecuting(filterContext);
        }
    }
}