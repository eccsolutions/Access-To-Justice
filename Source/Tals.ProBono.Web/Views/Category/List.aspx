<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Tals.ProBono.Domain.Entities.Category>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	List of Categories
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

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
            <td class="gridcolumn">
                <%:Html.ActionLink("Edit", "Edit", new {id = item.Id}) %>
            </td>
            <td class="gridcolumn"><%:item.CategoryName %></td>
            <td class="gridcolumn"><%:item.ShortDescription %></td>
            <td class="gridcolumn"><%:item.LongDescription %></td>
            <td class="gridcolumn"><%:item.SortOrder %></td>
        </tr>

    <%} %>

    </table>
    <%:Html.ActionLink("Add New Category", "Edit") %>
</asp:Content>