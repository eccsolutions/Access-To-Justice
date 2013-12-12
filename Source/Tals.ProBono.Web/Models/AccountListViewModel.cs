using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using Tals.ProBono.Web.Infrastructure;

namespace Tals.ProBono.Web.Models
{
    public static class AccountListViewModel {
        public static IEnumerable<UserModel> ToUserModels(this IEnumerable<MembershipUser> users) {
            return users.Select(u => new UserModel() {
                Email = u.Email,
                LastLoginDate = u.LastLoginDate,
                Registration = u.CreationDate,
                UserName = u.UserName,
                IsOnline = u.IsOnline
            });
        } 
    }
    //public class AccountListViewModel
    //{
    //    public string CurrentRole { get; set; }
    //    public IEnumerable<UserModel> Users { get; set; }

    //    public static AccountListViewModel CreateViewModel(string role, IEnumerable<MembershipUser> users) {
    //        var userList = users.ToList();
    //        var model = new AccountListViewModel
    //        {
    //            CurrentRole = role,
    //            Users = userList
    //                .Skip((page - 1) * 10).Take(10)
    //                .Select(u => new UserModel()
    //                {
    //                    Email = u.Email,
    //                    LastLoginDate = u.LastLoginDate,
    //                    Registration = u.CreationDate,
    //                    UserName = u.UserName,
    //                    IsOnline = u.IsOnline
    //                })
    //        };

    //        return model;
    //    }
    //}
}