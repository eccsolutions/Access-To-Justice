<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Web.Models.IUserProfile>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Confirm Approval
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="ConfirmationHeading">Confirm Approval for <%: Model.FullName %> (<%: Model.UserName %>)</h2>

    <img src="<%: Url.Image("warning.bmp") %>" alt="Warning!" /> Are you sure you want to approve attorney "<%: Model.FullName %>"?
    <p id="WarningMessage">
        This attorney will be given access to take and answer questions asked by clients.
    </p>
    <p>
        <%: Html.ActionLink("Yes", "Approve", new {Model.UserName}, new {@class="ImageLink"}) %>
        <%: Html.ActionLink("No", "AccountList", null, new {@class="ImageLink"}) %>
    </p>
    
    <div id="profile">
        <% Html.RenderAction("DisplayAccountInfo", "User", new {userName = Model.UserName}); %>
        <% Html.RenderAction("DisplayAttorneyProfile", "User"); %>
    </div>
</asp:Content>
