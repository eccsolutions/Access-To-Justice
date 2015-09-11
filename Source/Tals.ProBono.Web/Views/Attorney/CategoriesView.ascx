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
            <th style="width:50%">
                Category
            </th>
            <th style="width:20%">
                Recent
            </th>
            <th style="width:20%">
                Urgency
            </th>
            <th style="width:10%">Subscription</th>
        </tr>
<%
    for(var i = 0; i < Model.Categories.Count(); i++)
    {
        var item = Model.Categories.ElementAt(i);
        var bgColor = i % 2 == 0 ? "#FFFFFF" : "#EEEEEE";
%>

        <tr style="background-color: <%=bgColor%>">
            <td valign="top">
                <%: Html.ActionLink(item.Category.ShortDescription, "List", new { category = item.Category.CategoryName.Trim() })%><br />
                <%:item.Category.LongDescription %>
            </td>
            <td valign="top">
                <% if (item.LastQuestion != null)
                   {
                       var linkText = item.LastQuestion.Subject;
                       if (String.IsNullOrWhiteSpace(linkText))
                       {
                           if (!String.IsNullOrWhiteSpace(item.LastQuestion.Body))
                           {
                               if (item.LastQuestion.Body.Length > 50)
                               {
                                   linkText = item.LastQuestion.Body.Substring(0, 50) + "...";
                               }
                               else
                               {
                                   linkText = item.LastQuestion.Body;
                               }
                           }
                           else
                           {
                               linkText = "Question #" + item.LastQuestion.Id;
                           }
                       }
                %>
                    <%: Html.ActionLink(linkText, "Details", new { id = item.LastQuestion.Id })%><br />
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