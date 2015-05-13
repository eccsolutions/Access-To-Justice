<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<MvcPaging.IPagedList<Tals.ProBono.Domain.Entities.Question>>" %>
    <fieldset>
    <table class="categorygridview">
        <tr>
            <th></th>
            <th>Category</th>
            <th>Subject</th>
            <th>Last Updated</th>
            <th>Request Date</th>
            <th>Court Date</th>
            <th>Replies</th>
        </tr>
    <% if(!Model.Any()) { %>
        <tr>
            <td></td>
            <td colspan="6">No records found</td>
        </tr>
    <% } %>
    <% foreach (var item in Model)
       { %>
            <% using(Html.BeginRowForCoding(item)) { %>
                <td class="actions">
                    <% Html.RenderAction("ListActionButtons", "Nav", new {Question = item}); %>
                </td>
                <td class="gridcolumn" id="categorycolumn">
                    <%: item.Category.ShortDescription%>
                </td>
                <td class="gridcolumn" id="subjectcolumn">
                    <div class="popupEnabled">
                        <%: Html.ActionLink(item.Subject ?? "No Subject Entered", "Details", "Attorney", new { id = item.Id, r = Page.Request.Url.PathAndQuery }, null)%>
                        <% if (item.IsUnread(HttpContext.Current.User.Identity.Name)) { %>
                        <sup><span class="unread">&nbsp;New!</span></sup>
                        <% } %>
                        <div class="popup"><%: Html.Parse(item.Body) %></div>
                    </div>
                </td>
                <td class="gridcolumn">
                    <%: item.LastUpdated%>
                </td>
                <td class="gridcolumn">
                    <%: item.CreatedDate%>
                </td>
                <td class="gridcolumn">
                    <%: item.CourtDate%>
                </td>
                <td class="gridcolumn">
                    <%: item.Posts.Count()%>
                </td>
            <%} %>
    <% } %>
        </table>

        <div class="pager">
            <%: Html.Pager(Model.PageSize, Model.PageNumber, Model.TotalItemCount)
                .Options(o => o.RouteValues(new { category = ViewBag.Category, status = ViewBag.Status, taken = ViewBag.Taken, username = ViewBag.UserName}))
                %>
            Displaying <%: Model.ItemStart %> - <%: Model.ItemEnd %> of <%: Model.TotalItemCount %> item(s)
        </div>
    </fieldset>

    <script language="javascript" type="text/javascript">
        $(function () {
            $('input').click(function () {
                var answer = confirm('Are you sure you want to open this question?');
                return answer;
            });
        });

        $(function () {
            $(".popupEnabled").hover(
                function () {
                    var popup = $(this).parent("td").find(".popup");
                    popup.css({ left: "50px" });
                    popup.fadeIn(300);
                },
                function () {
                    $(this).parent("td").find(".popup").fadeOut(100);
                }
            );
        });
    </script>