<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Domain.Entities.FedPovertySetting>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit Federal Poverty Settings
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit Federal Poverty Settings</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        <%:Html.HiddenFor(model => model.Id) %>
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.YearlyRate) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.YearlyRate, "{0:###########0.######}") %>
                <%: Html.ValidationMessageFor(model => model.YearlyRate) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Factor) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Factor, "{0:###########0.######}") %>
                <%: Html.ValidationMessageFor(model => model.Factor) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.ModestMeansLevel) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.ModestMeansLevel, "{0:###########0.0#####}") %>
                <%: Html.ValidationMessageFor(model => model.ModestMeansLevel) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.LegalAidLevel) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.LegalAidLevel, "{0:###########0.0#####}") %>
                <%: Html.ValidationMessageFor(model => model.LegalAidLevel) %>
            </div>
            
            <p><input type="submit" value="Save" /></p>
        </fieldset>

    <% } %>
</asp:Content>