<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<int>" %>
    <div class="editor-field">
        <%: Html.TextBoxFor(model => model) %>
    </div>