<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Attorney.master" Inherits="System.Web.Mvc.ViewPage<MvcPaging.IPagedList<Tals.ProBono.Domain.Entities.Question>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AttorneyQuestions
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Question History for <%: ViewBag.UserName%></h2>
    <% Html.RenderPartial("ColorCoding"); %>
    <% Html.RenderPartial("QuestionListView", Model);%>

</asp:Content>
