<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Tals.ProBono.Domain.Constants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Manage Application Settings
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Manage Application Settings</h2>

    <p><%=Html.ActionLink("Categories", "List", "Category") %></p>

    <p><%=Html.ActionLink("Counties", "List", "County") %></p>

    <p><%=Html.ActionLink("Referral Organizations", "List", "ReferralOrganization") %></p>

    <p><%=Html.ActionLink("Update Advocate Page", "Edit", "Pages", new{id=ApplicationConstants.PAGE_ID_ADVOCATE},null) %></p>
</asp:Content>