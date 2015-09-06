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

    <p class="bold">If you use this website program, it means you understand and agree that:</p>

    <h3>A – Scope of Services</h3>

    <ul>
        <li>You are only allowed to ask 3 separate questions through the website program in any one month. </li>
        <li>If your question is accepted, the lawyer is answering your question(s) for free.</li>
        <li>You can&#39;t contact the lawyer outside of this website program regarding your question unless the lawyer gives you permission.</li>
        <li>This website program only expects the volunteer lawyer to help you with the question you type into this website. No other help should be expected from the lawyer. This means that the lawyer is not expected to write letters, make calls, or file papers for you. It also means that the lawyer is not expected to go to meetings or court for you. Any of those services will be outside the scope of this website.</li>
        <li>If the lawyer indicates to you that he/she may be interested in assisting you beyond answering your typed question, you understand this is outside the scope of this website program and should not be expected.</li>
        <li>If the lawyer asks you to send documents, and gives you contact information for you to be able to do that, you agree not to use that information to contact the lawyer for other help unless the lawyer gives you permission.</li>
        <li>The lawyer has an Arizona law license.</li>
        <li>The lawyer only tells you Arizona law or Federal law. Laws may be different in other states. </li>
        <li>The agencies administrating this website program do not provide legal advice.</li>
        <li>The agencies administrating this website program are not responsible for the advice the volunteer lawyer gives you through this website.</li>
    </ul>

    <h3>B – Conflict for the Lawyer in Helping Answer Questions</h3>

    <p>You understand that Lawyers can only help one side in a case. (For example, a lawyer can help either the renter or the landlord. The lawyer can’t help both of them with the same case.) If you use this website, it means you understand and agree that: </p>

    <ul>
        <li>The lawyer or the lawyer&#39;s company could be helping the other person in your case and not know that when they answer your question.</li>
        <li>If the lawyer or lawyer&#39;s company is helping the other person in your case and they answer your question, they are not breaking the law because they did not know it was the same case. If you use this website, it means you will not blame the lawyer or the lawyer&#39;s company for not knowing it was the same case.</li>
        <li>If the lawyer finds out they are helping both sides on the same case before they answer your question, they can&#39;t answer your question. They have to open your question so another lawyer on the website, who is not already working on the case, may help you.</li>
    </ul>

    <h3>C – Confidentiality and Use of Information</h3>

    <ul>
        <li>All of the website program&#39;s volunteer lawyers and designated personnel of the agencies administering this system can see what you type in your original question.</li>
        <li>Only you, the volunteer lawyer(s) who accept your question, and the designated people administering this website program can see:
            <ul>
                <li>Your name, birthdate, county, and the other side&#39;s name in the case, and if you have a current court case, the county where the case is open.</li>
                <li>Any follow up comments from the attorney or you in your question exchange.</li>
            </ul>
        </li>
        <li>This website program may ask you to complete a satisfaction survey, the reporting of this feedback will not disclose personal identifying information.</li>
        <li>Questions and answers provided via this website may not be protected by client/attorney privilege. If an authorized court orders the release of this information, it will be disclosed according to law.</li>
        <li>Identifying information will be NOT be used for profit or promotion of this website program or for any purposes outside the requirements of Arizona law to protect the public or personal safety of individuals.</li>
        <li>While security measures are taken, there is no guarantee that this website program will not be subject of a cyber-attack or computer hacker illegal acts.</li>
        <li>The information you submit is held on this website, and includes:
            <ul>
                <li>What type of legal problem you had (housing, family law, debt, immigration, etc.),</li>
                <li>Your question, name and birthdate,</li>
                <li>The name of the lawyer who answered your question, What the lawyer told you on the website,</li>
                <li>Your responses to what the lawyer told you,</li>
                <li>What county you live in,</li>
                <li>The other party&#39;s name in your case (if you entered this information)</li>
                <li>The county your case is in (if you entered this information)</li>
                <li>What you clicked on in the website (where you went on this website), and</li>
                <li>How you found our website (from a Google search, from AZlawhelp.org, LawforVeterans.org, LawforSeniors.org or from another organization)</li>
            </ul>
        </li>
    </ul>

    <p>If you and the lawyer communicate outside of the website, the people running this website can&#39;t see what the lawyer tells you and won&#39;t keep records of this.</p>
     <ul>
         <li>The agencies responsible for running this website are not responsible for the advice the lawyer tells you outside of the website.</li>
     </ul>

    <p>To use this website, you must also agree to the next two statements:</p>
    <ul>
        <li>I do not already have a lawyer helping me with this problem.</li>
        <li>I will tell the truth about my legal problem.</li>
    </ul>

    <p><strong>If you don’t agree, then you can't use this website.</strong></p>
</div>
<br />
<div>
    <p>
        <%: Html.ActionLink("I agree", "AcceptUseAgreement", "Rules", new { accepted = true}, new { @class = "ImageLink"}) %>
        <%: Html.ActionLink("I don't agree", "AcceptUseAgreement", "Rules", new { accepted = false}, new { @class = "ImageLink"}) %>
    </p>
</div>