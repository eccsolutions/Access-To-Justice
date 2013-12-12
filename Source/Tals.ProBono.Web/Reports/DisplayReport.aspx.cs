using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.Reporting.WebForms;

namespace Tals.ProBono.Web.Reports
{
    public partial class DisplayReport : ReportPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            ReportViewer1.ServerReport.DisplayName = Request.QueryString["DisplayName"];
            ReportViewer1.ServerReport.ReportPath = "/" + Request.QueryString["ReportName"];

            if (!IsPostBack)
            {
                var parameters = Request.QueryString.AllKeys.Where(k => k != "DisplayName" && k != "ReportName")
                    .Select(key => new ReportParameter(key, Request.QueryString[key])).ToList();

                ReportViewer1.ServerReport.SetParameters(parameters);
            }
        }
    }
}