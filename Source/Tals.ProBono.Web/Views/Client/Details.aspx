<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Web.Models.DetailsViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Here are the answers to your question</h2>

    Need to ask a follow-up question about the answer? Click the <span class="ImageLink">Follow-up</span> button next to it.

    <% if (Model.Question.Posts.Count(x => x.CreatedBy != Model.Question.CreatedBy) > 0) { %>
    <div>
        <p>You have received an answer to your question.  You can:</p>
    <ul>
        <li>Follow-up with the answer given by clicking "Follow-up"</li>
        <li>Print or save the answer to your question</li>
        <li>End the question by clicking "Accept"</li>
    </ul>
    <p>
        The attorney's last answer will automatically end the question if you do not follow up within 14 days.
    </p>
    </div>
    <% } %>

    <% Html.RenderPartial("DetailsForm");%>

    <p>
        <%: Html.ActionLink("Return to List", "Questions") %>
    </p>

</asp:Content>

