<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Tals.ProBono.Domain.Entities.Question>>" %>
<table class="gridview">
    <tr>
        <th>
            Subject
        </th>
        <th>
            Last Updated
        </th>
        <th>
            Request Date
        </th>
        <th>
            Replies
        </th>
    </tr>
    <% foreach (var item in Model)
       { %>
    <tr>
        <td class="gridcolumn" id="subjectcolumn">
            <%: Html.ActionLink(item.Subject, "Details", "Attorney", new { id=item.Id }, null) %>
            <% if (item.IsUnread(HttpContext.Current.User.Identity.Name))
               { %>
            <sup><span class="unread">&nbsp;New!</span></sup>
            <% } %>
        </td>
        <td class="gridcolumn">
            <%: item.LastUpdated %>
        </td>
        <td class="gridcolumn">
            <%: String.Format("{0:g}", item.CreatedDate )%>
        </td>
        <td class="gridcolumn">
            <%: item.Posts.Count() %>
        </td>
    </tr>
    <% } %>
</table>
