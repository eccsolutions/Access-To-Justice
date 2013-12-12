<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Attorney.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Web.Models.SubscribeViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Subscribe to <%: Model.Subscription.Category.ShortDescription%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="ConfirmationHeading">Subscribe to <%: Model.Subscription.Category.ShortDescription %></h2>

    <img src="<%: Url.Image("warning.bmp") %>" alt="Warning!" /> Are you sure you want to subscribe to <%: Model.Subscription.Category.ShortDescription%>?
    <p id="WarningMessage">
        You will receive an email each time a question is asked within this category. The email will contain the question asked and a link for taking and answering the question.
    </p>
    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        <fieldset>
            <legend><%: Model.Subscription.Category.ShortDescription %> Subscription</legend>
            <div class="editor-label">Enter the email address you want to subscribe</div>
            <div class="editor-field">
                <%: Html.EditorFor(m => m.Subscription.Email) %>
            </div>
            <%: Html.HiddenFor(m => m.Subscription.CategoryId) %>
            <%: Html.HiddenFor(m => m.Subscription.UserName) %>
            <%: Html.HiddenFor(m => m.ReturnUrl) %>

                <p>
                    <%: Html.ActionLink("Cancel", "PracticeAreas", "Attorney", new {@class="ImageLink"}) %>
                    <input type="submit" value="Subscribe" class="ImageLink" />
                </p>
        </fieldset>
    <%} %>
</asp:Content>

