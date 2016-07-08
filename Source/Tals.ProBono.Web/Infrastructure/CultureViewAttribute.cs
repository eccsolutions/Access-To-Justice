using System.Web.Mvc;

namespace Tals.ProBono.Web.Infrastructure
{
    public class CultureViewAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            var result = filterContext.Result as ViewResult;
            if (result == null)
                return;

            if (!filterContext.IsChildAction)
            {
                var currentCulture = System.Threading.Thread.CurrentThread.CurrentUICulture;
                //result.ViewName = result.ViewName + "." + currentCulture.Name;
            }

            base.OnActionExecuted(filterContext);
        }
    }
}