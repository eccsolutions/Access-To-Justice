<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<IUserProfile>" %>

<%@ Import Namespace="Tals.ProBono.Web.Helpers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Confirm Denial
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="ConfirmationHeading">Confirm Denial for <%: Model.FullName %> (<%: Model.UserName %>)</h2>

    <img src="<%: Url.Image("warning.bmp") %>" alt="Warning!" /> Are you sure you want to deny attorney "<%: Model.FullName %>"?
    <p id="WarningMessage">
        This attorney will NOT be able to take and answer questions asked by clients.
    </p>
    <p>
        <% using(Html.BeginForm("Deny", "Admin")) { %>
            <%: Html.Hidden("UserName", Model.UserName) %>
            <input class="ImageLink" type="submit" value="Yes" />
            <%: Html.ActionLink("No", "AccountList", null, new {@class="ImageLink"}) %>
        <%} %>
    </p>

    <div id="profile">
        <% Html.RenderAction("DisplayAccountInfo", "User", new {userName = Model.UserName}); %>
        <% Html.RenderAction("DisplayAttorneyProfile", "User"); %>
    </div>
</asp:Content>
