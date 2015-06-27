<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Tals.ProBono.Domain.Entities.ReferralOrganization>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    List of Referral Organizations
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%: Html.ActionLink("Manage Settings", "Index", "Settings") %> &gt; Referral Organizations
    <h2>List of Referral Organizations</h2>
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
            <td><%:item.OrgName %></td>
        </tr>

    <%} %>

    </table>
    <%:Html.ActionLink("Add New Organization", "Edit") %>
</asp:Content>