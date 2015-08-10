using System.Web.Management;
using System.Web.Mvc;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Infrastructure;

namespace Tals.ProBono.Web.Controllers
{
    [HandleError]
    [DynamicMasterPageFilter]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            if (Request.IsAuthenticated)
            {
                if (User.IsInRole(UserRoles.Administrators) || User.IsInRole(UserRoles.Attorney))
                    return RedirectToAction("List", "Attorney");
                else if (User.IsInRole(UserRoles.BasicUser))
                    return RedirectToAction("Questions", "Client");
                else if (User.IsInRole(UserRoles.PendingApproval))
                    return RedirectToAction("ApprovalNeeded");
            }

            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Help()
        {
            return View();
        }

        public ActionResult PrivacyPolicy()
        {
            return View();
        }

        public ActionResult ApprovalNeeded()
        {
            return View();
        }

        public ActionResult MigrateDatabase()
        {
            return RedirectToAction("Index");
        }
    }
}
