﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<div>
    <h2>Terms and Conditions of the <%=ConfigSettings.SiteName %> Website</h2>

    <p style="margin-bottom: 30px;"><%: Html.ActionLink("Frequently Asked Questions", "AttorneyFAQ", "Account", null, new {@class="ImageLink"}) %></p>
    <p>
        If you do not agree to the terms and conditions of the <%=ConfigSettings.SiteName %> website, you will not be able to use the system.</p>
    <p>By clicking the “I agree” button, you agree:</p>
    <ul>
        <li>You have read the terms and conditions of the <%=ConfigSettings.SiteName %> website,</li>
        <li>You consent to the limited nature of the attorney/client relationship both as to scope and duration,</li>
        <li>You are licensed to practice law in <%=ConfigSettings.StateName %> and you will respond to the question based on <%=ConfigSettings.StateName %>
            and/or federal law,</li>
        <li>If you accept a case from the <%=ConfigSettings.SiteName %> for ongoing representation you will notify State Support by sending an e-mail to
            <a href="mailto:<%=ConfigSettings.SiteEmail %>"><%=ConfigSettings.SiteEmail %></a>, and</li>
        <li>The information that you will provide is true and correct.</li>
    </ul>
</div>

