<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Tals.ProBono.Web.Models.AttorneyProfileViewModel>" %>
<div id="profile">
    <h2>Profile for <%: Model.Profile.FullName %></h2>
    <fieldset>
        <legend><%: Html.ActionLink("Edit", "Edit", "User") %> - Profile</legend>
        <label>
            BPR Number:</label>
        <div class="profile-field, clear">
            <%: Model.Profile.DisciplinaryBoardNumber %></div>
        <label>
            Year-to-date Hours:</label>
        <div class="profile-field, clear">
            <%: Model.HoursWorked %></div>
        <label>Email Address</label>
        <div class="profile-field, clear">
            <%: Model.User.Email %>
        </div>
        <fieldset class="clear">
            <legend>Firm/Organization:
                <%: Model.Profile.LawFirm %></legend>
            <label>
                Phone Number:</label>
            <div class="profile-field, clear">
                <%: Model.Profile.Phone %></div>
            <label>
                Address:</label>
            <div class="profile-field, clear">
                <%: Model.Profile.AddressLine1 %>
            </div>
            <div class="profile-field, clear">
                <%: Model.Profile.AddressLine2 %>
            </div>
            <div class="profile-field, clear">
                <%: Model.Profile.City %>,
                <%: Model.Profile.State %>
                <%: Model.Profile.Zip %>
            </div>
            <label>
                County:</label>
            <div class="profile-field, clear">
                <%:Model.Profile.County %></div>
        </fieldset>
    </fieldset>
</div>