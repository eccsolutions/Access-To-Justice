using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Tals.ProBono.Web.Controllers
{
    public class ReportingController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult DisplayReport(string reportName, string displayName)
        {
            return Redirect(
                string.Format("../Reports/DisplayReport.aspx?ReportName={0}&DisplayName={1}", reportName, displayName)
                );
        }

        public ActionResult AttorneyList()
        {
            return Redirect("../Reports/AttorneyList.aspx");
        }

        public ActionResult CategoryList()
        {
            return Redirect("../Reports/CategoryList.aspx");
        }

        public ActionResult ClientList()
        {
            return Redirect("../Reports/ClientList.aspx");
        }

        public ActionResult CountyList()
        {
            return Redirect("../Reports/CountyList.aspx");
        }

        public ActionResult WorkEntriesDetailAll()
        {
            return Redirect("../Reports/WorkEntriesDetailAll.aspx");
        }

        public ActionResult WorkEntriesDetailByAttorney()
        {
            return Redirect("../Reports/WorkEntriesDetailByAttorney.aspx");
        }
    }
}
