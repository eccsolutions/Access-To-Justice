<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.SiteName %> - Training/Resource Materials
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Training/Resource Materials</h2>
    The links below provide introductory information about various areas of the law. Click the topic name to view the resource. To view the topic in a new tab, right click the topic name and select 'Open Link in New Tab'. The information is organized by the categories that we use for WLAO:

    <h3>Content Coming Soon!</h3>

    <p>Visit our <%: Html.ActionLink("FAQs", "AttorneyFAQ", "Account", null,null) %> for more commonly asked questions.</p>

</asp:Content>
