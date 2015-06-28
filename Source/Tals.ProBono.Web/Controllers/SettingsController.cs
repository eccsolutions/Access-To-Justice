using System.Web.Mvc;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Infrastructure;

namespace Tals.ProBono.Web.Controllers
{
    [Authorize(Roles=UserRoles.Administrators)]
    [DynamicMasterPageFilter]
    public class SettingsController : ControllerBase
    {
        public ActionResult Index()
        {
            this.SetViewMessage(this.GetTempMessage());

            return View("Index");
        }
    }
}
