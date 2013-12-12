using System;
using Tals.ProBono.Web.Models;

namespace Tals.ProBono.Web.Infrastructure
{
    public interface IUser
    {
        string UserName { get; set; }
        DateTime LastLoginDate { get; set; }
        string Email { get; set; }
        DateTime Registration { get; set; }
        bool IsOnline { get; set; }
        UserProfile UserProfile { get; }
        bool IsInRole(string roleName);
    }
}