<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Guest.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Web.Models.AttorneySignUpModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Attorney Sign Up
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Create a New Account</h2>

    <p style="margin-bottom: 30px;"><%: Html.ActionLink("Frequently Asked Questions", "AttorneyFAQ", "Account", null, new {@class="ImageLink"}) %></p>

    <p>
        Use the form below to create a new account.
    </p>
    <p>
        Passwords are required to be a minimum of
        <%: ViewData["PasswordLength"] %>
        characters in length.
    </p>
    
    <% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true, "Account creation was unsuccessful. Please correct the errors and try again.") %>
    <div>
        <fieldset>
            <legend>Account Information</legend>
            <label class="editor-label">
                User name</label>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.UserName) %>
                <%: Html.ValidationMessageFor(m => m.UserName) %>
            </div>
            <label class="editor-label">Email address</label><br/>
            Note: Please add inf@alabamalawfoundation.org to your safe senders list. <a href="http://safesenderslist.com/" target="_blank">Find instructions</a>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.Email) %>
                <%: Html.ValidationMessageFor(m => m.Email) %>
            </div>
            <label class="editor-label">
                Password</label>
            <div class="editor-field">
                <%: Html.PasswordFor(m => m.Password) %>
                <%: Html.ValidationMessageFor(m => m.Password) %>
            </div>
            <label class="editor-label">
                Confirm Password</label>
            <div class="editor-field">
                <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
            </div>
        </fieldset>
        <fieldset>
            <legend>Profile Information</legend>
            <label class="editor-label">
                First Name</label>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.FirstName) %>
                <%: Html.ValidationMessageFor(m => m.FirstName) %>
            </div>
            <label class="editor-label">
                Middle Initial (Optional)</label>
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
            <label class="editor-label">
                BPR Number</label>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.DisciplinaryBoardNumber) %>
                <%: Html.ValidationMessageFor(m => m.DisciplinaryBoardNumber) %>
            </div>
            <label class="editor-label">
                County</label>
            <div class="editor-field">
                <%: Html.DropDownListFor(m => m.County, Model.Counties, "Select a county") %>
                <%: Html.ValidationMessageFor(m => m.County) %>
            </div>
            <fieldset class="clear">
                <legend>Firm/Organization</legend>
                <label class="editor-label">
                    Firm/Organization Name</label>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Organization) %>
                    <%: Html.ValidationMessageFor(m => m.Organization) %>
                </div>
                <label class="editor-label">
                    Phone Number</label>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Phone) %>
                    <%: Html.ValidationMessageFor(m => m.Phone) %>
                </div>
                <label class="editor-label">
                    Address Line 1</label>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.AddressLine1) %>
                    <%: Html.ValidationMessageFor(m => m.AddressLine1) %>
                </div>
                <label class="editor-label">
                    Address Line 2 (Optional)</label>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.AddressLine2) %>
                    <%: Html.ValidationMessageFor(m => m.AddressLine2) %>
                </div>
                <label class="editor-label">
                    City</label>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.City) %>
                    <%: Html.ValidationMessageFor(m => m.City) %>
                </div>
                <label class="editor-label">
                    State</label>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.State) %>
                    <%: Html.ValidationMessageFor(m => m.State) %>
                </div>
                <label class="editor-label">
                    Zip</label>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Zip) %>
                    <%: Html.ValidationMessageFor(m => m.Zip) %>
                </div>
            </fieldset>
            <p>
                <input type="submit" value="Sign Up" class="ImageLink" />
            </p>
        </fieldset>
    </div>
    <% } %>
</asp:Content>
