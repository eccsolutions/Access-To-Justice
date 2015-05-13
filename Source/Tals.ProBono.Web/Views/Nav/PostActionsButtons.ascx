<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Tals.ProBono.Domain.Entities.Post>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<%@ Import Namespace="Tals.ProBono.Web.Helpers" %>

<% if(Model.Question.IsClosed() && Model.Accepted) {%>
    <span class="ImageLink">Accepted</span>
<%} else if(Model.CreatedBy != Model.Question.CreatedBy && !Model.Question.IsClosed()) {%>
    <%: Html.RoleActionLink("Accept as Answer", "AcceptAnswer", "Client", UserRoles.BasicUser, new { questionId = Model.QuestionId, postId = Model.Id }, new {@class="ImageLink"}) %>
    <%: Html.RoleActionLink("Close this Question", "MarkAsAnswer", "Attorney", UserRoles.AdministratorsAndAttorny, new { questionId = Model.QuestionId, postId = Model.Id }, new { @class = "ImageLink" })%>
<%} %>

<% if(!Model.Question.IsClosed()) {%>
    <%: Html.RoleActionLink("Follow-up", "FollowUp", "Client", UserRoles.BasicUser, new { id = Model.QuestionId }, new {@class="ImageLink"}) %>
    <%: Html.RoleActionLink("Reply", "Reply", "Attorney", UserRoles.Administrators, new { id = Model.QuestionId }, new {@class="ImageLink"}) %>

    <% if (Model.Question.IsTaken()) {%>
        <%: Html.RoleActionLink("Reply", "Reply", "Attorney", UserRoles.Attorney, new { id = Model.QuestionId }, new { @class = "ImageLink" })%>
    <%} %>
<%} %>