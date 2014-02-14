<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<%@ Import Namespace="Tals.ProBono.Web.Helpers" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Online Alabama Justice - About Us
</asp:Content>
<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        About</h2>
    <p>
        Alabama Legal Answers is a project of the Alabama Access to Justice Commission.  The system screens clients for eligibility and, if qualified, allows them to post a question to a private messaging system.  The questions are answered by private attorneys volunteering their time.  An Alabama Legal Answers client has the ability to check the system for answers at any time.  Only the name of the client is shared with the volunteer attorney assisting them.  All other information is anonymous to insure complete privacy.
</asp:Content>
