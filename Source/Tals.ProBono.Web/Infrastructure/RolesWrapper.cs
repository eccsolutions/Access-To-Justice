using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using Tals.ProBono.Domain.Abstract;

namespace Tals.ProBono.Web.Infrastructure
{
    public class RolesWrapper : IRoles
    {
        public bool IsUserInRole(string userName, string role)
        {
            return Roles.IsUserInRole(userName, role);
        }

        public bool IsUserInRole(string role) {
            return Roles.IsUserInRole(role);
        }
    }
}