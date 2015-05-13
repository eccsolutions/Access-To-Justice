<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Tals.ProBono.Domain.Entities.County>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	List of Counties
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>List of Counties</h2>
    <table class="gridview">
        <tr>
            <th>Actions</th>
            <th>
                Name
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%:Html.ActionLink("Edit", "Edit", new {id = item.Id}) %>
            </td>
            <td><%:item.CountyName %></td>
        </tr>

    <%} %>

    </table>
    <%:Html.ActionLink("Add New County", "Edit") %>
</asp:Content>