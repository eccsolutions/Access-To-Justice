<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<%@ Import Namespace="Tals.ProBono.Resources" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=Ask.ThanksMessage %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%=Ask.ThanksMessage %></h2>

    <p> <%=Ask.DurationMessage %></p>

    <p><%=Ask.LawyerAnswerMessage %></p>

    <p><%=Ask.FollowupMessage %></p>

    <p><%=Ask.SurveyMessage.Replace("{{SurveyLink}}","<a href=\""+ConfigSettings.ClientSurveyUrl+"\" target=\"_blank\">"+Ask.ShortSurvey+"</a>") %></p>

    <div>
        <%: Html.ActionLink(Common.BackToList, "Questions") %>
    </div>
</asp:Content>
