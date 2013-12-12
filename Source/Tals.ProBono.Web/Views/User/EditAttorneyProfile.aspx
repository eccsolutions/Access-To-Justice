<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Attorney.master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Web.Models.AttorneyProfileViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit - Attorney Profile (<%:ViewData["UserName"]%>)
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%: Html.PreviousPageLink("Back to previous screen") %>

<div id="profile">
    <% using (Html.BeginForm()) {%>
    <%: Html.HiddenFor(model => model.UserName)%>
    <fieldset>
        <legend>Profile</legend>
        <label>
            Registration Date:</label>
        <div class="profile-field, clear">
            <%: String.Format("{0:g}", Model.RegistrationDate)%></div>
        <label>
            BPR Number:</label>
        <div class="profile-field, clear"><%: Model.DisciplinaryBoardNumber%></div>

            <fieldset class="clear">
                <legend>Firm/Organization</legend>
                <label class="editor-label">
                    Firm/Organization Name</label>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.LawFirm)%>
                    <%: Html.ValidationMessageFor(m => m.LawFirm)%>
                </div>
                <label class="editor-label">
                    Phone Number</label>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Phone)%>
                    <%: Html.ValidationMessageFor(m => m.Phone)%>
                </div>
                <label class="editor-label">
                    Address Line 1</label>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.AddressLine1)%>
                    <%: Html.ValidationMessageFor(m => m.AddressLine1)%>
                </div>
                <label class="editor-label">
                    Address Line 2 (Optional)</label>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.AddressLine2)%>
                    <%: Html.ValidationMessageFor(m => m.AddressLine2)%>
                </div>
                <label class="editor-label">
                    City</label>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.City)%>
                    <%: Html.ValidationMessageFor(m => m.City)%>
                </div>
                <label class="editor-label">
                    State</label>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.State)%>
                    <%: Html.ValidationMessageFor(m => m.State)%>
                </div>
                <label class="editor-label">
                    Zip</label>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Zip)%>
                    <%: Html.ValidationMessageFor(m => m.Zip)%>
                </div>
                <label class="editor-label">County</label>
                <div class="editor-field">
                    <%: Html.DropDownListFor(m => m.County, Model.CountySelectList, "Select a county") %>
                </div>
            </fieldset>
            <p>
                <input type="submit" value="Save" class="ImageLink" />
            </p>
    </fieldset>
    <% } %>
</div>
</asp:Content>
