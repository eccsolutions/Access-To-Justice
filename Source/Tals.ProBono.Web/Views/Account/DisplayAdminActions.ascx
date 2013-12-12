<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<MembershipUser>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<%if (Roles.IsUserInRole(UserRoles.Administrators)) {%>
<fieldset id="admin-actions">
    <legend>Administration Actions</legend>
    
    <ul>
    <li>
    <% if (Model.IsApproved) %>
    <% { %>
            <%: Html.ActionLink("Disable Account", "DisableAccount", "Account", new { userName = Model.UserName}, new { @class = "ImageLink" })%>
            <span>This account is currently <strong>enabled.</strong></span>
    <% } %>
    <% else %>
    <% { %>
            <%: Html.ActionLink("Enable Account", "EnableAccount", "Account", new { userName = Model.UserName}, new { @class = "ImageLink" })%>
            <span>This account is currently <strong>disabled.</strong></span>
    <% } %>
    </li>

    <li>
        <%: Html.ActionLink("Reset Password", "ResetPassword", "Account", new { userName = Model.UserName}, new { @class = "ImageLink", @id = "ResetPasswordLink" })%>
        <span>Resets the user's password to a randomly generated value.</span>
    </li>
    </ul>
</fieldset>

<script type="text/javascript">
    $(function () {
        $('#ResetPasswordLink').click(function () {
            var answer = confirm('Are you sure you want to reset the password for this user?');
            if (answer) return true;
            else return false;
        });
    });
</script>
<%} %>
