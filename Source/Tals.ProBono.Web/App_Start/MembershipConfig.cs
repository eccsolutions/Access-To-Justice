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
                //Membership.CreateUser(ConfigSettings.AdminUserName, "jk3d4jb3s2");
                Membership.CreateUser(ConfigSettings.AdminUserName, "edg123");
                Roles.AddUserToRole(ConfigSettings.AdminUserName, UserRoles.Administrators);
            }

            if (Membership.GetUser("admin2") == null)
            {
                Membership.CreateUser("admin2", "k4fv3sk7d4");
                Roles.AddUserToRole("admin2", UserRoles.Administrators);
            }

            if (Membership.GetUser("admin3") == null)
            {
                Membership.CreateUser("admin3", "bv54rf3sd4");
                Roles.AddUserToRole("admin3", UserRoles.Administrators);
            }
        }
    }
}