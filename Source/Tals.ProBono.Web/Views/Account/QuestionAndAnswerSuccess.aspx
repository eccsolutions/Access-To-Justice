<%@Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="updateSecurityQuestionSuccessTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Change Password
</asp:Content>

<asp:Content ID="updateSecurityQuestionSuccessContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Update Security Question</h2>
    <p>
        You have successfully updated your security question and answer. If you ever forget your password, you will now be able to use this security question and answer to recover your password.
    </p>
    <p>
        <%: Html.ActionLink("Continue to Minnesota Legal Advice Online", "Index", "Home") %>
    </p>
</asp:Content>
