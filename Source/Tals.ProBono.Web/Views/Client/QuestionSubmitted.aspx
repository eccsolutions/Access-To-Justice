﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Question Submitted
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Thanks for your question.</h2>
    <p>
        We will ask a lawyer to answer you. This can take up to 14 days. We can't promise
        you will get an answer. If there is no answer after 14 days, we'll email you. If
        you don't have an email address, you will have to sign into your account to check
        for answers.</p>
    <p>
        The lawyer may need to ask you some questions before they can answer you. If so,
        we'll send you an email. If you don't have an email address, you will have to sign
        into your account to check for questions.</p>
    <p>You may have questions about the lawyer's answer. You can ask follow-up questions about the answer.</p>
    <p>Please take a moment to complete our short survey. Your feedback is important to us. <a href="https://www.surveymonkey.com/s/PYGVK9M" target="_blank">Click Here!</a></p>
    <div>
        <%: Html.ActionLink("Back to List", "Questions") %>
    </div>
</asp:Content>
