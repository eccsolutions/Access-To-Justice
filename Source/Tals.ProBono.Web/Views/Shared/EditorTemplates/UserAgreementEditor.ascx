<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<%@ Import Namespace="Tals.ProBono.Resources" %>
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
    <h2><%=UserAgreement.Title %></h2>

<p class="bold"><%=UserAgreement.UnderstandAndAgree %></p>

<ul class="padded-list-sm">
    <li><%=UserAgreement.AgreeItem1 %></li>
    <li><%=UserAgreement.AgreeItem2 %></li>
    <li><%=UserAgreement.AgreeItem3 %>
        <ul class="padded-list-sm">
            <li><%=UserAgreement.AgreeItem3Sub1 %></li>
            <li><%=UserAgreement.AgreeItem3Sub2 %></li>
            <li><%=UserAgreement.AgreeItem3Sub3 %></li>
            <li><%=UserAgreement.AgreeItem3Sub4 %></li>
        </ul>
    </li>
    <li><%=UserAgreement.AgreeItem4.Replace("{{StateName}}",ConfigSettings.StateName) %></li>
    <li><%=UserAgreement.AgreeItem5.Replace("{{StateName}}",ConfigSettings.StateName) %></li>
    <li><%=UserAgreement.AgreeItem6 %></li>
    <li><%=UserAgreement.AgreeItem7 %></li>
    <li><%=UserAgreement.AgreeItem8 %></li>
    <li><%=UserAgreement.AgreeItem9 %></li>
</ul>

<p><%=UserAgreement.LawyerUnderstandAndAgree %></p>

<ul class="padded-list-sm">
    <li><%=UserAgreement.LawyerAgreeItem1 %></li>
    <li><%=UserAgreement.LawyerAgreeItem2 %></li>
    <li><%=UserAgreement.LawyerAgreeItem3 %></li>
</ul>

<p><%=UserAgreement.SecretUnderstandAndAgree %></p>

<ul class="padded-list-sm">
    <li><%=UserAgreement.SecretAgreeItem1 %></li>
    <li><%=UserAgreement.SecretAgreeItem2 %></li>
    <li><%=UserAgreement.SecretAgreeItem3 %></li>
    <li><%=UserAgreement.SecretAgreeItem4 %></li>
</ul>

<p><%=UserAgreement.InfoUnderstandAndAgree %></p>

<ul class="padded-list-sm">
    <li><%=UserAgreement.InfoAgreeItem1 %></li>
    <li><%=UserAgreement.InfoAgreeItem2 %></li>
    <li><%=UserAgreement.InfoAgreeItem3 %></li>
    <li><%=UserAgreement.InfoAgreeItem4 %></li>
    <li><%=UserAgreement.InfoAgreeItem5 %></li>
    <li><%=UserAgreement.InfoAgreeItem6 %></li>
    <li><%=UserAgreement.InfoAgreeItem7 %></li>
    <li><%=UserAgreement.InfoAgreeItem8 %></li>
    <li><%=UserAgreement.InfoAgreeItem9 %></li>
    <li><%=UserAgreement.InfoAgreeItem10 %></li>
    <li><%=UserAgreement.InfoAgreeItem11 %></li>
    <li><%=UserAgreement.InfoAgreeItem12 %></li>
</ul>

<p><%=UserAgreement.UseUnderstandAndAgree %></p>

<ul class="padded-list-sm">
    <li><%=UserAgreement.UseAgreeItem1 %></li>
    <li><%=UserAgreement.UseAgreeItem2 %></li>
</ul>

<p class="bold"><%=UserAgreement.AgreeWarning %></p>

</div>
<br />
<div>
    <p>
        <%: Html.ActionLink(UserAgreement.IAgree, "AcceptUseAgreement", "Rules", new { accepted = true}, new { @class = "ImageLink"}) %>
        <%: Html.ActionLink(UserAgreement.IDontAgree, "AcceptUseAgreement", "Rules", new { accepted = false}, new { @class = "ImageLink"}) %>
    </p>
</div>