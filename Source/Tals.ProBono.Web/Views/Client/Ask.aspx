<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Client.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Domain.Entities.Question>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Ask Question
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Please ask your question below and click "Send":</h2>
    
    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary("Please correct the errors shown below:") %>
        <fieldset>
            <legend>New Question</legend>
                        <div class="editor-label">
                <%: Html.LabelFor(model => model.CategoryId) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.CategoryId, new SelectList((IEnumerable)ViewData["categories"], "Id", "ShortDescription", Model.CategoryId), new {@class = "combobox"}) %>
                <%: Html.ValidationMessageFor(model => model.CategoryId) %>
            </div>
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Subject) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Subject) %>
                <%: Html.ValidationMessageFor(model => model.Subject) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.CourtDate) %><br />
                <span><strong>BE ADVISED:</strong> if you have a court date, you cannot rely on getting help before your court date.</span>
            </div>

            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.CourtDate, new {@class = "datepicker"}) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Body) %>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.Body, 20, 80, new {@class = "bbcode"}) %>
                <%: Html.ValidationMessageFor(model => model.Body) %>
            </div>
            
            <p>
                <%: Html.ActionLink("Cancel", "Questions", "Client", null, new {@class = "ImageLink"}) %>
                <input type="submit" value="Send" class="ImageLink" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

