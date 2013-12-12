using System;
using System.Web;
using System.Web.Security;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Models;

namespace Tals.ProBono.Web.Infrastructure
{
    public class UserModel : IUser
    {
        public UserModel() { }

        public static IUser Current
        {
            get
            {
                return (HttpContext.Current.Items["CurrentUser"] ??
                        (HttpContext.Current.Items["CurrentUser"] = CreateInstance())) as IUser;
            }
        }

        private static IUser CreateInstance()
        {
            if (!IsAuthenticated()) return new UserModel();

            var user = Membership.GetUser(true);
            if (user == null) return null;
            Membership.UpdateUser(user);

            return new UserModel() { UserName = user.UserName, LastLoginDate = user.LastLoginDate, Email = user.Email, Registration = user.CreationDate, IsOnline = user.IsOnline};
        }

        public string Email { get; set; }
        public string UserName { get; set; }
        public DateTime LastLoginDate { get; set; }
        public DateTime Registration { get; set; }
        public bool IsOnline { get; set; }

        public UserProfile UserProfile {
            get { return UserProfile.GetUserProfile(UserName); }
        }

        public bool IsInRole(string userName)
        {
            return Roles.IsUserInRole(userName);
        }

        public static bool IsAuthenticated()
        {
            return HttpContext.Current.Request.IsAuthenticated;
        }

        public string MasterPage
        {
            get {
                string masterPage = null;
                
                if (IsInRole(UserRoles.Administrators))
                    masterPage = "Admin";
                else if (IsInRole(UserRoles.Attorney))
                    masterPage = "Attorney";
                else if (IsInRole(UserRoles.BasicUser))
                    masterPage = "Client";

                return masterPage;
            }
        }
    }
}