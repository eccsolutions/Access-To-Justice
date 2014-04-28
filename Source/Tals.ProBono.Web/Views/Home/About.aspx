<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<%@ Import Namespace="Tals.ProBono.Web.Helpers" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Minnesota Legal Advice Online - About Us
</asp:Content>
<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        About</h2>
    <p>
        The Minnesota Legal Advice Online (MLAO) system allows eligible users to post a legal question to a private messaging system. The questions are answered by volunteer attorneys. MLAO users can check the system for answers at any time. Only the website administrator and the volunteer attorney answering a client’s question can see the client’s name. All information posted is held in strict confidence.</p>
    <p>
        MLAO is administered by Legal Services State Support, a project of the Minnesota Legal Services Coalition, and is funded through a grant from the Legal Services Advisory Committee. Special thanks to Baker, Donelson, Bearman, Caldwell &amp; Berkowitz, PC, the Tennessee Alliance for Legal Services, and our Minnesota partner organizations and stakeholders for their critical support of this project. These entities share the goal of increasing access to legal advice for those who cannot afford it.</p>
    <p style="text-align: center;">
        <strong>All information posted is held in strict confidence.</strong></p>
</asp:Content>
