<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<div>
    <h2>Terms and Conditions For Attorneys</h2>

    <p style="margin-bottom: 30px;"><%: Html.ActionLink("Frequently Asked Questions", "AttorneyFAQ", "Account", null, new {@class="ImageLink"}) %></p>
    <p>
        If you do not agree to the terms and conditions of the Wisconsin Legal Advice website, you will not be able to volunteer as an attorney through this system.
    </p>
    <p>By clicking the “I agree” button, you agree:</p>
    <ul>
        <li>You have read the terms and conditions of the <%=ConfigSettings.SiteName %> website,</li>
        <li>You consent to the limited nature of the attorney/client relationship both as to scope and duration,</li>
        <li>You are licensed and in good standing to practice law in Wisconsin and you will respond to the question based on applicable Wisconsin and/or federal law, If your license status changes, you agree to notify us promptly.</li>
        <li>You agree that all legal assistance provided through this website will be provided on a pro bono basis without fee or expectation of a fee.</li>
        <li>If you accept a case from the <%=ConfigSettings.SiteName %> for ongoing representation you will notify us by sending an e-mail to
            <a href="mailto:<%=ConfigSettings.SiteEmail %>"><%=ConfigSettings.SiteEmail %></a>, and</li>
        <li>The information that you will provide when you sign up is true and correct.</li>
    </ul>
</div>

