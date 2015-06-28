<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Guest.Master" Inherits="System.Web.Mvc.ViewPage<SignUpClientModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Sign Up
</asp:Content>
<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Sign Up Username and Password</h2>
    <p>
        Make a username and password to use this website.
    </p>
    <p>
        Your password has to be at least 
        <%: ViewData["PasswordLength"] %>
        letters or numbers long.
    </p>
    <p><strong>Note:</strong> All fields are required except where otherwise specified</p>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true, "Account creation was unsuccessful. Please correct the errors and try again.") %>
    <div>
        <fieldset>
            <legend>Account Information</legend>
            <label class="editor-label">
                First Name</label>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.FirstName) %>
                <%: Html.ValidationMessageFor(m => m.FirstName) %>
            </div>
            <label class="editor-label">
                Middle Initial</label>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.MiddleInitial) %>
                <%: Html.ValidationMessageFor(m => m.MiddleInitial) %>
            </div>
            <label class="editor-label">
                Last Name</label>
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
                (Optional)<br />
                No email address? Then you must check the website to see if you got an answer to your question.<br />
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
                Write down your username and password.  Keep them in a safe place so no one else can use them.  Don't give them to anyone else.  You will need your username and password to log back in and read the lawyer's answer to your question.
            </p>            
            <div class="editor-label">
                <%: Html.LabelFor(m => m.SecurityQuestion) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.SecurityQuestion, Model.SecurityQuestions, "Select a question") %>
                <%: Html.ValidationMessageFor(model => model.SecurityQuestion) %>
            </div>

             <div class="editor-label">
                <%: Html.LabelFor(m => m.SecurityQuestionAnswer) %>
            </div>
            <div class="editor-field">
                <%: Html.PasswordFor(model => model.SecurityQuestionAnswer) %>
                <%: Html.ValidationMessageFor(model => model.SecurityQuestionAnswer) %>
            </div>


            <%: Html.Hidden("returnUrl", Request.QueryString["ReturnUrl"]) %>
            <p>
                <input type="submit" value="Sign Up" class="ImageLink" />
            </p>
        </fieldset>
    </div>
    <% } %>
</asp:Content>
