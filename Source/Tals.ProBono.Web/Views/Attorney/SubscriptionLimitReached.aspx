<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Attorney.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Subscription Limit Reached
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Subscription Limit Reached</h2>
    
    You are currently subscribed to three categories. In order to subscribe to another category, first unsubscribe from another category.
</asp:Content>
