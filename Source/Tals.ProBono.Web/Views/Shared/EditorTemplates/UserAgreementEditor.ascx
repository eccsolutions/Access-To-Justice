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

<% Html.RenderPartial("/Views/Shared/EditorTemplates/ClientUserAgreement.ascx"); %>
<br />
<div>
    <p>
        <%: Html.ActionLink("I agree", "AcceptUseAgreement", "Rules", new { accepted = true}, new { @class = "ImageLink"}) %>
        <%: Html.ActionLink("I don't agree", "AcceptUseAgreement", "Rules", new { accepted = false}, new { @class = "ImageLink"}) %>
    </p>
</div>