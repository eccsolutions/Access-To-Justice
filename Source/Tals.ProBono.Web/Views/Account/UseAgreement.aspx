<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Use Agreement
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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

<div id="UserAgreement">
    <% Html.RenderPartial("UseAgreementText"); %>
</div>

<div>
    <p>
        <%: Html.ActionLink("I agree", "AcceptUseAgreement", new { accepted = true}, new { @class = "ImageLink"}) %>
        <%: Html.ActionLink("I don't agree", "AcceptUseAgreement", new { accepted = false}, new { @class = "ImageLink"}) %>
    </p>
</div>

</asp:Content>