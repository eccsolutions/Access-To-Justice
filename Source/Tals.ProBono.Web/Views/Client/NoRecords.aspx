<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	No Records
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>You meet our RULES</h2>

    <p>
    You CAN ask questions on this system based on your answers to the previous questions. Ask your first question by clicking the button "Ask Now."
    </p>
    <br />
    <%: Html.ActionLink("Ask Now", "Ask", "Client", new {@class="ImageLink"}) %>

</asp:Content>
