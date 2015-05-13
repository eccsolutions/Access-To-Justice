<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    We're sorry... You do not meet our rules.
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <p>We're sorry, but you do not meet the rules to be able to use this website.</p>
    <h2>Other places to find legal help and information</h2>
    <p>If you have problems with this website, you may contact us at <a href="mailto:<%=ConfigSettings.SiteEmail%>"><%=ConfigSettings.SiteEmail%></a>. This email address is for technical questions or website problems only. We will not answer your legal question.</p>
</asp:Content>
