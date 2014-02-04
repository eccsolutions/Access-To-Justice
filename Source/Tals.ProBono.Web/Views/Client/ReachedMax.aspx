<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ReachedMaxFollowup
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Reached Max Allowance</h2>
    <p>Only three questions may be asked per year.</p>
    <p><%: Html.ActionLink("Back to list", "Questions") %></p>
</asp:Content>