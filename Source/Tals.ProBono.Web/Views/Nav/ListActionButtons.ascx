<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Tals.ProBono.Domain.Entities.Question>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<% if(Model.IsClosed() && Roles.IsUserInRole(UserRoles.Administrators)) { %>
    <% using(Html.BeginForm("Open", "Admin")) {%>
        <%: Html.Hidden("id", Model.Id) %>
        <%: Html.Hidden("returnUrl", Request.Url.PathAndQuery) %>
        <input type="submit" value="Open" class="ImageLink" />
    <%} %>
<%} %>
<% if(!Model.IsClosed()) {%>
    <% if(Model.IsTaken()) {%>
        <%: Html.RoleActionLink("Reply", "Reply", "Attorney", UserRoles.AdministratorsAndAttorny, new { id = Model.Id, r = Page.Request.QueryString["r"]}, new {@class = "ImageLink"}) %>
    <% } else { %>
        <%: Html.RoleActionLink("Reply", "Reply", "Attorney", UserRoles.Administrators, new { id = Model.Id, r = Page.Request.QueryString["r"]}, new {@class = "ImageLink"}) %>
        <%: Html.RoleActionLink("Take", "Take", "Attorney", UserRoles.Attorney, new { id = Model.Id}, new {@class = "ImageLink"}) %>
    <% } %>
    <%: Html.RoleActionLink("Edit", "Edit", "Admin", UserRoles.Administrators, new { id = Model.Id }, new { @class = "ImageLink" })%>
<%} %>