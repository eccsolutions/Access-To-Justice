<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Guest.Master" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<%@ Import Namespace="Tals.ProBono.Web.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.SiteName %> – Free Legal Advice & Counsel
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome to the <%=ConfigSettings.SiteName %>!</h2>
    <p>
        Volunteer lawyers may answer your legal questions for free. To use this website, you must first qualify for help.
    </p>
    <h2>How it works</h2>
    <ol>
        <li>Click the "New User" button below to find out if you can get help. You will be asked questions about yourself, your income, and your legal problem. All of your answers are confidential or secret. Only the lawyer who answers your question will see your name.</li>
        <li>If you qualify for help, pick out a username and password to use on this website. This keeps your information confidential and saves your question.</li>
        <li>Log in with your username and password.</li>
        <li>Type in your question. If you have a court date coming up, we can't promise you will get an answer before it.</li>
        <li>You will get an e-mail when a lawyer answered your question.</li>
        <li>Log back into this website and read the lawyer’s advice. If it isn't clear, you can ask more questions.</li>
    </ol>
    <p>
        <%: Html.ImageLink("bubble.png", "New User", "SignUp", "Account") %><br/>
        <%: Html.ActionLink("New User", "SignUp", "Account", null, new {@class="ImageLinkText"}) %>
    </p>
    <p>
        Have you been here before? Click the sign in button to see your answer or ask a new question.
    </p>
    <p>
        <%: Html.ImageLink("bubble.png", "Sign in", "SignIn", "Account") %><br/>
        <%: Html.ActionLink("Sign in", "SignIn", "Account", null, new {@class="ImageLinkText"}) %>
    </p>
    <p>
        
    </p>
</asp:Content>
