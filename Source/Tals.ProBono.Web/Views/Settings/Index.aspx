<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Manage Application Settings
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Manage Application Settings</h2>

    <p><%=Html.ActionLink("Federal Poverty Settings", "Edit", "FPSettings") %></p>

    <p><%=Html.ActionLink("Categories", "List", "Category") %></p>

    <p><%=Html.ActionLink("Counties", "List", "County") %></p>

    <p><%=Html.ActionLink("Referral Organizations", "List", "ReferralOrganization") %></p>
</asp:Content>