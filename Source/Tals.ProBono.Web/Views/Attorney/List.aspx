<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Attorney.Master" Inherits="System.Web.Mvc.ViewPage<MvcPaging.IPagedList<Tals.ProBono.Domain.Entities.Question>>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.SiteName  %> : <%: ViewBag.Category ?? "All Questions in Queue" %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%: Html.ActionLink("Practice Areas", "PracticeAreas") %> > <%: ViewBag.Category ?? "All Questions in Queue" %>
    <% Html.RenderPartial("CLEInstructions"); %>
    <% Html.RenderPartial("ColorCoding"); %>

    <div class="categorybanner">
        <h2><%: ViewBag.Category ?? "All Questions in Queue" %></h2>
    </div>
    <div>
        <p>Click on a question for more information, including any adverse parties.</p>
    </div>
    <% Html.RenderPartial("QuestionListView");%>
</asp:Content>
