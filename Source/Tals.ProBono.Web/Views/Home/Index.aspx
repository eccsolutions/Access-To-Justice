<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Guest.Master" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<%@ Import Namespace="Tals.ProBono.Web.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.SiteName %> – Free Legal Advice & Counsel
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome to <%=ConfigSettings.SiteName %>!</h2>
    <p>
        This free service allows eligible Wisconsin residents to post legal questions for our volunteer lawyers. Lawyers who have signed up to participate in this program select the questions that they want to answer. To use this website, you must first qualify for help.
    </p>
    <h2>How it works</h2>
    <ol>
        <li>See if you meet our rules for who we can help. Click on "New User" below. We will ask about your family, your income and your legal problem. We keep all of your answers secret. The lawyer who answers you will only know your name and your question.</li>
        <li>If you meet our rules, you will need to log in to the website. If you create a password, you should keep it a secret. Don't give it to anyone else. Write it down and keep it in a safe place. You will need it to see the answer to your question.</li>
        <li>Sign in and ask your question.</li>
        <li>If you have a court date, we can't promise you will have an answer before your court date.</li>
        <li>We will e-mail you when a lawyer answers. Come back to this web site and sign in to read the answer. If the answer isn't clear, you can ask follow-up questions.</li>
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
