<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Attorney.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Web.Models.IProfile>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Profile
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%: Html.PreviousPageLink("Back to previous screen") %>
    <% Html.RenderPartial("ClientAdminActions", Model);%>

    <% if(Model.ProfileType == ProfileType.Attorney) { %>
    <% Html.RenderPartial("AttorneyProfileDetails");%>
    <% Html.RenderPartial("ColorCoding"); %>
    <%} else {%>
    <% Html.RenderPartial("ClientProfileDetails"); %>
    <%} %>

    <h2>Question History for <%: Model.Profile.FullName %></h2>
    <% Html.RenderPartial("QuestionListView", Model.Questions);%>
</asp:Content>