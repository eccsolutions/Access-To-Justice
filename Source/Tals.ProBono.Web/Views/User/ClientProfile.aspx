<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Attorney.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Profile (<%:ViewData["UserName"]%>)
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%: Html.PreviousPageLink("Back to previous screen") %>
    <% Html.RenderAction("DisplayAdminActions", "Account", new { userName = ViewData["UserName"]}); %>
    
        <h2>Profile for: <%: ViewData["UserName"] %></h2>
        
        <%: Html.ActionLink("View Question History", "QuestionHistory", new { userName = ViewData["UserName"]}) %>

    <div id="profile">
        <% Html.RenderAction("DisplayAccountInfo", new { userName = ViewData["UserName"]}); %>
        <% Html.RenderAction("DisplayClientProfile", new {userName = ViewData["UserName"]}); %>
    </div>
</asp:Content>
