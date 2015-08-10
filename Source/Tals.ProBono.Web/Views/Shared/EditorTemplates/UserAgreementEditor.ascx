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
    <h2>Client User Agreement</h2>

    <p>By using this website to submit a legal question, it means that you understand and agree that:</p>
    <ol>
	    <li>You do not already have a lawyer helping you with this problem.</li>		<li>You have answered the eligibility questions truthfully</li>				<li>You must tell the truth about your problem.</li>
	    <li>You may not ask more than 3 questions per calendar year through this website.</li>
	    <li>If a lawyer agrees to answer your question through this website, you will become a client of that lawyer for the limited purpose listed in this Client User Agreement.</li>
	    <li>Any lawyer answering your question through this website is helping you for free.</li>
	    <li>The sponsors of this website do not provide the legal advice and are not responsible for the advice any volunteer lawyer gives you through this website.</li>
	    <li>If a lawyer agrees to answer your question through this website, the lawyer will use his or her best judgment, but the lawyer is not promising any particular outcome.</li>
	    <li>If a lawyer agrees to answer your question through this website, the lawyer will only provide the following services to you:
		    <ol>
			    <li>Review the information and question that you provide; </li>
			    <li>Respond to your legal question based on applicable law in Wisconsin; and</li>
			    <li>Suggest additional resources that you can consult for further assistance or information</li>
		    </ol>
	    </li>
	    <li>The legal advice that lawyers provide through this website is limited. The lawyer has not made any independent investigation of the facts and is relying entirely on your disclosure of the facts to the lawyer through this website.</li>
	    <li>After the lawyer provides an answer to your question, the lawyer won’t help you after that or do anything else for you. This means:
		    <ol>
			    <li>The lawyer won’t help investigate the facts of your situation for you.</li>
			    <li>The lawyer won’t write letters, make calls, or file papers for you.</li>
			    <li>The lawyer won’t go to meetings or to court for you.</li>
			    <li>You can’t contact the lawyer outside of this website for any reason unless the lawyer gives you permission to do that.</li>
		    </ol>
	    </li>
    </ol>

    <h3>Conflicts</h3>
    <p>
    This website is a short-term limited legal services program that allows you to post legal questions for Wisconsin lawyers who sign up and volunteer their time to provide answers. There is no expectation of any ongoing relationship between you and the volunteer lawyer. If you are aware of any potential conflict of interest while the lawyer is helping you, you must tell the lawyer about the potential conflict at that time. If the lawyer learns of a conflict while assisting you, the lawyer will tell you and your question will be reassigned to another willing lawyer who volunteers through this website. Because this website is a short-term limited legal services program, another lawyer in the lawyer's firm or another volunteer in this program may represent someone with interests opposed to yours. 
    </p>

    <h3>Confidentiality</h3>
    <p>
    By using this website, you are agreeing that the website administrator may review the information you provide to ensure that: (1) your question qualifies for this service; (2) your question is categorized properly for the volunteers; and (3) the website is operating properly. The lawyer and the administrator of this website will keep your information confidential. Only you, the website administrator, and approved volunteers can see the information that you type into the website. For more information about the information our website collects, please see our <a href="/Home/PrivacyPolicy">Privacy Policy</a>. 
    </p>

    <h3>Complete agreement</h3>
    <p>
    This agreement accurately states the full agreement for limited legal services between you and any volunteer lawyer who agrees to assist you. By clicking Agree below, you confirm that there are no other agreements or representations that have been made to you regarding the scope of the legal services that will be provided to you. You understand and agree to the scope of the legal representation and services described in this agreement, including the limitations on those services.  
    </p>

    <h3>If you don’t agree, then you can't use this website.</h3>
</div>
<br />
<div>
    <p>
        <%: Html.ActionLink("I agree", "AcceptUseAgreement", "Rules", new { accepted = true}, new { @class = "ImageLink"}) %>
        <%: Html.ActionLink("I don't agree", "AcceptUseAgreement", "Rules", new { accepted = false}, new { @class = "ImageLink"}) %>
    </p>
</div>