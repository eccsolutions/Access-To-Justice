<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Tals.ProBono.Domain.Entities.Question>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Click on the subject to view your answers:</h2>

    <% Html.RenderPartial("QuestionList", Model); %>

    <p>
        <%: Html.ActionLink("Ask Another Question", "Ask") %>
    </p>

</asp:Content>

