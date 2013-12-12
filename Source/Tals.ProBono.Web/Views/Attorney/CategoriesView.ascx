<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Tals.ProBono.Domain.Entities.Category>>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Filters" %>
    <fieldset>
    <table class="categorygridview">
        <tr>
            <th colspan="4" class="categorybanner">
                <h2>Categories</h2>
            </th>
        </tr>
        <tr>
            <th>
                Category
            </th>
            <th>
                Recent
            </th>
            <th>
                Urgency
            </th>
            <th>Subscription</th>
        </tr>
<% foreach(var item in Model) { %>

        <tr>
            <td>
                <%: Html.ActionLink(item.ShortDescription, "List", new { category = item.CategoryName })%><br /><br />
                <%:item.LongDescription %>
            </td>
            <td valign="top">
                <% if (item.LastQuestion != null) { %>
                    <%: Html.ActionLink(item.LastQuestion.Subject, "Details", new { id = item.LastQuestion.Id })%><br />
                    by <%: item.LastQuestion.CreatedBy%><br />
                    <%: Html.DisplayTimeElapsed(item.LastQuestion.CreatedDate)%>
                <% } else { %>
                    No questions asked for this category
                <%} %>
            </td>
            <td>
                <div style="margin: 5px;"><span class="Current"><%: item.Questions.AsQueryable().Current().Count() %></span> questions under 10 days</div>
                <div style="margin: 5px;"><span class="Overdue"><%: item.Questions.AsQueryable().Overdue().Count() %></span> questions over 10 days</div>
                <div style="margin: 5px;"><span class="Urgent"><%: item.Questions.AsQueryable().Urgent().Count() %></span> questions over 25 days</div>
            </td>
            <td>
                <% if(item.IsSubscribed(Context.User.Identity.Name)) { %>
                    <%: Html.ActionLink("Unsubscribe", "Unsubscribe", new { id = item.Id}) %>
                <% } else { %>
                    <%: Html.ActionLink("Subscribe", "Subscribe", new { id = item.Id}) %>
                <% } %>
            </td>
        </tr>

<% } %>

        </table>
    </fieldset>