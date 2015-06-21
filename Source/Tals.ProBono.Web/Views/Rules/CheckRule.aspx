<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Check Rule
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Sign Up - See if you meet our rules</h2>

    <h3><%: Html.ViewData["StepName"] %> - <%: Html.Display("Question") %></h3>

        <% using (Html.BeginForm()) {%>
            <%: Html.ValidationSummary("Please correct the error below:") %>

            <fieldset>
                <%: Html.Editor("Answer") %>
            </fieldset>
            <p>
                <input type="submit" value="Next Question" class="ImageLink" id="Next" />
            </p>

        <% } %>

    <div><%: Html.ActionLink("Start Over", "Index") %></div>


</asp:Content>