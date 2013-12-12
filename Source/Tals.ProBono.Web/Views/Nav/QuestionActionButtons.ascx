<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Tals.ProBono.Domain.Entities.Question>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<%@ Import Namespace="Tals.ProBono.Web.Helpers" %>

<% Html.RenderPartial("ListActionButtons", Model); %>
<% if(!Model.IsClosed()) {%>
    <%: Html.RoleActionLink("Follow-up", "FollowUp", "Client", UserRoles.BasicUser, new { id = Model.Id }, new { @class = "ImageLink" })%>
<%} %>