<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DetailsViewModel>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
    <fieldset>
    <table class="gridview">
        <tr>
            <th colspan="2" class="postbanner">
                <div class="postbannerLeft">
                    Started: <%: Model.Question.CreatedDate %>
                    <% if (Model.Question.CourtDate != null) { %>
                        <br />Court Date: <%: Model.Question.CourtDate.Value.ToShortDateString() %>
                    <% } %>
                </div>
                  
                <div class="postbannerRight">
                    <% Html.RenderAction("QuestionActionButtons", "Nav", new {Question = Model.Question}); %>
                </div>
            </th>
        </tr>
        <tr>
            <td class="display-user">
                <%Html.RenderPartial("QuestionCreatedBy", Model.CreatedBy); %>
                <% if(Roles.IsUserInRole(UserRoles.Administrators)) {%>
                <p><strong>Taken By:</strong> <%: Model.Question.TakenBy %></p>
                <%} %>
            </td>
            <td valign="top">
                <div class="display-subject">Subject: <%: Model.Question.Subject %></div>
                <br />
                <div>Client County of Residence:  <%: Model.Question.County.CountyName %></div>
                <br />
                <div>Client County of Venue:  <%: Model.Question.CaseCounty == null ? "No County Selected" : Model.Question.CaseCounty.CountyName %></div>
                <br />
                <div>Adverse Party:  <%: Model.Question.OpposingParty %></div>
                <br />
                <%: Html.Parse(Model.Question.Body) %>
            </td>
        </tr>
<% foreach(var item in Model.Posts) { %>

        <tr>
            <th colspan="2" class="postbanner">
                <div class="postbannerLeft">Posted: <%: item.Created %></div>
                <div class="postbannerRight">
                    <% Html.RenderAction("PostActionsButtons", "Nav", new {item.PostId, QuestionId = Model.Question.Id}); %>
                </div>
            </th>
        </tr>
        <tr>
            <td>
                <p><strong>Reply By: </strong><%: Html.DisplayUser(item.UserName) %></p>
            </td>
            <td valign="top">
                <div class="display-subject">Subject: <%: item.Subject%></div><br />
                <%: Html.Parse(item.Body) %>
            </td>
        </tr>

<% } %>

        </table>
    </fieldset>

<script type="text/javascript">
    $(function () {
        $('#UnTakeButton').click(function () {
            var answer = confirm('Are you sure you want to move this question back to the queue?');
            if (answer) return true;
            else return false;
        });
    });
</script>