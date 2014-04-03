<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CategoryListViewModel>" %>
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
<% foreach(var item in Model.Categories) { %>

        <tr>
            <td>
                <%: Html.ActionLink(item.Category.ShortDescription, "List", new { category = item.Category.CategoryName })%><br /><br />
                <%:item.Category.LongDescription %>
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
                <div style="margin: 5px;"><span class="Current"><%: item.CurrentCount %></span> questions posted within last 5 days</div>
                <div style="margin: 5px;"><span class="Overdue"><%: item.OverdueCount %></span> questions posted within last 6 to 10 days</div>
                <div style="margin: 5px;"><span class="Urgent"><%: item.UrgentCount %></span> questions posted over 10 days ago</div>
            </td>
            <td>
                <% if(item.Category.IsSubscribed(Context.User.Identity.Name)) { %>
                    <%: Html.ActionLink("Unsubscribe", "Unsubscribe", new { id = item.Category.Id}) %>
                <% } else { %>
                    <%: Html.ActionLink("Subscribe", "Subscribe", new { id = item.Category.Id}) %>
                <% } %>
            </td>
        </tr>

<% } %>

        </table>
    </fieldset>