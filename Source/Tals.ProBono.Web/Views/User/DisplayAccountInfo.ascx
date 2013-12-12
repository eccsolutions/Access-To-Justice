<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<AccountInfoViewModel>" %>
    <fieldset>
        <legend>
            <%: Html.ActionLink("Edit", "EditAccountInfo", new {userName = Model.UserName})%>
            - Account</legend>
        <label>Last Login Date:</label>
        <div class="profile-field, clear">
            <%: String.Format("{0:g}", Model.LastLoginDate) %></div>
        <label>Email Address:</label>
        <div class="profile-field, clear"><%: Model.Email %></div>
    </fieldset>