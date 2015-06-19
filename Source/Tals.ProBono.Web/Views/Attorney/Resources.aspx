<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.SiteName %> - Training/Resource Materials
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Training/Resource Materials</h2>
    The links below provide introductory information about various areas of the law. Click the topic name to view the resource. To view the topic in a new tab, right click the topic name and select 'Open Link in New Tab'. The information is organized by the categories that we use for WLAO:

    <h3>Benefits Category</h3>
    <ul>
        <li><a href="http://ssa-custhelp.ssa.gov/app/">Social Security Administration's FAQ Page</a></li>
        <li><a href="http://www.wtls.org/fs_brochures.htm">Food Stamps Booklet</a></li>
        <li><a href="http://www.wtls.org/health_pubs.htm">Disablity</a></li>
        <li><a href="http://www.wtls.org/unemployment.htm">Unemployment</a></li>
    </ul>

    <h3>Debts and Purchases Category</h3>
    <ul>
        <li><a href="http://www.las.org/booklets/money_problems">Consumer / Cars / Debt Collection / Judgments</a></li>
    </ul>

    <h3>Family Law Category</h3>
    <ul>
        <li><a href="http://www.laet.org/getattachment/fadd96d6-d5e1-4e0e-bd99-7a6426f44276/Custody-Rights-for-Unmarried-Parents.aspx">Child Custody Booklet</a></li>
        <li><a href="http://www.selegal.org/Family%20Law.htm">Family Law Booklets</a></li>
        <li><a href="http://www.tncourts.gov/node/622453">Pro Se Divorce Forms</a></li>
        <li><a href="http://www.justiceforalltn.com/videos/basics-domestic-violence">Basics of Domestic Violence - Video</a></li>
        <li><a href="http://www.tn.gov/humanserv/cs/cs_handbook.pdf">Tennessee Child Support Handbook</a></li>
        <li><a href="http://www.lexisnexis.com/hottopics/tncode/">Grandparent Visitation Statute - TCA 36-6-306</a></li>
        <li><a href="http://www.lexisnexis.com/hottopics/tncode/">Parental Relocation Statute - TCA 36-6-108</a></li>
        <li><a href="http://www.wtls.org/images/Family/What%20You%20Need%20to%20Know%20About%20DivorceIII.pdf">Divorce Booklet</a></li>
        <li><a href="http://www.wtls.org/images/Family/Order%20of%20Protection.pdf">Order of Protection Booklet</a></li>
    </ul>

    <h3>Housing Category</h3>
    <ul>
        <li><a href="http://www.las.org/booklets/renters_homeowners/">Renter's Rights Booklet</a></li>
        <li><a href="http://www.justiceforalltn.com/videos/foreclosure-assistance">Foreclosure Assistance - Video</a></li>
    </ul>

    <h3>Inheriting Property Category</h3>
    <ul>
        <li><a href="http://www.selegal.org/Self-Help/Booklets/ADMINISTERING%20AN%20ESTATE%20BOOKLET.pdf">Administering an Estate Booklet</a></li>
        <li><a href="http://www.jeffersoncountytn.gov/government/jefferson-county-clerk/probate-court/">Example of Probate Court Procedures - Jefferson County</a></li>
    </ul>

    <h3>School/Jovenile Category</h3>
    <ul>
        <li><a href="http://www.laet.org/getattachment/1fceebaf-0d94-4702-8050-d4746c19f092/Emancipation.aspx">Emancipation Booklet</a></li>
    </ul>

    <h3>Work Category</h3>
    <ul>
        <li><a href="http://www.tn.gov/labor-wfd/faq_laws.shtml">Tennessee Labor Laws</a></li>
        <li><a href="http://www.tn.gov/labor-wfd/esdiv.shtml">Department of Labor's Guide to Unemployment Insurance</a></li>
        <li><a href="http://www.wtls.org/unemployment.htm">Unemployment Booklet</a></li>
    </ul>

    <h3>Other Category</h3>
    <ul>
        <li><a href="http://www.laet.org/getattachment/7622f31b-d992-4f8c-9e7f-cbecc2e03845/What_Is_A_Power_Of_Attorney.aspx">'What is a Power of Attorney' Booklet</a></li>
        <li><a href="http://www.laet.org/getattachment/9041a422-00a6-451c-be33-0c0f09c12567/conservator.aspx">Information About Being a Conservator</a></li>
        <li><a href="http://www.selegal.org/Self-Help/Booklets/CONSERVATORSHIP%20BOOKLET.pdf">Conservatorships Booklet</a></li>
        <li><a href="http://www.lexisnexis.com/hottopics/tncode/">Accepting Guardianship or Conservatorship Transferred from Another State - TCA 34-8-302</a></li>
        <li><a href="http://www.tndagc.com/expunge/">Expungement</a></li>
    </ul>
    <p>Visit our <%: Html.ActionLink("FAQs", "AttorneyFAQ", "Account", null,null) %> for more commonly asked questions.</p>

</asp:Content>
