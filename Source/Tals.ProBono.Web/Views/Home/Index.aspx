<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Guest.Master" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.SiteName %> – Free Legal Advice & Counsel
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome to the <%=ConfigSettings.SiteName %>!</h2>
    
    <p>Volunteer lawyers may answer your legal questions for free.</p>
    
    <h2>How it works</h2>
    <ol>
        <li>Click the "New User" button below to find out if you can get help. You will be asked questions about yourself, your income, and your legal problem. All of your answers are confidential or secret. Only the lawyer who answers your question will see your name.</li>
        <li>Choose a username and password to use on this website. This keeps your information confidential and saves your question.</li>
        <li>Log in with your username and password.</li>
        <li>Type in your question. If you have a court date coming up, we can't promise you will get an answer before it.</li>
        <li>You will get an e-mail when a lawyer answered your question.</li>
        <li>Log back into this website and read the lawyer’s advice. If it isn't clear, you can ask more questions.</li>
    </ol>

    <p>If you are a new user, please register:</p>
    <p><a href="<%=Url.Action("SignUp","Account") %>" class="ImageLinkText"><i class="fa fa-user-plus fa-2x"></i> Register as a New User</a></p>
    
    <p><br/>Have you been here before? Sign in to see your answers or ask a new question:</p>
    <p><a href="<%=Url.Action("SignIn","Account") %>" class="ImageLinkText"><i class="fa fa-lock fa-2x"></i> Existing Users Sign In</a></p>
</asp:Content>
