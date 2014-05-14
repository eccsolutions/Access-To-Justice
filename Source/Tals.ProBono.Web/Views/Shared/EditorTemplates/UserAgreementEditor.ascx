<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
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
    <h2>What you need to know to get FREE help from <a href="http://www.alabamalegalanswers.org">AlabamaLegalAnswers.org</a></h2>

<p class="bold">You can use this web site IF all of these are true for you:</p>
<ul>
    <li>Your income is low for a family the size of yours. Some kinds of income don’t count.</li>
    <li>Your cash, checking account, savings account, stocks or bonds are worth less than
        $5,000.</li>
    <li>You aren’t locked up in jail or prison.</li>
    <li>Your legal problem isn’t something you yourself can go to jail for.</li>
    <li>You haven't already hired a lawyer to help you with your legal problem.</li>
</ul>
    <p>
        We will ask questions to make sure you meet the low income and other rules. You
        must agree to tell the truth. We will keep your answers a secret. Don’t meet the
        rules? Then you can’t use this web site. But we will tell you if we know another
        place where you might get help.
    </p>

    <p style="font-weight: bold">
        About the lawyers</p>
    <p>
        The lawyer who answers you is helping you for free. The lawyer will only talk about
        the problem you put on the web site. The lawyer will not help you after that or
        do anything else for you. You are not hiring the lawyer who answers you. The lawyer
        will not write letters, make calls or file papers for you. The lawyer will not go
        to meetings or court for you. If you use this web site, it means you understand
        this. The lawyer who answers you will have a Alabama law license. The lawyer will
        say what the law is for Alabama. Laws may be different in other states.
    </p>
	
    <p style="font-weight: bold">
        Rules lawyers must go by</p>
    <p>
        Lawyers can only help one person in a case. Example: They can help a renter or a
        landlord. But they can’t help both of them with the same case. But on this web site,
        the lawyer only knows your name not the other side’s. They may be the lawyer for
        someone else in your case and not know it. Or the law firm they work for may be
        helping the other side in your case. If the lawyer knows this, they can’t answer
        your question. They must give it to another lawyer. But the lawyer may not know.
        If they don’t know and they answer you, they are not breaking the law. Using this
        web site means you won’t blame the lawyer for not knowing.
    </p>
    <p style="font-weight: bold">
        We keep what you say secret</p>
    <p>
        <a href="http://www.alabamalegalanswers.org">AlabamaLegalAnswers.org</a> is a web site of the Alabama Access to Justice Commission.
        The facts you put on this web site will be kept secret. We keep records of:</p>

    <ul>
        <li>What kind of legal problem you had</li>
        <li>What the lawyer told you</li>
        <li>Which county you live in</li>
        <li>Where you went on our web site</li>
        <li>How you found our web site</li>
    </ul>

    <p>
        We keep this to help us make our web site better. We will not sell it. We won’t
        share it unless a judge orders us to. But we can’t promise no one will break into
        our web site and see it.</p>


    <p class="bold">If you agree</p>
    <p>Clicking the "I Agree" button means:</p>
    <ul>
        <li>You read this paper and know the rules.</li>
        <li>You agree to tell the truth about your legal problem.</li>
        <li>You agree to ask only 3 questions about each legal problem in a year.</li>
    </ul>
    <p>Don't agree? Then you can't use this web site.</p>
</div>
<br />
<div>
    <p>
        <%: Html.ActionLink("I agree", "AcceptUseAgreement", "Rules", new { accepted = true}, new { @class = "ImageLink"}) %>
        <%: Html.ActionLink("I don't agree", "AcceptUseAgreement", "Rules", new { accepted = false}, new { @class = "ImageLink"}) %>
    </p>
</div>