<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Web.Models.ResetPasswordViewModel>" %>

<asp:Content ID="resetPasswordTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Reset Password
</asp:Content>

<asp:Content ID="resetPasswordSuccessContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Reset Password</h2>
    <p>
        The password for <%: Model.UserName %> has been successfully reset.  The new password is: <strong><%: Model.NewPassword %></strong>
    </p>
</asp:Content>
