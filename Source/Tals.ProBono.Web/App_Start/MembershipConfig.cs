﻿using System.Web.Management;
using System.Web.Security;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Services;

namespace Tals.ProBono.Web
{
    public static class MembershipConfig
    {
        public static void Config()
        {
#if DEBUG
            var db = new DatabaseInitializer();
            db.MigrateDatabaseToLatestVersion();
            // Doesn't work on Azure databases (no access to system database)...not sure it is even needed.
            //SqlServices.Install("(local)\\SQLEXPRESS", "AccessToJustice2", SqlFeatures.All);

            if (!Roles.RoleExists(UserRoles.Administrators))
            {
                Roles.CreateRole(UserRoles.Administrators);
            }
            if (!Roles.RoleExists(UserRoles.Attorney))
            {
                Roles.CreateRole(UserRoles.Attorney);
            }
            if (!Roles.RoleExists(UserRoles.BasicUser))
            {
                Roles.CreateRole(UserRoles.BasicUser);
            }
            if (!Roles.RoleExists(UserRoles.PendingApproval))
            {
                Roles.CreateRole(UserRoles.PendingApproval);
            }
            if (Membership.GetUser(ConfigSettings.AdminUserName) == null)
            {
                Membership.CreateUser(ConfigSettings.AdminUserName, "temppassword");
                Roles.AddUserToRole(ConfigSettings.AdminUserName, UserRoles.Administrators);
            }
#endif
        }
    }
}