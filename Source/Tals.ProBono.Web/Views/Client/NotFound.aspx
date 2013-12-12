<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Not Found
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Not Found</h2>
    <p>
        The record you are attempting to access has not been found.
        Please return to the <%: Html.ActionLink("Question List", "Index") %>.
    </p>
</asp:Content>
