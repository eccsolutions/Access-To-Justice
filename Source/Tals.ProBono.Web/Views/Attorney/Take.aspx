<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Attorney.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Domain.Entities.Question>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Confirm Take
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="ConfirmationHeading">Take Question</h2>

    <img src="<%: Url.Image("warning.bmp") %>" alt="Warning!" /> Are you sure you want to take the question "<%: Model.Subject %>"?
    <p id="WarningMessage">
        This question will be added to your queue for response. Any question taken should be answered within 3 business days.
    </p>
    <p>
        <% using(Html.BeginForm()) { %>
            <%: Html.HiddenFor(x => x.Id) %>
            <input class="ImageLink" type="submit" value="Yes" />
            <%: Html.ActionLink("No", "Details", new {id = Model.Id}, new {@class="ImageLink"}) %>
        <%} %>
    </p>

    <fieldset>
        <table class="gridview">
            <tr>
                <th colspan="2">
                    Started: <%: Model.CreatedDate %>
                    <% if (Model.CourtDate != null) { %>
                        <br />Court Date: <%: Model.CourtDate.Value.ToShortDateString() %>
                    <% } %>
                </th>
            </tr>
            <tr>
                <td class="display-user">
                    Created By: <%:Profile.FirstName %> <%:Profile.MiddleInitial %> <%:Profile.LastName %> (<%: Model.CreatedBy %>)
                </td>
                <td>
                    <div class="display-subject">Subject: <%: Model.Subject %></div>
                    <br />
                    <div>Client County of Residence:<%: Model.County.CountyName %></div>
                    <br />
                    <div>Client County of Venue:<%: Model.CaseCounty == null ? "No County Selected" : Model.CaseCounty.CountyName %></div>
                    <br />
                    <div>Adverse Party:<%: Model.OpposingParty %></div>
                    <br />
                    <%: Html.Parse(Model.Body) %>
                </td>
            </tr>
        </table>
    </fieldset>

</asp:Content>

