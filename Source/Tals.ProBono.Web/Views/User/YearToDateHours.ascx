<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<double>" %>

<fieldset>
    <legend>Volunteer Information</legend>
    <label>Total Hours Logged for the Year:</label>
    <div class ="profile-field, clear">
        <%:Html.DisplayFor(m => m) %>
    </div>
</fieldset>
