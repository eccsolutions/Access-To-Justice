<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<%@ Import Namespace="Tals.ProBono.Web.Helpers" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Online Tennessee Justice - About Us
</asp:Content>
<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        About</h2>
    <p>
        OnlineTNJustice is a joint project of the Tennessee Alliance for Legal Services
        and the Tennessee Bar Association. Special thanks to Microsoft, Dell,
<% if(Roles.IsUserInRole(UserRoles.Attorney)) { %>
         the law firm of Baker, Donelson, Bearman, Caldwell and Berkowitz
<%} %>
        and to the Tennessee Supreme Court’s Access to Justice
        Commission for their critical support of this project. These entities share the
        goal of increasing access to legal advice to those who cannot afford it.</p>
    <p>
        The system screens clients for eligibility and, if qualified, allows them to post
        a question to a private messaging system. The questions are answered by private
        attorneys volunteering their time. A OnlineTNJustice client has the ability to check
        the system for answers at any time. Only the name of the client is shared with the
        volunteer attorney assisting them. All other information is anonymous to insure
        complete privacy.</p>
    <p style="text-align: center;">
        <strong>All information posted is held in strict confidence.</strong></p>
</asp:Content>
