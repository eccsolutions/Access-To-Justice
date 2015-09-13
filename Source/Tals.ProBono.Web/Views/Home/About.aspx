<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.SiteName %> - About Us
</asp:Content>
<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>About Washington Web Lawyer</h2>
    
    <p><%=ConfigSettings.SiteName %> allows eligible users to post a legal question to a private online messaging system. The questions are answered by volunteer attorneys. <%=ConfigSettings.SiteName %> users can check the system for answers at any time. Only the website administrator and the volunteer attorney answering a <%=ConfigSettings.SiteName %> client&#39;s question can see the user&#39;s name. All information posted is held in strict confidence.</p>
</asp:Content>
