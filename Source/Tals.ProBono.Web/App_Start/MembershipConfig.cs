﻿using System;
using System.Web.Management;
using System.Web.Security;
using Tals.ProBono.Domain.Services;

namespace Tals.ProBono.Web
{
    public static class MembershipConfig
    {
        public static void Config()
        {
#if DEBUG
            SqlServices.Install("AccessToJustice", "AccessToJusticeServices", SqlFeatures.All);
#endif

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

            MembershipCreateStatus status;

            if (Membership.GetUser(ConfigSettings.AdminUserName) == null)
            {
                Membership.CreateUser(ConfigSettings.AdminUserName, "jk3d4jb3s2", ConfigSettings.SiteEmail, "What is the developer's last name?", "gorski", true, null, out status);
                Roles.AddUserToRole(ConfigSettings.AdminUserName, UserRoles.Administrators);
            }

            if (Membership.GetUser("admin2") == null)
            {
                Membership.CreateUser("admin2", "k4fv3sk7d4", ConfigSettings.SiteEmail, "What is the developer's last name?", "gorski", true, null, out status);
                Roles.AddUserToRole("admin2", UserRoles.Administrators);
            }

            if (Membership.GetUser("admin3") == null)
            {
                Membership.CreateUser("admin3", "bv54rf3sd4", ConfigSettings.SiteEmail, "What is the developer's last name?", "gorski", true, null, out status);
                Roles.AddUserToRole("admin3", UserRoles.Administrators);
            }
        }
    }
}