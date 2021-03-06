﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<%@ Import Namespace="Tals.ProBono.Web.Helpers" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.SiteName %> - About Us
</asp:Content>
<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        About</h2>
    <p>
        The <%=ConfigSettings.SiteName %> allows eligible users to post a legal question to a private messaging system. The questions are answered by volunteer
        attorneys. <%=ConfigSettings.SiteName %> users can check the system for answers at any time. Only the website administrator and the volunteer attorney
        answering a client’s question can see the client’s name. All information posted is held in strict confidence.</p>
    <p style="text-align: center;">
        <strong>All information posted is held in strict confidence.</strong></p>
</asp:Content>
