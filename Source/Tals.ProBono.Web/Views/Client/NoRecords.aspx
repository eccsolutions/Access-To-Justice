<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    No Records
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Congratulations! You meet our rules and can ask questions through this system. </h2>

    <p>Ask your first question by clicking the button "Ask Now."</p>
    <br/>
    <p><%: Html.ActionLink("Ask Now", "Ask", "Client", new {@class="ImageLink"}) %></p>

</asp:Content>
