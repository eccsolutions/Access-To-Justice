<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    We're sorry... You do not meet our rules.
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>Eligibility for use of the <%=ConfigSettings.SiteName %> is limited to the following:</p>    
    <ul class="padded-list-sm">
        <li>You have a low income</li>
        <li>You are at least <%=ConfigSettings.MinimumAgeRequirement %> years old</li>    
        <li>You live or have a problem in Washington State</li>
        <li>Your legal issue isn&#39;t one you could go to jail for</li>
        <li>You don&#39;t already have a lawyer helping you with this problem</li>
    </ul>

    <%Html.RenderPartial("OtherPlacesToFindHelpPartial"); %>
</asp:Content>
