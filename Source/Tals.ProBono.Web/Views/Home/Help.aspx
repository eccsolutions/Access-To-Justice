<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.AppName %> - Other places to find legal help and information
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Other places to find legal help and information:</h2>
    <p><i><a href="http://www.mvlp.org">Mississippi Volunteer Lawyers Project</a></i></p>
    <p>MVLP is a nonprofit legal services program that assists clients who financially qualify for their services with attorneys who will represent them for free.
        MVLP does not assist with any criminal matters.</p>
    <p><i>Legal Services Programs</i></p>
    <p>Mississippi Center for Legal Services: <a href="http://www.mscenterforlegalservices.org">www.mscenterforlegalservices.org</a><br/>
        North Mississippi Rural Legal Services: <a href="http://www.nmrls.com">www.nmrls.com</a></p>
    <p>
    Mississippi's Legal Services Programs provide free legal advice and lawyer to represent you in court for free. Like MVLP, they help people with low incomes. Depending on your age and
    situation, they may be able to help regardless of your income. The programs do not assist with criminal matters.
    </p>
    <p><i>Free Legal Workshops and Clinics</i></p>
    <p>
        To find out about upcoming free legal workshops and clinics where you can get advice and/or help with preparing legal documents from a lawyer in your community,
        visit the website for the Mississippi Access to Justice Commission.  The website also contains information and links to website for other legal services programs throughout Mississippi.
        <a href="http://www.msatjc.org">www.msatjc.org</a>
    </p>
    <p>
        <i>Other helpful information and organizations:</i></p>
    <ul>
        <li><a href="http://www.ospd.ms.gov" target="_blank">Mississippi Office of the State Public Defender</a> (For assistance with criminal matters)</li>
        <li><a href="http://www.ago.state.ms.us" target="_blank">Mississippi Attorney General's Office</a></li>
    </ul>
    <p>
        If you have problems with this website, you may contact us at <a href="mailto:mvlp@mvlp.org">mvlp@mvlp.org</a>. This email address is for technical questions or website problems only. We will not answer your legal question.</p>
</asp:Content>
