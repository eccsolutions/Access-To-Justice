<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<int>" %>
    <div class="editor-field">
        <%: Html.DropDownListFor(m => m, ViewData["Categories"] as SelectList) %>
        <%: Html.ValidationMessageFor(m => m) %>
    </div>