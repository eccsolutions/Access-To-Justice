<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Tals.ProBono.Domain.Entities.Category>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    List of Categories
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%: Html.ActionLink("Manage Settings", "Index", "Settings") %> &gt; Categories
    <h2>List of Categories</h2>
    <table class="gridview">
        <tr>
            <th>Actions</th>
            <th>
                Name
            </th>
            <th>
                Short Description
            </th>
            <th>
                Long Description
            </th>
            <th>
                Sort Order
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%:Html.ActionLink("Edit", "Edit", new {id = item.Id}) %>
            </td>
            <td><%:item.CategoryName %></td>
            <td><%:item.ShortDescription ?? "Nothing Entered." %></td>
            <td><%:item.LongDescription ?? "Nothing entered." %></td>
            <td><%:item.SortOrder %></td>
        </tr>

    <%} %>

    </table>
    <%:Html.ActionLink("Add New Category", "Edit") %>
</asp:Content>