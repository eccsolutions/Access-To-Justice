<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Tals.ProBono.Domain.Entities.Question>>" %>
<%@ Import Namespace="Tals.ProBono.Resources" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=Questions.Title %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%=Questions.ClickToView %></h2>

    <% Html.RenderPartial("QuestionList", Model); %>

    <p>
        <%: Html.ActionLink(Questions.AskAnotherQuestion, "Ask") %>
    </p>

</asp:Content>

