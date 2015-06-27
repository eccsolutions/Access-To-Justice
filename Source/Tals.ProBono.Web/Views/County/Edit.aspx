<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Domain.Entities.County>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%: Html.ActionLink("Manage Settings", "Index", "Settings") %> &gt; <%:Html.ActionLink("Counties","List", "County") %> &gt; Edit <%=Model.CountyName %>
    <h2>Edit</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        <%:Html.HiddenFor(model => model.Id) %>
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.CountyName) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.CountyName) %>
                <%: Html.ValidationMessageFor(model => model.CountyName) %>
            </div>
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "List") %>
    </div>

</asp:Content>