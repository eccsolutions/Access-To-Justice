<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ApprovalNeeded
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Approval Needed</h2>
    <p>
        Thank you for signing up as a volunteer lawyer with us! As soon as your account
        has been verified and approved, you will be able to begin using the site to help
        others with their legal questions. This process can take up to 24 - 48 hours. You 
        will receive an email when you account has been approved.
    </p>
</asp:Content>
