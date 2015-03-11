<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Domain.Entities.Category>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        <%:Html.HiddenFor(model => model.Id) %>
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.CategoryName) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.CategoryName) %>
                <%: Html.ValidationMessageFor(model => model.CategoryName) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.ShortDescription) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.ShortDescription) %>
                <%: Html.ValidationMessageFor(model => model.ShortDescription) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.LongDescription) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.LongDescription) %>
                <%: Html.ValidationMessageFor(model => model.LongDescription) %>
            </div>
            <div class="editor-label">
                <%: Html.LabelFor(model => model.SortOrder) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.SortOrder) %>
                <%: Html.ValidationMessageFor(model => model.SortOrder)%>
            </div>
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Hidden) %>
            </div>
            <div class="editor-field">
                <%: Html.CheckBoxFor(model => model.Hidden) %>
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