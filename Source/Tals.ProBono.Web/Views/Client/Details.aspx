<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Web.Models.DetailsViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Here are the answers to your question</h2>

    Need to ask a follow-up question about the answer? Click the <span class="ImageLink">Follow-up</span> button next to it.

    <% if (Model.Question.Posts.Count(x => x.CreatedBy != Model.Question.CreatedBy) > 0) { %>
    <div>
        <p>You have received an answer and can do the following:</p>
    <ul>
        <li>Follow-up with the answer given by clicking the follow-up button next to it</li>
        <li>Print or save the answer to your question</li>
        <li>Mark the answer as accepted</li>
    </ul>
    <p>
        The last answer given will be automatically accepted after 30 days of inactivity.
    </p>
    </div>
    <% } %>

    <% Html.RenderPartial("DetailsForm");%>

    <p>
        <%: Html.ActionLink("Return to List", "Questions") %>
    </p>

</asp:Content>

