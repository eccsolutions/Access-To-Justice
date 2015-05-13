<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Domain.Entities.Post>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Confirm Accept Answer
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="ConfirmationHeading">Accept Answer</h2>

    <img src="<%: Url.Image("warning.bmp") %>" alt="Warning!" /> Are you sure you want to accept this answer?
    <p id="WarningMessage">
        The answer will be accepted and no further posts will be allowed on this thread.
    </p>
    <p>
        <% using(Html.BeginForm()) { %>
            <%: Html.HiddenFor(x => x.Id) %>
            <%: Html.HiddenFor(x => x.QuestionId) %>
            <input class="ImageLink" type="submit" value="Yes" />
            <%: Html.ActionLink("No", "Details", new {id = Model.QuestionId}, new {@class="ImageLink"}) %>
        <%} %>
        
    </p>

    <fieldset>
        <table class="gridview">
            <tr>
                <th colspan="2">Started: <%: Model.CreatedDate %></th>
            </tr>
            <tr>
                <td class="display-user">
                    Created By: <%: Model.CreatedBy %>
                </td>
                <td>
                    <div class="display-subject">Subject: <%: Model.Subject %></div>
                    <br />
                    <div>Client County of Residence:<%: Model.Question.County.CountyName %></div>
                    <br />
                    <div>Client County of Venue:<%: Model.Question.CaseCounty == null ? "No County Selected" : Model.Question.CaseCounty.CountyName %></div>
                    <br />
                    <div>Adverse Party:<%: Model.Question.OpposingParty %></div>
                    <br />
                    <%: Html.Parse(Model.Body) %>
                </td>
            </tr>
        </table>
    </fieldset>

</asp:Content>

