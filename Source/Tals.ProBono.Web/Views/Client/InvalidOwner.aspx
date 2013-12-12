<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	InvalidOwner
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Invalid Owner</h2>
    <p>
        You do not have access or ownership rights to the question you are attempting to access.
        Please return to the <%: Html.ActionLink("Question List", "Index") %>.
        There you may access questions that are owned and accessible by you.
    </p>
</asp:Content>
