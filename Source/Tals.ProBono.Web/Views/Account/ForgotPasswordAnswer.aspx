<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Guest.master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Web.Controllers.ForgotPasswordModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ForgotPasswordAnswer
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Forgot Password</h2>
    
    <% using(Html.BeginForm("ForgotPasswordAnswer", "Account")) { %>
        <%:Html.HiddenFor(model => model.UserName) %>
        <fieldset>
            <legend>Forgot Password</legend>
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Question) %>
            </div>
            <div class="editor-field">
                <%: Html.DisplayFor(model => model.Question) %>
            </div>
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Answer) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Answer) %>
            </div>
            <p>
                <input type="submit" value="Next" class="ImageLink"/>
            </p>
        </fieldset>
    <% } %>
</asp:Content>