<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<%@ Import Namespace="Tals.ProBono.Web.Helpers" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.SiteName %> - About Us
</asp:Content>
<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        About</h2>
    <p>
        Wisconsin Legal Advice Online was created by the Wisconsin Access to Justice Commission and is also sponsored by the State Bar of Wisconsin’s Pro Bono Program. Special thanks to Brian Granetzke for providing critical support with the technology aspects of this project. Our goal is to increase access to legal advice to those who cannot afford it.
    </p>
    <p>
        The system screens clients for eligibility and, if qualified, allows them to post a question to a private messaging system. The questions are answered by private attorneys volunteering their time. Users have the ability to check the system for answers at any time. Only the name of the client is shared with the volunteer attorney assisting them. All other information is anonymous to insure complete privacy.
    </p>
    <p style="text-align: center;">
        <strong>All information posted is held in strict confidence.</strong></p>
</asp:Content>
