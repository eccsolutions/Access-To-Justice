<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Guest.Master" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.SiteName %> – Free Legal Advice & Counsel
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome to <%=ConfigSettings.SiteName %>!</h2>
    
    <p><%=ConfigSettings.SiteName %> is a website where low-income people who have a civil legal problem in Washington State can get free legal advice from volunteer attorneys by creating an account and logging in to post their legal questions.</p>
    <p>To get free legal advice through <%=ConfigSettings.SiteName %>, you must first qualify for help.</p>
    
    <h2>How it works</h2>
    <ol>
        <li>Click the &quot;Register as a New User&quot; button below to find out if you can get help. You will be asked questions about yourself, your income, and your legal problem. All of your answers will be kept secret. </li>
        <li>Choose a username and password to use on this website. This keeps your information confidential and saves your question.</li>
        <li>Log in with your username and password.</li>
        <li>Type in your question. If you have a court date or other deadline coming up, we can&#39;t promise you will get an answer before that time.</li>
        <li>We will send you an e-mail when a lawyer answers your question.</li>
        <li>Log back into this website and read the lawyer&#39;s advice. If it isn&#39;t clear, you can ask more questions.</li>
    </ol>

    <p>If you are a new user, please register:</p>
    <p><a href="<%=Url.Action("SignUp","Account") %>" class="imageLinkText"><i class="fa fa-user-plus fa-2x"></i> Register as a New User</a></p>
    
    <p><br/>Have you been here before? Sign in to see your answers or ask a new question:</p>
    <p><a href="<%=Url.Action("SignIn","Account") %>" class="imageLinkText"><i class="fa fa-lock fa-2x"></i> Existing Users Sign In</a></p>
</asp:Content>
