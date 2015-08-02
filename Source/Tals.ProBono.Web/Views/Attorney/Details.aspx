<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Attorney.Master" Inherits="System.Web.Mvc.ViewPage<DetailsViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%: Html.PreviousPageLink("< Previous Page :") %>
    <%: Html.ActionLink("Practice Areas", "PracticeAreas") %> > 
    <%: Html.ActionLink(Model.Question.Category.ShortDescription, "List", new { category = Model.Question.Category.CategoryName })%> >
    <%: Model.Question.Subject %>

    <h2>Replies</h2>
    <p>
        Here are the replies from the client. You can choose to follow up with the client by clicking the "Reply" button next to the response.
        If you have fully answered the client's question and no longer wish to receive follow up communication regarding this specific legal question,
        click the "Close this Question" button and follow the prompts.  Following these steps will close the question for both you and the client and
        no further posts will be allowed on the thread.
    </p>

    <% Html.RenderPartial("DetailsForm");%>

<p>
    <%: Html.ActionLink("Return to List", "List") %>
</p>

</asp:Content>

