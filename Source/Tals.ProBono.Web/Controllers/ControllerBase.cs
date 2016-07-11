using System;
using System.Globalization;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using Tals.ProBono.Domain.Constants;
using Tals.ProBono.Web.Models.Shared;

namespace Tals.ProBono.Web.Controllers
{
    public abstract class ControllerBase : Controller
    {
        protected void SetTempMessage(MessageDto message)
        {
            TempData[ApplicationConstants.LAST_MESSAGE_KEY] = message;
        }

        protected MessageDto GetTempMessage()
        {
            var message = TempData[ApplicationConstants.LAST_MESSAGE_KEY] as MessageDto;
            return message;
        }

        protected void SetViewMessage(MessageDto message)
        {
            ViewData[ApplicationConstants.LAST_MESSAGE_KEY] = message;
        }

        protected override IAsyncResult BeginExecuteCore(AsyncCallback callback, object state)
        {
            var cookie = Request.Cookies["_culture"];
            if (cookie == null)
            {
                cookie = new HttpCookie("_culture") { HttpOnly = false, Value = "en", Expires = DateTime.Now.AddYears(1) };
            }
            Response.Cookies.Add(cookie);

            var lang = cookie.Value;
            var ci = new CultureInfo(lang);
            Thread.CurrentThread.CurrentUICulture = ci;
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(ci.Name);
            
            return base.BeginExecuteCore(callback, state);
        }
    }
}