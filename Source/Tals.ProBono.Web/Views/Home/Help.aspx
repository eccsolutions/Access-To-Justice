<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.SiteName %> - Other places to find legal help and information
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Other places to find legal help and information:</h2>
    <p>If you have problems with this website, you may contact us at <a href="mailto:<%=ConfigSettings.SiteEmail %>"><%=ConfigSettings.SiteEmail %></a>. This email address is for technical questions or website problems only. We will not answer your legal question.</p>
</asp:Content>
