<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<MvcPaging.IPagedList<Tals.ProBono.Domain.Entities.Question>>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.AppName  %> Admin : Question List
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.RenderPartial("ColorCoding"); %>

    <div class="categorybanner">
        <h2>Question List</h2>
    </div>
    <% Html.RenderPartial("QuestionListView");%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="QuickLinksContent" runat="server">
    <div id="quicklinks">
        <div>
            <h3>Categories</h3>
            <% Html.RenderAction("CategoryMenu", "Nav"); %>
            <h3>Active/Closed Status</h3>
            <% Html.RenderAction("StatusMenu", "Nav"); %>
            <h3>Taken/Not Taken Status</h3>
            <% Html.RenderAction("TakenMenu", "Nav"); %>
        </div>
    </div>
</asp:Content>