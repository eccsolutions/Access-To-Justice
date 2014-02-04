<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ReplyViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Follow-Up
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Follow-up Question - please ask your question below and click "Send":</h2>
        <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary("Please correct the errors shown below:") %>

        <fieldset>
            <legend>Follow-Up</legend>
            
            <div class="editor-label">
                What is your follow-up question about?
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Reply.Subject) %>
                <%: Html.ValidationMessageFor(model => model.Reply.Subject)%>
            </div>
            
            <div class="editor-label">
                Type it here:
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.Reply.Body, 20, 80, new { @class = "bbcode" })%>
                <%: Html.ValidationMessageFor(model => model.Reply.Body) %>
            </div>

            <%: Html.HiddenFor(model => model.OriginalQuestion.Id) %>
            <p>
                <%: Html.ActionLink("Cancel", "Questions", "Client", null, new {@class = "ImageLink"}) %>
                <input type="submit" value="Send" class="ImageLink" />
            </p>
        </fieldset>

    <% } %>


    <fieldset>
        <table class="gridview">
            <tr>
                <th colspan="2">Started: <%: Model.OriginalQuestion.CreatedDate %></th>
            </tr>
            <tr>
                <td class="display-user">
                    Created By: <%: Model.OriginalQuestion.CreatedBy %>
                </td>
                <td>
                    <div class="display-subject">Subject: <%: Model.OriginalQuestion.Subject %></div>
                    <br />
                    <%: Html.Parse(Model.OriginalQuestion.Body) %>
                </td>
            </tr>
        </table>
    </fieldset>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>


</asp:Content>
