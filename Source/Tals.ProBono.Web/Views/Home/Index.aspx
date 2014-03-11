<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Guest.Master" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="Tals.ProBono.Web.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Alabama Legal Answers – Free Legal Advice & Counsel for Alabamians
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome to the AlabamaLegalAnswers site!</h2>
    <p>
        <%:ViewRes.Index.WelcomeMessage %>
    </p>
    <h2>
        How it works</h2>
    <ol>
        <li>See if you meet our rules for who we can help. Click on "Rules" at the bottom of
            this page. We will ask about your family, your income and your legal problem. We
            keep all of your answers secret. The lawyer who answers you will only know your
            name.</li>
        <li>If you meet our rules, you pick a name and password to use. This keeps your information
            secret. Don't give it to anyone else. Write it down and keep it in a safe place.
            You will need it to see the answer to your question.</li>
        <li>Sign in and ask your question.</li>
        <li>If you have a court date, we can't promise you will have an answer before your court
            date.</li>
        <li>We will e-mail you when a lawyer answers. Come back to this web site and sign in
            to read the answer. If the answer isn't clear, you can ask follow-up questions.</li>
    </ol>
    <p>
        <span class="bold">First time here?</span> Click on "Rules" below to see if you
        can use this web site.
    </p>
    <p>
        <span class="bold">Already met the rules?</span> Click on "See Answers or Ask Questions".
    </p>
    <p style="padding: 30px 0 30px 0;">
        <%: Html.ActionLink("Rules", "Index", "Rules", null, new {@class="ImageLink"}) %>
        <%: Html.ActionLink("See Answers or Ask Questions", "Questions", "Client", null, new {@class="ImageLink"}) %>
    </p>
</asp:Content>
