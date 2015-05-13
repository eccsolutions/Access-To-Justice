<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.SiteName %> - Attorney Sign Up FAQ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Attorney Sign Up - Frequently Asked Questions</h2>
    <% if (!Request.IsAuthenticated) %>
    <% { %>
    <p style="margin-bottom: 30px;">
        <%: Html.ActionLink("Back to Attorney Sign Up", "AttorneySignUp", "Account", null, new { @class = "ImageLink" })%></p>
    <% } %>
    <p>
        <a href="#Q1">How does the <%=ConfigSettings.SiteName %> work?</a><br />
        <a href="#Q2">Who is eligible to use the <%=ConfigSettings.SiteName %>?</a><br />
        <a href="#Q3">Will I receive pro bono hours for participating?</a><br />
        <a href="#Q4">What kinds of lawyers should participate?</a><br />
        <a href="#Q5">What happens if a lawyer cannot answer a user’s question?</a><br />
        <a href="#Q6">What type of relationship exists between the client and lawyer?</a><br />
        <a href="#Q7">How do lawyers check for conflicts of interest?</a><br />
        <a href="#Q8">What about professional liability insurance coverage?</a><br />
        <a href="#Q9">Is there a confidentiality issue with client information/lawyer advice being housed on the internet?</a><br />
        <a href="#Q10">Navigating the Website and Selecting Questions to Answer</a><br />
        <a href="#Q11">Selecting Questions You Want to Answer</a><br />
        <a href="#Q12">Entering Pro Bono Hours</a><br />
        <br />
        <strong>Referral Questions:</strong><br />
        <a href="#Q13">How do I contact the administrator with a question?</a><br />
        <a href="#Q14">What if I think the user needs more help?</a><br />
        <a href="#Q15">How do I make a referral?</a><br />
        <a href="#Q16">What if I want to represent the client in their case?</a><br />
        <a href="#Q17">What if I see the same question over and over, is there something that I can use to provide answers?</a><br />
        <a href="#Q18">Where can I find information related to the question's substantive area of law?</a><br />
        <a href="#Q19">What if I have further questions or feedback?</a>
    </p>

    <p><strong><a id="Q1">How does the <%=ConfigSettings.SiteName %> work?</a></strong></p>
    <p><strong><a id="Q2">Who is eligible to use the <%=ConfigSettings.SiteName %>?</a></strong></p>
    <p><strong><a id="Q3">Will I earn pro bono hours for participating?</a></strong></p>
    <p><strong><a id="Q4">What kinds of lawyers should participate?</a></strong></p>
    <p><strong><a id="Q5">What happens if a lawyer cannot answer a user’s question?</a></strong></p>
    <p><strong><a id="Q6">What type of relationship exists between the client and lawyer?</a></strong></p>
    <p><strong><a id="Q7">How do lawyers check for conflicts of interest?</a></strong></p>
    <p><strong><a id="Q8">What about professional liability insurance coverage?</a></strong></p>
    <p><strong><a id="Q9">Is there a confidentiality issue with client information/lawyer advice being housed on the internet?</a></strong></p>
    <p><strong><a id="Q10">Navigating the Website and Selecting Questions to Answer</a></strong></p>
    <p><strong><a id="Q11">Selecting Questions You Want to Answer</a></strong></p>
    <p><strong><a id="Q12">How Do I Subscribe to a Category</a></strong></p>
    <p><strong><a id="Q13">Entering Pro Bono Hours</a></strong></p>
    <p><strong><a id="Q14">How do I contact the administrator with a question?</a></strong></p>
    <p><strong><a id="Q15">What if I think the user needs more help?</a></strong></p>
    <p><strong><a id="Q16">How do I make a referral?</a></strong></p>
    <p><strong><a id="Q17">What if I want to represent the client in their case?</a></strong></p>
    <p><strong><a id="Q18">What if I see the same question over and over, is there something that I can use to provide answers?</a></strong></p>
    <p><strong><a id="Q19">Where can I find information related to the question's substantive area of law?</a></strong></p>
    <p><strong><a id="Q20">What if I have further questions or feedback?</a></strong></p>
    <p>
        Contact the administrator at <a href="mailto:<%=ConfigSettings.SiteEmail %>"><%=ConfigSettings.SiteEmail %></a>.
    </p>
    <% if (!Request.IsAuthenticated) %>
    <% { %>
    <p style="margin-top: 30px;">
        <%: Html.ActionLink("Back to Attorney Sign Up", "AttorneySignUp", "Account", null, new { @class = "ImageLink" })%></p>
    <% } %>
</asp:Content>
