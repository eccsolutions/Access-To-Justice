using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Helpers;
using Tals.ProBono.Web.Infrastructure;

namespace Tals.ProBono.Web.Controllers
{
    [HandleError]
    [DynamicMasterPageFilter]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            if(Request.IsAuthenticated)
            {
                if (User.IsInRole(UserRoles.Administrators) || User.IsInRole(UserRoles.Attorney))
                    return RedirectToAction("List", "Attorney");
                else if (User.IsInRole(UserRoles.BasicUser))
                    return RedirectToAction("Questions", "Client");
                else if (User.IsInRole(UserRoles.PendingApproval))
                    return RedirectToAction("ApprovalNeeded");
            }

            ViewData["Message"] = "Welcome to the OnlineTNJustice site!";

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

        public ActionResult ApprovalNeeded()
        {
            return View();
        }
    }
}
