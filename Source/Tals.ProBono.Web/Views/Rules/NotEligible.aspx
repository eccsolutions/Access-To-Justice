<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    We're sorry... You do not meet our rules.
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>Eligibility for use of the <%=ConfigSettings.SiteName %> is limited to the following:</p>    
    <ul>
        <li>You live or have a problem in <%=ConfigSettings.StateName %></li>
        <li>You are <%=ConfigSettings.MinimumAgeRequirement %> years old or older</li>
        <li>You don't already have a lawyer helping you with this problem</li>
    </ul>


    <%Html.RenderPartial("OtherPlacesToFindHelpPartial"); %>
</asp:Content>
