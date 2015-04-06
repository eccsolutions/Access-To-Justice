<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Guest.Master" Inherits="System.Web.Mvc.ViewPage<QuestionAndAnswerModel>" %>

<%@ Import Namespace="Tals.ProBono.Domain.Services" %>
<%@ Import Namespace="ViewRes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=ConfigSettings.AppName %> - Set security question
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Select a security question and provide an answer</h2>
    <% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true, "Please correct the errors and try again.") %>
    <fieldset>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Password) %>
        </div>
        <div class="editor-field">
            <%: Html.PasswordFor(model => model.Password) %>
            <%: Html.ValidationMessageFor(model => model.Password) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Question) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownListFor(model => model.Question, Model.Questions, "Select a question") %>
            <%: Html.ValidationMessageFor(model => model.Question) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Answer) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Answer) %>
            <%: Html.ValidationMessageFor(model => model.Answer) %>
        </div>
        <p>
            <input type="submit" value="Save" class="ImageLink" />
        </p>
    </fieldset>
    <%} %>
</asp:Content>
