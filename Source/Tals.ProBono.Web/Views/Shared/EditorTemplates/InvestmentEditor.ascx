<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<double>>" %>
    <legend>Assets</legend>
    <div class="editor-label">
        Do you have a checking account? If yes, how much is in it right now?
    </div>
    <div class="editor-field">
        $<%: Html.TextBox("Answer[0]", Model[0]) %>
    </div>
    <div class="editor-label">
        Do you have a savings account? If yes, how much is in it right now?
    </div>
    <div class="editor-field">
        $<%: Html.TextBox("Answer[1]", Model[1]) %>
    </div>
    <div class="editor-label">
        Do you have any stocks or bonds? If yes, how much are they worth?
    </div>
    <div class="editor-field">
        $<%: Html.TextBox("Answer[2]", Model[2]) %>
    </div>