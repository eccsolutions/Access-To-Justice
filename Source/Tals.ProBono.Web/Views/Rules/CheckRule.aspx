<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Tals.ProBono.Resources" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
   <%=SignUp.MeetRules %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%=SignUp.MeetRules %></h2>

    <h3><%: Html.ViewData["StepName"] %> - <%: Html.Display("Question") %></h3>

        <% using (Html.BeginForm()) {%>
            <%: Html.ValidationSummary(Messages.PleaseCorrectErrorBelow) %>

            <fieldset>
                <%: Html.Editor("Answer") %>
            </fieldset>
            <p>
                <input type="submit" value="<%=SignUp.NextQuestion %>" class="ImageLink" id="Next" />
            </p>

        <% } %>

    <div><%: Html.ActionLink(SignUp.StartOver, "Index") %></div>


</asp:Content>