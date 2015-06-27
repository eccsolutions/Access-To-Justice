<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Domain.Entities.FedPovertySetting>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit Federal Poverty Settings
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%: Html.ActionLink("Manage Settings", "Index", "Settings") %> &gt; Federal Poverty Settings
    <h2>Edit Federal Poverty Settings</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        <%:Html.HiddenFor(model => model.Id) %>
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.YearlyIncome) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.YearlyIncome, "{0:###########0.######}") %>
                <%: Html.ValidationMessageFor(model => model.YearlyIncome) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DependentsModifier) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.DependentsModifier, "{0:###########0.######}") %>
                <%: Html.ValidationMessageFor(model => model.DependentsModifier) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.LegalAidLevel) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.LegalAidLevel, "{0:###########0.0#####}") %>
                <%: Html.ValidationMessageFor(model => model.LegalAidLevel) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.ModestMeansLevel) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.ModestMeansLevel, "{0:###########0.0#####}") %>
                <%: Html.ValidationMessageFor(model => model.ModestMeansLevel) %>
            </div>

            <div class="button-container">
                <input type="submit" value="Save Settings"/>
                <% Html.ActionLink("Cancel", "Index", "Settings"); %>
            </div>            
        </fieldset>

    <% } %>
</asp:Content>