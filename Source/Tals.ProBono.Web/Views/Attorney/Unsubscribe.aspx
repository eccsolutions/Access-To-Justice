<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Attorney.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Web.Models.UnsubscribeViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Unsubscribe from <%: Model.Subscription.Category.ShortDescription %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="ConfirmationHeading">Unsubscribe from <%: Model.Subscription.Category.ShortDescription%></h2>

    <img src="<%: Url.Image("warning.bmp") %>" alt="Warning!" /> Are you sure you want to unsubscribe from <%: Model.Subscription.Category.ShortDescription%>?
    <p id="WarningMessage">
        You will no longer receive emails when questions are asked within this category.
    </p>
    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        <fieldset>
            <legend>The email below will be unsubscribed from <%: Model.Subscription.Category.ShortDescription%></legend>
            <div class="editor-field">
                <%: Html.DisplayFor(m => m.Subscription.Email) %>
            </div>
            <%: Html.HiddenFor(m => m.Subscription.Id) %>
            <%: Html.HiddenFor(m => m.ReturnUrl) %>

                <p>
                    <%: Html.ActionLink("Cancel", "PracticeAreas", "Attorney", new {@class="ImageLink"}) %>
                    <input type="submit" value="Unsubscribe" class="ImageLink" />
                </p>
        </fieldset>
    <%} %>
</asp:Content>

