<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Web.Models.EditViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        <fieldset>
            <legend>Edit</legend>
            <div class="editor-label">Assigned To</div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.AssignedTo, Model.AssignmentList, "Select Attorney") %>
            </div>

            <div class="editor-label">Category</div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.CategoryId, Model.CategoryList) %>
            </div>
            <%: Html.HiddenFor(model => model.QuestionId) %>

            <p>
                <input type="submit" value="Save" class="ImageLink" />
            </p>
        </fieldset>

    <% } %>

    <%
       Html.RenderPartial("DetailsForm", Model.Details);%>

</asp:Content>