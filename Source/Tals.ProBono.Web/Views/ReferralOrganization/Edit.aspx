<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Domain.Entities.ReferralOrganization>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%:ViewBag.PageTitle%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%: Html.ActionLink("Manage Settings", "Index", "Settings") %> &gt; <%:Html.ActionLink("Referral Organizations","List", "ReferralOrganization") %> &gt; <%:ViewBag.PageTitle%>
    <h2><%:ViewBag.PageTitle%></h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        <%:Html.HiddenFor(model => model.Id) %>
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.OrgName) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.OrgName) %>
                <%: Html.ValidationMessageFor(model => model.OrgName) %>
            </div>
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "List") %>
    </div>

</asp:Content>