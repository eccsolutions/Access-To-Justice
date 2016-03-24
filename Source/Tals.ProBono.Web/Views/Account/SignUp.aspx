<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Guest.Master" Inherits="System.Web.Mvc.ViewPage<SignUpClientModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Sign Up
</asp:Content>
<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Sign Up - New User</h2>
    <p>
        Use the form below to create a new account.
    </p>
    <p>
        Passwords are required to be a minimum of
        <%: ViewData["PasswordLength"] %>
        characters in length.
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
                <%: Html.LabelFor(m => m.UserName) %> (Enter a valid email address)<br/>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.UserName) %>
                <%: Html.ValidationMessageFor(m => m.UserName) %>
                <div>
                    (NOTE: Please add techsupport@tals.org to your safe sender's list. Visit <a href="http://safesenderslist.com/">Safe Senders List</a> for instructions.)
                </div>
            </div>
            <!--<div class="editor-label">
                <%: Html.LabelFor(m => m.Email) %>
                (Optional)<br />
                No email address? Then you must check back to see if you got an answer.<br />
                Please add techsupport@tals.org to your safe sender's list.<br />
                Visit <a href="http://safesenderslist.com/">Safe Senders List</a> for instructions.
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.Email) %>
                <%: Html.ValidationMessageFor(m => m.Email) %>
            </div>-->
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
            <%: Html.Hidden("returnUrl", Request.QueryString["ReturnUrl"]) %>
            <p class="bold">
                * Write down your username and password.
                You will need them to ask questions and read the lawyer's answer.
                Keep it in a safe place so no one else can use it.
            </p>
            <p>
                <input type="submit" value="Sign Up" class="ImageLink" />
            </p>
        </fieldset>
    </div>
    <% } %>
</asp:Content>
