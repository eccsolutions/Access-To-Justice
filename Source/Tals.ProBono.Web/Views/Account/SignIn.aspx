<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Web.Models.SignInModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Sign In or Sign Up
</asp:Content>
<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Sign In</h2>
    <p>
        Please type your username and password below. If you do not have one, please <%: Html.ActionLink("sign up", "SignUp") %>.
    </p>

    <% using (Html.BeginForm("SignIn", "Account", FormMethod.Post, new { id="LoginForm"})) { %>
        <%: Html.ValidationSummary(true, "Login was unsuccessful. Please correct the errors and try again.") %>
        <div>
            <fieldset>
                <legend>Sign In</legend>
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.UserName) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.UserName) %>
                    <%: Html.ValidationMessageFor(m => m.UserName) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Password) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.Password) %>
                    <%: Html.ValidationMessageFor(m => m.Password) %>
                </div>
              <%: Html.Hidden("returnUrl", Request.QueryString["ReturnUrl"])%>
                <p>
                    <input type="submit" value="Sign In" class="ImageLink" />
                </p>
                <%: Html.ActionLink("Forgot password?", "ForgotPassword") %>
            </fieldset>
        </div>
    <% } %>
</asp:Content>
