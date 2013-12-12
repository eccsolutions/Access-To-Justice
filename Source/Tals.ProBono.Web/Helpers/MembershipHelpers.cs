using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using Tals.ProBono.Web.Models;

namespace Tals.ProBono.Web.Helpers
{
    public static class MembershipHelpers
    {
        public static IEnumerable<MembershipUser> Search(this MembershipUserCollection m, string searchText)
        {
            var users = m.Cast<MembershipUser>().ToList();
            var profiles = users.Select(u => UserProfile.GetUserProfile(u.UserName)).ToList();
            var foundUserNames = profiles.Search(searchText).Select(p => p.UserName);

            return users.Where(u => foundUserNames.Contains(u.UserName)).ToList();
        }

        public static IEnumerable<UserProfile> Search(this IEnumerable<UserProfile> profiles, string searchText)
        {
            var lowerSearchText = searchText.ToLower();
            return
                profiles.Where(
                    p =>
                    p.UserName.ToLower().Contains(lowerSearchText) || p.FullName.ToLower().Contains(lowerSearchText) ||
                    p.DisciplinaryBoardNumber.Contains(lowerSearchText)).ToList();
        }
    }
}