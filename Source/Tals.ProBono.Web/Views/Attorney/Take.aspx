<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Attorney.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Web.Models.TakeViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Confirm Take
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="ConfirmationHeading">Take Question</h2>

    <img src="<%: Url.Image("warning.bmp") %>" alt="Warning!" /> Are you sure you want to take the question "<%: Model.Question.Subject %>"?
    <p id="WarningMessage">
        This question will be added to your queue for response. Any question taken should be answered within 3 business days.
    </p>
    <p>
        <% using(Html.BeginForm()) { %>
            <%: Html.HiddenFor(x => x.Question.Id) %>
            <input class="ImageLink" type="submit" value="Yes" />
            <%: Html.ActionLink("No", "Details", new {id = Model.Question.Id}, new {@class="ImageLink"}) %>
        <%} %>
    </p>

    <fieldset>
        <table class="gridview">
            <tr>
                <th colspan="2" style="vertical-align: top">
                    Started: <%: Model.Question.CreatedDate %>
                    <% if (Model.Question.CourtDate != null)
                       { %>
                        <br />Court Date: <%: Model.Question.CourtDate.Value.ToShortDateString() %>
                    <% } %>
                </th>
            </tr>
            <tr>
                <td class="display-user">
                    <%Html.RenderPartial("QuestionCreatedBy",Model.CreatedBy); %>
                </td>
                <td>
                    <div class="display-subject">Subject: <%: Model.Question.Subject %></div>
                    <br />
                    <div>Client County of Residence:<%: Model.Question.County.CountyName %></div>
                    <br />
                    <div>Client County of Venue:<%: Model.Question.CaseCounty == null ? "No County Selected" : Model.Question.CaseCounty.CountyName %></div>
                    <br />
                    <div>Adverse Party:<%: Model.Question.OpposingParty %></div>
                    <br />
                    <%: Html.Parse(Model.Question.Body) %>
                </td>
            </tr>
        </table>
    </fieldset>

</asp:Content>