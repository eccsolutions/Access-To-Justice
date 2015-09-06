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

            <div style="padding:5px">
                <input type="submit" value="Save" class="ImageLink"/>&nbsp;&nbsp;&nbsp;
                <%if(!String.IsNullOrWhiteSpace(Model.AssignedTo))
                  { %>
                    <input type="button" value="Return Question to Queue" class="ImageLink" onclick="OnlineJustice.Admin.EditQuestion.returnQuestionToQueue()"/>
                <% } %>
            </div>
        </fieldset>

    <% } %>

    <% using (Html.BeginForm("ReturnQuestionToQueue","Admin",FormMethod.Post,new {id="frm-returnQuestionToQueue"})){%>
           <%:Html.HiddenFor(model => model.QuestionId)%>
    <%}%>

    <%Html.RenderPartial("DetailsForm", Model.Details);%>

</asp:Content>

<asp:Content ID="Scripts" ContentPlaceHolderID="Scripts" runat="server">
    <script type="text/javascript" src="/Scripts/Views/Admin/Admin.EditQuestion.js"></script>
</asp:Content>