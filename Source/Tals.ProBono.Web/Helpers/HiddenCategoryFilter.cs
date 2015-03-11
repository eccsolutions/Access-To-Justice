using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Ninject;
using Tals.ProBono.Domain.Concrete;

namespace Tals.ProBono.Web.Helpers
{
    public class HiddenCategoryFilter : ActionFilterAttribute
    {
        private const string CategoryKey = "category";
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (filterContext.ActionParameters.ContainsKey(CategoryKey))
            {
                var categoryName = filterContext.ActionParameters[CategoryKey] as string;

                if (!string.IsNullOrEmpty(categoryName))
                {
                    var repository = DependencyResolver.Current.GetService(typeof (IRepositoryFactory)) as IRepositoryFactory;
                    if (repository != null)
                    {
                        var category = repository.Categories.Get().FirstOrDefault(c => c.CategoryName == categoryName);

                        if (category != null && category.Hidden)
                        {
                            SetResult(filterContext);
                        }
                    }
                }
            }
            base.OnActionExecuting(filterContext);
        }

        private void SetResult(ActionExecutingContext filterContext)
        {
            filterContext.Result = new RedirectToRouteResult(
                new RouteValueDictionary
                {
                    {"controller", "Attorney"},
                    {"action", "InvalidCategory"}
                });
        }
    }
}