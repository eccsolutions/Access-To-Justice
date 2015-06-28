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
    }
}