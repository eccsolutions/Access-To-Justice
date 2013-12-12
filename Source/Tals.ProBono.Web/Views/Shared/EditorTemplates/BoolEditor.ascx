<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bool>" %>
<div class="editor-field">
    <%: Html.RadioButtonFor(model => model, true) %> Yes
    <%: Html.RadioButtonFor(model => model, false) %> No
    <%: Html.ValidationMessageFor(model => model, "*") %>
</div>