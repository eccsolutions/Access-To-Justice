using System.Web.Mvc;
using Tals.ProBono.Web.Constants;
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
            ViewData[ApplicationConstants.LAST_MESSAGE_KEY] = message;
            return message;
        }
    }
}