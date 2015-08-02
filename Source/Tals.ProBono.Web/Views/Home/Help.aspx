<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.SiteName %> - Other places to find legal help and information
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>For more information about the law visit:</h2>
    <div style="margin-left:30px;margin-bottom: 30px">
        <p><a href="http://www.AZLawHelp.org" target="_blank">AZLawHelp.org</a></p>
        <p><a href="http://www.LawForVeterans.org" target="_blank">LawForVeterans.org</a></p>
        <p><a href="http://www.LawforSeniors.org" target="_blank">LawforSeniors.org</a></p>
        <p><a href="http://www.LawforKids.org" target="_blank">LawforKids.org</a></p>
    </div>

    <h2>To Apply for a Free or Reduced Fee Attorney</h2>
    <div style="margin-left: 30px;margin-bottom: 30px">
        <p><a href="http://azlawhelp.org/accesstojustice/" target="_blank">Arizona’s Access to Justice Online Intake System</a></p>
    </div>

    <h2>Arizona Legal Aid Agencies</h2>
    <div style="margin-left: 30px;margin-bottom: 30px">
        <p><a href="http://dnalegalservices.org/" target="_blank">DNA Legal Services</a></p>
        <p><a href="http://clsaz.org/" target="_blank">Community Legal Services (CLS)</a></p>
        <p><a href="http://www.sazlegalaid.org/" target="_blank">Southern Arizona Legal Aid (SALA)</a></p>
        <p><a href="http://www.maricopabar.org/" target="_blank">Maricopa County Bar Association</a></p>
        <p><a href="http://pimacountybar.org/" target="_blank">Pima County Bar Association</a></p>
        <p><a href="http://www.azbar.org/FindALawyer" target="_blank">State Bar of Arizona</a></p>
    </div>

    <h2>Hotlines</h2>
    <div style="margin-left: 30px;margin-bottom: 10px">
        <p><a href="http://www.azlawhelp.org" target="_blank">Legal LEARN</a> (866-637-5341)</p>
        <p><a href="http://www.azcadv.org" target="_blank">National Domestic Violence Hotline</a> (800-799-7233)</p>
        <p><a href="http://www.azb.uscourts.gov" target="_blank">Bankruptcy Hotline</a> (866- 553-0893)</p>
    </div>

    <h2>Other Legal Assistance</h2>
    <div style="margin-left: 30px;margin-bottom: 10px">
        <p><a href="http://azlawhelp.org/legalaidlisting.cfm" target="_blank">AZLawHelp Resources Page</a></p>
        <p><a href="http://legalaidaz.com/" target="_blank">Legal Aid of Arizona</a></p>
    </div>
</asp:Content>
