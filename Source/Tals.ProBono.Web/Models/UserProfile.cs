using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Profile;
using System.Web.Security;

namespace Tals.ProBono.Web.Models
{
    public interface IUserProfile {
        string FirstName { get; set; }
        string LastName { get; set; }
        string MiddleInitial { get; set; }
        string DisciplinaryBoardNumber { get; set; }
        string LawFirm { get; set; }
        string Phone { get; set; }
        string AddressLine1 { get; set; }
        string AddressLine2 { get; set; }
        string City { get; set; }
        string State { get; set; }
        string Zip { get; set; }
        string County { get; set; }
        DateTime? RegistrationDate { get; set; }
        string UserName { get; }
        string FullName { get; }
        string ReferralOrganization { get; set; }
    }

    public class UserProfile : ProfileBase, IUserProfile {
        [Required]
        [DisplayName("First Name")]
        public string FirstName
        {
            get { return base["FirstName"] as string; }
            set { base["FirstName"] = value; }
        }

        [Required]
        [DisplayName("Last Name")]
        public string LastName
        {
            get { return base["LastName"] as string; }
            set { base["LastName"] = value; }
        }

        [DisplayName("Middle Initial")]
        public string MiddleInitial
        {
            get { return base["MiddleInitial"] as string; }
            set { base["MiddleInitial"] = value; }
        }

        [Required]
        [DisplayName("Attorney Bar Number")]
        public string DisciplinaryBoardNumber
        {
            get { return base["DisciplinaryBoardNumber"] as string; }
            set { base["DisciplinaryBoardNumber"] = value; }
        }

        [Required]
        [DisplayName("Firm/Organization")]
        public string LawFirm
        {
            get { return base["LawFirm"] as string; }
            set { base["LawFirm"] = value; }
        }

        [Required]
        [DisplayName("Phone Number")]
        public string Phone
        {
            get { return base["Phone"] as string; }
            set { base["Phone"] = value; }
        }

        [Required]
        [DisplayName("Address Line 1")]
        public string AddressLine1
        {
            get { return base["AddressLine1"] as string; }
            set { base["AddressLine1"] = value; }
        }

        [DisplayName("Address Line 2")]
        public string AddressLine2
        {
            get { return base["AddressLine2"] as string; }
            set { base["AddressLine2"] = value; }
        }

        [Required]
        [DisplayName("City")]
        public string City
        {
            get { return base["City"] as string; }
            set { base["City"] = value; }
        }

        [Required]
        [DisplayName("State")]
        public string State
        {
            get { return base["State"] as string; }
            set { base["State"] = value; }
        }

        [Required]
        [DisplayName("Zip")]
        public string Zip
        {
            get { return base["Zip"] as string; }
            set { base["Zip"] = value; }
        }

        public int? Income
        {
            get { return base["Income"] as int?; }
            set { base["Income"] = value; }
        }

        public int? HouseholdSize
        {
            get { return base["HouseholdSize"] as int?; }
            set { base["HouseholdSize"] = value; }
        }

        public string County
        {
            get { return (string)base["County"]; }
            set { base["County"] = value; }
        }

        public DateTime? RegistrationDate
        {
            get { return base["RegistrationDate"] as DateTime?; }
            set { base["RegistrationDate"] = value; }
        }

        public bool AcceptUserAgreement
        {
            get { return (bool) base["AcceptUserAgreement"]; }
            set { base["AcceptUserAgreement"] = value; }
        }

        public string FullName
        {
            get { return this.FirstName + " " + (this.MiddleInitial == null ? "" : this.MiddleInitial + " ") + this.LastName; }
        }

        public string ReferralOrganization
        {
            get { return base["ReferralOrganization"] as string; }
            set { base["ReferralOrganization"] = value; }
        }

        public static UserProfile GetUserProfile()
        {
            return Create(HttpContext.Current.User.Identity.Name) as UserProfile;
        }

        public static UserProfile GetUserProfile(string username)
        {
            return Create(username) as UserProfile;
        }

        public static List<UserProfile> GetUserProfilesForRole(string roleName)
        {
            var usernames = Roles.GetUsersInRole(roleName);

            return usernames.Select(GetUserProfile).ToList();
        }
    }
}