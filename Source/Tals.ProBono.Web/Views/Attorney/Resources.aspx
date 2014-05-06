<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
   Minnesota Legal Advice Online - Training/Resource Materials
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Training/Resource Materials</h2>
    <p>Please visit <a href="http://www.ProJusticeMN.org" target="_blank">www.ProJusticeMN.org</a> to see training materials, recorded trainings and webinars, sample language with legal information for commonly asked questions, and other reference materials.</p>

    <p>Signing up is easy. Just click “Join ProJusticeMN” on the left side of the webpage, and then follow the prompts. If you are a private attorney, just indicate that you are engaged in pro bono work. We will review your application and approve your membership.</p>

    <p>Looking for basic legal information or legal referral information? Visit <a href="http://www.LawHelpMN.org" target="_blank">www.LawHelpMN.org</a> to see general information for the public.</p>

    <p>Visit our <%: Html.ActionLink("F.A.Q. page", "AttorneyFAQ", "Account",null)%> for more commonly asked questions.</p>
    
</asp:Content>
