<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Tals.ProBono.Web.Models.IUserProfile>" %>
    <fieldset>
        <legend>
            <%: Html.ActionLink("Edit", "EditAttorneyProfile", "User")%>
            - Profile</legend>
        <label>
            Registration Date:</label>
        <div class="profile-field, clear">
            <%: String.Format("{0:g}", Model.RegistrationDate) %></div>
        <label>
            Attorney ID Number:</label>
        <div class="profile-field, clear">
            <%: Model.DisciplinaryBoardNumber %></div>
        <fieldset class="clear">
            <legend>Firm/Organization:
                <%: Model.LawFirm %></legend>
            <label>
                Phone Number:</label>
            <div class="profile-field, clear">
                <%: Model.Phone %></div>
            <label>
                Address:</label>
            <div class="profile-field, clear">
                <%: Model.AddressLine1 %></div>
            <div class="profile-field, clear">
                <%: Model.AddressLine2 %></div>
            <div class="profile-field, clear">
                <%: Model.City %>,
                <%: Model.State %>
                <%: Model.Zip %>
            </div>
            <label>
                County:</label>
            <div class="profile-field, clear">
                <%:Model.County %></div>
            <label>
                Referral Organization:</label>
            <div class="profile-field, clear">
                <%:Model.ReferralOrganization %></div>
        </fieldset>
    </fieldset>