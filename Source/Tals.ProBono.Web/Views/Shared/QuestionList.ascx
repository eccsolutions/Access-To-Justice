<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Tals.ProBono.Domain.Entities.Question>>" %>
<%@ Import Namespace="Tals.ProBono.Resources" %>
<table class="gridview">
    <tr>
        <th>
            <%=Questions.SubjectHeader %>
        </th>
        <th>
           <%=Questions.LastUpdatedHeader %>
        </th>
        <th>
            <%=Questions.RequestDateHeader %>
        </th>
        <th>
            <%=Questions.RepliesHeader %>
        </th>
    </tr>
    <% foreach (var item in Model)
       { %>
    <tr>
        <td class="gridcolumn" id="subjectcolumn">
            <%: Html.ActionLink(item.Subject ?? Questions.NoSubjectEnteredMessage, "Details", new {id=item.Id}) %>
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
