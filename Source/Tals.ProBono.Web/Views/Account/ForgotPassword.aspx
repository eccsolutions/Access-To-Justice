<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Guest.master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Web.Models.View.Account.ForgotPasswordModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ForgotPassword
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Forgot Password</h2>
    
    <% using(Html.BeginForm()) { %>
        <fieldset>
            <legend>Forgot Password</legend>
            <div class="editor-label">
                <%: Html.LabelFor(model => model.UserName) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.UserName) %>
                <%: Html.ValidationMessageFor(model => model.UserName) %>
            </div>
            <p>
                <input type="submit" value="Next" class="ImageLink"/>
            </p>
        </fieldset>
    <% } %>
</asp:Content>