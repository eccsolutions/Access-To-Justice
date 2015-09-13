<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<p class="bold">We will ask questions to make sure:</p>
<ul>
    <li>You have a low income</li>
    <li>You are at least <%=ConfigSettings.MinimumAgeRequirement %> years old</li>    
    <li>You live or have a problem in Washington State</li>
    <li>Your legal issue isn&#39;t one you could go to jail for</li>
    <li>You don&#39;t already have a lawyer helping you with this problem</li>
</ul>

<p>You can only use this website if all of these things above are true. You must agree to tell the truth. We will keep your answers confidential. </p>
    
<p><b>Please remember:</b></p>

<ul>
    <li>There is no guarantee that a lawyer will answer your question.  This website is one resource you can use to get help, but not a promise of help.</li>
    <li>If you have an emergency, contact the police or use the resources listed to the left of this page to find help.</li>
    <li>Your question will be up for 14 days. A lawyer could answer it right away, or after several days. Please check back to see if your question was answered.</li>
</ul>