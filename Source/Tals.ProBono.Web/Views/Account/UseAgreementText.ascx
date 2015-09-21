<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<div>
    <h2>Terms and Conditions for Attorneys</h2>

    <p style="margin-bottom: 30px;"><%: Html.ActionLink("Frequently Asked Questions", "AttorneyFAQ", "Account", null, new {@class="ImageLink"}) %></p>
    <p>
        Thank you for your interest in volunteering with Wisconsin Legal Advice Online. Please read the FAQ above. It describes the service in more detail. If you do not agree to the terms and conditions of the Wisconsin Legal Advice website, you will not be able to volunteer as an attorney through this system.
    </p>
    <p>By clicking the “I agree” button, you are agreeing:</p>
    <ul>
        <li>To provide limited scope legal assistance to clients through this website in the form of brief advice and counsel in response to the questions you select;</li>
        <li>You are licensed and in good standing to practice law in Wisconsin and if your license status changes, you will notify us promptly; </li>
        <li>You will respond to the question based on applicable Wisconsin and/or federal law;</li>
        <li>All legal assistance provided through this website will be provided on a pro bono basis without fee or expectation of a fee; and</li>
        <li>The information that you will provide when you sign up is true and correct.</li>
    </ul>
</div>

