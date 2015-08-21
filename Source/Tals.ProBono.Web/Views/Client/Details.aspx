<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Web.Models.DetailsViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Here are the answers to your question</h2>

    <% if (Model.Question.Responses.Count(x => x.CreatedBy != Model.Question.CreatedBy) > 0) { %>
    <div>
        <p>
            Below is your answer from a volunteer attorney. If the attorney thinks they cannot
            give more information, you will see a button that says "<strong>Accepted</strong>".
            This means the attorney has closed the question. Remember, the conversation you had
            with the volunteer attorney is considered secret, do not re-post it as another question.
            Please remember, you may ask up to three questions in a year on three <strong style="text-decoration: underline">different</strong>
            civil legal issues.
        </p>
        <p>
            If the attorney needs more information from you or can give more information, you'll see a button marked
            "<strong>Follow-Up</strong>". You can follow-up to the answer given by clicking the "<strong>Follow-Up</strong>"
            button next to it. Or you can:
        </p>
    <ul>
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

