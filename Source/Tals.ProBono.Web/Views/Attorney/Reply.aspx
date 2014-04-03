<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Attorney.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Web.Models.ReplyViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Reply
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Reply</h2>
        <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary("Please correct the errors shown below:") %>
        <fieldset>
            <legend>Reply</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Reply.Subject) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Reply.Subject) %>
                <%: Html.ValidationMessageFor(model => model.Reply.Subject)%>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Reply.Body) %>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.Reply.Body, 20, 80, new {@class = "bbcode"}) %>
                <%: Html.ValidationMessageFor(model => model.Reply.Body) %>
            </div>
            <%: Html.HiddenFor(model => model.OriginalQuestion.Id) %>
            <p>
                <%: Html.PreviousPageLink("Cancel", "ImageLink") %>
                <input name="action" type="submit" value="Send" class="ImageLink" />
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
                <div>Client County of Residence:  <%: Model.OriginalQuestion.County.CountyName %></div>
                <br />
                <div>Client County of Venue:  <%: Model.OriginalQuestion.CaseCounty.CountyName %></div>
                <br />
                <div>Adverse Party:  <%: Model.OriginalQuestion.OpposingParty %></div>
                <br />
                <%: Html.Parse(Model.OriginalQuestion.Body) %>
                </td>
            </tr>
        </table>
    </fieldset>

    <div>
        <%: Html.ActionLink("Back to List", "List") %>
    </div>

</asp:Content>
