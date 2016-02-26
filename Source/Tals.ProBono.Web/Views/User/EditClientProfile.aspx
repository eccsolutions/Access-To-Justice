<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Attorney.master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Web.Models.EditClientProfileViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit - Client Profile (<%: Model.UserName%>)
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%: Html.PreviousPageLink("Back to previous screen") %>

    <div id="profile">
        <% using (Html.BeginForm())
           {%>
        <%: Html.HiddenFor(model => model.UserName)%>
        <fieldset>
            <legend>Profile</legend>
            <label class="editor-label">First Name</label>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.FirstName)%>
                <%: Html.ValidationMessageFor(m => m.FirstName)%>
            </div>
            <label class="editor-label">Last Name</label>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.LastName)%>
                <%: Html.ValidationMessageFor(m => m.LastName)%>
            </div>
            <label class="editor-label">
                Middle Initial</label>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.MiddleInitial)%>
                <%: Html.ValidationMessageFor(m => m.MiddleInitial)%>
            </div>
            <label class="editor-label">County</label>
            <div class="editor-field">
                <%: Html.DropDownListFor(m => m.County, Model.CountySelectList, "Select a county") %>
            </div>
            <p>
                <input type="submit" value="Save" class="ImageLink" />
            </p>
        </fieldset>
        <% } %>
    </div>
</asp:Content>
