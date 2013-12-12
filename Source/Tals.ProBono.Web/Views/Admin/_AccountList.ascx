<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IPagedList<UserModel>>" %>
<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<% using (Html.BeginForm("RemoveUsers", "Admin"))
   {%>
<table class="gridview">
    <tr>
        <th>
            Actions
        </th>
        <th>
            User Name
        </th>
        <th>
            Name
        </th>
        <th>
            Registration<br />
            Date
        </th>
        <th>
            Last Login<br />
            Date
        </th>
        <th>
            Is Online?
        </th>
    </tr>
    <% foreach (var item in Model)
       { %>
    <tr>
        <td>
            <%: Html.CheckBox("userNames", new { value = item.UserName })%>
            <%: Html.DisplayProfileButton(item.UserName) %>
            <% if (Roles.IsUserInRole(item.UserName, UserRoles.PendingApproval))
               { %>
            <%: Html.ActionLink("Approve", "ConfirmApproval", new {item.UserName}) %>
            <%: Html.ActionLink("Deny", "ConfirmDenial", new {item.UserName}) %>
            <% } %>
        </td>
        <td>
            <%: item.UserName %>
        </td>
        <td>
            <%: item.UserProfile.FullName %>
        </td>
        <td>
            <%: item.Registration %>
        </td>
        <td>
            <%: item.LastLoginDate %>
        </td>
        <td>
            <%: item.IsOnline ? "Yes" : "No" %>
        </td>
    </tr>
    <% } %>
</table>
<%} %>
<div class="pager">
    <%: Html.Pager(Model.PageSize, Model.PageNumber, Model.TotalItemCount)
                .Options(o => o.RouteValues(new { role = ViewBag.Role, username = ViewBag.UserName}))
    %>
    Displaying
    <%: Model.ItemStart %>
    -
    <%: Model.ItemEnd %>
    of
    <%: Model.TotalItemCount %>
    item(s)
</div>
