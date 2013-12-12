<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<MvcPaging.IPagedList<UserModel>>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Client Administration
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%: Html.AutoCompleteScript("searchTextBox", "searchText", "searchButton", Url.Action("FindAccounts"), null) %>
    <h2>User Administration : <%: ViewBag.Role ?? "All Users" %></h2>

    <div class="horizontalMenu"><% Html.RenderAction("RolesMenu", "Nav"); %></div>
    <br /><br />
    <p style="clear:both;">Click on the Profile link for a client in order to access that client's profile.</p>
    <div>
        <% using(Ajax.BeginForm("SearchAccounts", "Admin", new AjaxOptions {UpdateTargetId = "accounts"}, new {id = "searchForm"})) {%>
            Search: <%: Html.AutoCompleteTextBox("searchTextBox", "searchText", new {style = "width:450px;"}) %>
            <input id="searchButton" type="submit" value="Search" style="display: none" />
        <%} %>
    </div>
    
    <div id="accounts">
        <%Html.RenderPartial("_AccountList"); %>
    </div>

    <%Html.RenderAction("UsersOnline");%>
</asp:Content>

