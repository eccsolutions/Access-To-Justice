using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Helpers;

namespace Tals.ProBono.Web.Reports
{
    public class ReportPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Roles.IsUserInRole(UserRoles.Administrators))
            {
                Response.Redirect("../Account/SignIn");
            }
        }
    }
}