<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<script type="text/javascript">
    $(document).ready(function () {
        $("#acceptagreement").click(function () {
            $("#AcceptedUserAgreement").val("true");
        });
        $("#declineagreement").click(function () {
            $("#AcceptedUserAgreement").val("false");
        });
    });
</script>
<style>
    #Next { display: none;}
</style>
<div id="UserAgreement">
    <h2>User Agreement</h2>

<p class="bold">If you use this website, it means you understand and agree that:</p>

<ul class="padded-list-sm">
    <li>A lawyer is helping you for free.</li>
    <li>The lawyer only helps you with the question you type into this website. The lawyer won’t help you after that or do anything else for you.</li>
    <li>This means:
        <ul class="padded-list-sm">
            <li>The lawyer won&#39;t write letters, make calls, or file papers for you.</li>
            <li>The lawyer won&#39;t go to meetings or court for you.</li>
            <li>You can&#39;t contact the lawyer outside of this website unless the lawyer gives you permission.</li>
            <li>If the lawyer asks you to send documents, and gives you contact information for you to be able to do that, you agree not to use that information to contact the lawyer for other help unless the lawyer gives you permission to do that.</li>
        </ul>
    </li>
    <li>The lawyer has a Washington law license.</li>
    <li>The lawyer only tells you Washington law. Laws may be different in other states.</li>
    <li>All volunteer lawyers using the system can see what you ask in your question.</li>
    <li>Only the lawyer who helps you can see your name, county, and the other side&#39;s name in the case. If you have an open legal case, the lawyer who helps you can see what county you entered for that case.</li>
    <li>The people who run this website do not provide the legal advice.</li>
    <li>The people who run this website are not responsible for the advice the volunteer lawyer gives you through this website.</li>
</ul>

<p>Lawyers can only help one side in a case. For example, a lawyer can help either the renter or the landlord. The lawyer can’t help both of them with the same case. If you use this website, it means you understand and agree that:</p>

<ul class="padded-list-sm">
    <li>The lawyer or the lawyer&#39;s company could be helping the other person in your case and not know that when they answer your question.</li>
    <li>If the lawyer or lawyer&#39;s company is helping the other person in your case and they answer your question, they are not breaking the law because they did not know it was the same case. If you use this website, it means you will not blame the lawyer or the lawyer&#39;s company for not knowing it was the same case.</li>
    <li>If the lawyer finds out they are helping both sides on the same case before they answer your question, they can&#39;t answer your question. They have to give your question to another lawyer on the website who is not already working on the case.</li>
</ul>

<p>Your questions are secret.</p>

<ul class="padded-list-sm">
    <li>Only the people who run the website, you, and the volunteer lawyers can see the question and the facts you type into the website.</li>
    <li>Only the people who run the website and the lawyer who agrees to answer your question can see your name.</li>
    <li>This website keeps your information to help make the website better.</li>
    <li>We won&#39;t sell your information. We won&#39;t share it unless a judge says we have to. We can&#39;t promise no one will break into the website and see your information.</li>
</ul>

<p>This is the information the website keeps:</p>

<ul class="padded-list-sm">
    <li>what type of legal problem you had (housing, family law, debt, immigration, etc.),</li>
    <li>your question</li>
    <li>the name of the lawyer who answered your question,</li>
    <li>what the lawyer told you on the website,</li>
    <li>your responses to what the lawyer told you,</li>
    <li>what county you live in,</li>
    <li>the other party’s name in your case (if you entered this information)</li>
    <li>the county your case is in (if you entered this information)</li>
    <li>what you clicked on in the website (where you went on this website), and</li>
    <li>how you found our website (from a Google search, from washingtonlawhelp.org, or from another organization)</li>
    <li>If you communicate with the lawyer outside of the website, the people running this website can’t see what the lawyer tells you and won’t keep records of this.</li>
    <li>The people running this website are not responsible for the advice the lawyer tells you outside of the website.</li>
</ul>

<p>To use this website, you must also agree to the next two statements:</p>

<ul class="padded-list-sm">
    <li>I do not already have a lawyer helping me with this problem.</li>
    <li>I will tell the truth about my legal problem.</li>
</ul>

<p class="bold">If you don’t agree, then you can't use this website.</p>

</div>
<br />
<div>
    <p>
        <%: Html.ActionLink("I agree", "AcceptUseAgreement", "Rules", new { accepted = true}, new { @class = "ImageLink"}) %>
        <%: Html.ActionLink("I don't agree", "AcceptUseAgreement", "Rules", new { accepted = false}, new { @class = "ImageLink"}) %>
    </p>
</div>