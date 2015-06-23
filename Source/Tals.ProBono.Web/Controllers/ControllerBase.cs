using System.Web.Mvc;
using Tals.ProBono.Web.Models.Shared;

namespace Tals.ProBono.Web.Controllers
{
    public abstract class ControllerBase : Controller
    {
        private const string _LAST_MESSAGE_KEY = "LAST_MESSAGE";
        
        protected void SetTempMessage(MessageDto message)
        {
            TempData[_LAST_MESSAGE_KEY] = message;
        }

        protected MessageDto GetTempMessage()
        {
            return TempData[_LAST_MESSAGE_KEY] as MessageDto;
        }
    }
}