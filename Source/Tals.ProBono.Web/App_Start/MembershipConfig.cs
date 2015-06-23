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

            if (Membership.GetUser(ConfigSettings.AdminUserName) == null)
            {
                Membership.CreateUser(ConfigSettings.AdminUserName, "edg123");
                Roles.AddUserToRole(ConfigSettings.AdminUserName, UserRoles.Administrators);
            }

            if (Membership.GetUser("aflores") == null)
            {
                Membership.CreateUser("aflores", "edg123");
                Roles.AddUserToRole("aflores", UserRoles.Administrators);
            }

            if (Membership.GetUser("lslifko") == null)
            {
                Membership.CreateUser("lslifko", "edg123");
                Roles.AddUserToRole("lslifko", UserRoles.Administrators);
            }

            if (Membership.GetUser("kbernhart") == null)
            {
                Membership.CreateUser("kbernhart", "edg123");
                Roles.AddUserToRole("kbernhart", UserRoles.Administrators);
            }
        }
    }
}