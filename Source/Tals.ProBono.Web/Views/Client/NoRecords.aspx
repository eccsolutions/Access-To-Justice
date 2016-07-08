<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Resources" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=Questions.NoRecordsMessage %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%=SignUp.Congrats %> </h2>

    <p><%=SignUp.AskNowMessage %></p>
    <br/>
    <p><%: Html.ActionLink(SignUp.AskNow, "Ask", "Client", new {@class="ImageLink"}) %></p>

</asp:Content>
