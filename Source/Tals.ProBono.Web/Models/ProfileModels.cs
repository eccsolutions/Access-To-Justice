using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Web.Models
{
    public enum ProfileType
    {
        Attorney,
        Client
    }

    public class ClientProfileViewModel
    {
        public double QuestionsAsked { get; set; }
        public double QuestionsInQueue { get; set; }
        public double QuestionsTaken { get; set; }
        public string County { get; set; }

        public void SetCountySelectList(IEnumerable<County> counties)
        {
            CountySelectList = new SelectList(counties, "CountyName", "CountyName", County);
        }

        public IEnumerable<SelectListItem> CountySelectList { get; private set; }
    }

    public class AttorneyProfileViewModel : IUserProfile {
        public AttorneyProfileViewModel() {
        }

        public AttorneyProfileViewModel(IUserProfile profile) {
            FirstName = profile.FirstName;
            LastName = profile.LastName;
            MiddleInitial = profile.MiddleInitial;
            DisciplinaryBoardNumber = profile.DisciplinaryBoardNumber;
            LawFirm = profile.LawFirm;
            Phone = profile.Phone;
            AddressLine1 = profile.AddressLine1;
            AddressLine2 = profile.AddressLine2;
            City = profile.City;
            State = profile.State;
            Zip = profile.Zip;
            County = profile.County;
            RegistrationDate = profile.RegistrationDate;
            UserName = profile.UserName;
            FullName = profile.FullName;
        }

        public void SetCountySelectList(IEnumerable<County> counties) {
            CountySelectList = new SelectList(counties, "CountyName", "CountyName", County);
        }

        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string MiddleInitial { get; set; }
        public string DisciplinaryBoardNumber { get; set; }
        public string LawFirm { get; set; }
        public string Phone { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string County { get; set; }
        public DateTime? RegistrationDate { get; set; }
        public string UserName { get; set; }
        public string FullName { get; set; }

        public IEnumerable<SelectListItem> CountySelectList { get; private set; }
    }
}