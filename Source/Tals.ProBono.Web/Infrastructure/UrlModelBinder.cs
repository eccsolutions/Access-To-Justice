using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Tals.ProBono.Web.Models;

namespace Tals.ProBono.Web.Infrastructure
{
    public class ReturnUrlModelBinder : IModelBinder
    {
        public object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            if (bindingContext.Model != null)
                throw new InvalidOperationException("Cannot update instances");

            if(controllerContext.RouteData.Values.ContainsKey("r"))
            {
                return new ReturnUrl
                           {
                               Url = controllerContext.RouteData.Values["r"].ToString()
                           };
            }
            else if(controllerContext.HttpContext.Request.QueryString["r"] != null)
            {
                return new ReturnUrl
                           {
                               Url = controllerContext.HttpContext.Request.QueryString["r"]
                           };
            }
            else if (controllerContext.HttpContext.Request.UrlReferrer != null)
            {
                return new ReturnUrl
                           {
                               Url = controllerContext.HttpContext.Request.UrlReferrer.PathAndQuery
                           };
            }

            return new ReturnUrl();
        }
    }
}