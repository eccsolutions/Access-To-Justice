<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Guest.Master" Inherits="System.Web.Mvc.ViewPage<SignUpClientModel>" %>
<%@ Import Namespace="Tals.ProBono.Resources" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%=SignUp.Title %>
</asp:Content>
<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%=SignUp.SignUpUserNameAndPassword %></h2>

    <p><%=SignUp.Instructions %></p>

    <p><%=SignUp.PasswordRestriction.Replace("{{PasswordLength}}",ViewData["PasswordLength"].ToString()) %></p>

    <p><strong><%=Common.Note %>:</strong> <%=SignUp.RequiredInstruction %></p>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true, Messages.AccountCreationFailed) %>
    <div>
        <fieldset>
            <legend><%=SignUp.AccountInformation %></legend>
            <label class="editor-label">
                <%=Common.FirstNameLabel %></label>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.FirstName) %>
                <%: Html.ValidationMessageFor(m => m.FirstName) %>
            </div>
            <label class="editor-label">
               <%=Common.MiddleInitialLabel %></label>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.MiddleInitial) %>
                <%: Html.ValidationMessageFor(m => m.MiddleInitial) %>
            </div>
            <label class="editor-label">
                <%=Common.LastNameLabel %></label>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.LastName) %>
                <%: Html.ValidationMessageFor(m => m.LastName) %>
            </div>
            <div class="editor-label">
                <%: Html.LabelFor(m => m.UserName) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.UserName) %>
                <%: Html.ValidationMessageFor(m => m.UserName) %>
            </div>
            <div class="editor-label">
                <%: Html.LabelFor(m => m.Email) %>
                (<%=Common.Optional %>)<br />
                <%=SignUp.EmailAddressMessage %><br />
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.Email) %>
                <%: Html.ValidationMessageFor(m => m.Email) %>
            </div>
            <div class="editor-label">
                <%: Html.LabelFor(m => m.Password) %>
            </div>
            <div class="editor-field">
                <%: Html.PasswordFor(m => m.Password) %>
                <%: Html.ValidationMessageFor(m => m.Password) %>
            </div>
            <div class="editor-label">
                <%: Html.LabelFor(m => m.ConfirmPassword) %>
            </div>
            <div class="editor-field">
                <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
            </div>
            <p class="bold">
                <%=SignUp.PasswordMessage %>
            </p>            
            <div class="editor-label">
                <%: Html.LabelFor(m => m.SecurityQuestion) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.SecurityQuestion, Model.SecurityQuestions, SignUp.SelectAQuestion) %>
                <%: Html.ValidationMessageFor(model => model.SecurityQuestion) %>
            </div>

             <div class="editor-label">
                <%: Html.LabelFor(m => m.SecurityQuestionAnswer) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.SecurityQuestionAnswer) %>
                <%: Html.ValidationMessageFor(model => model.SecurityQuestionAnswer) %>
            </div>


            <%: Html.Hidden("returnUrl", Request.QueryString["ReturnUrl"]) %>
            <p>
                <input type="submit" value="<%=SignUp.SignUpButtonLabel %>" class="ImageLink" />
            </p>
        </fieldset>
    </div>
    <% } %>
</asp:Content>
