<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Attorney.master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Web.Models.AccountInfoViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit Account Info -
    <%: Model.UserName %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Edit Account Info -
        <%: Model.UserName %></h2>
    <div id="profile">
        <% using (Html.BeginForm())
           {%>
        <fieldset>
            <legend>Account</legend>
            <label>
                Last Login Date:</label>
            <div class="profile-field, clear">
                <%: String.Format("{0:g}", Model.LastLoginDate) %></div>
            <label>
                Email Address:</label>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.Email) %>
            </div>
            <%: Html.HiddenFor(m => m.UserName) %>
            <p>
                <input type="submit" value="Save" class="ImageLink" />
            </p>
        </fieldset>
        <% } %>
    </div>
</asp:Content>
