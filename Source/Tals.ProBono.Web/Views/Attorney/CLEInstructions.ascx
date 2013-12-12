<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<%@ Import Namespace="Tals.ProBono.Web.Helpers" %>
<% if(Roles.IsUserInRole(UserRoles.Attorney)) {%>
<fieldset>
    <p style="font-weight: bold">Please be sure to log your hours before closing the browser.</p>
    <br />
    <p><%: Html.ActionLink("Enter Hours and SignOut", "LogHours", null, new {@class="ImageLink"}) %></p>
</fieldset>
<%} %>