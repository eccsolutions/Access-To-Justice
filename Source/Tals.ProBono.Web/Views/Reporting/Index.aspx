<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Reports</h2>

    <ul>
        <li><%: Html.ActionLink("List of Attorneys", "AttorneyList") %></li>
        <li><%: Html.ActionLink("List of Clients", "ClientList") %></li>
        <li><%: Html.ActionLink("List of Categories", "CategoryList") %></li>
        <li><%: Html.ActionLink("List of Counties", "CountyList") %></li>
        <li><%: Html.ActionLink("CLE Report - All Attorneys", "WorkEntriesDetailAll") %></li>
        <li><%: Html.ActionLink("CLE Report - By Attorney", "WorkEntriesDetailByAttorney") %></li>
        <li><%: Html.ActionLink("Eligibility Chart", "DisplayReport", new {DisplayName = "Eligibility Chart", ReportName="TotalEligibilityCount"}) %></li>
    </ul>

</asp:Content>