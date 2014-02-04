<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ReachedMaxFollowup
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Reached Max Allowance</h2>
    <ol>
        <li>Only one question may be asked per day.</li>
        <li>Only three questions may be asked per year.</li>
    </ol>
    <p>If you feel you have reached this page in error, please <a href="mail:onlinetnjustice@tals.org">Contact Us</a> for assistance</p>
    <p><%: Html.ActionLink("Back to list", "Questions") %></p>
</asp:Content>