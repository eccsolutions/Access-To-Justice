<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Tals.ProBono.Web.Models.NavLink>>" %>
<ul class="menu">
<% foreach(var link in Model) { %>
    <li class="menuItem">
        <div class="menuItemDiv">
            <%: Html.RouteLink(link.Text, link.RouteValues, new Dictionary<string, object>
                                                                               {
                                                                                   {"class", link.IsSelected ? "selected" : null}
                                                                               }) %>
        </div>
        <% if(link.Count != null) {%>
            <div class="menuCountDiv">(<%: link.Count %>)</div>
        <%} %>
    </li>
<% } %>
</ul>