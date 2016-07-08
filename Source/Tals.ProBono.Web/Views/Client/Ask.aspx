<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Client.Master" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Domain.Entities.Question>" %>
<%@ Import Namespace="Tals.ProBono.Resources" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=Ask.AskQuestion %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%=Ask.Instructions %></h2>
    
    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(Messages.PleaseCorrectErrorBelow) %>
        <fieldset>
            <legend><%=Ask.NewQuestion %></legend>
                        <div class="editor-label">
               <span><%=Ask.KindOfProblem %></span>
            </div>
            <div class="editor-field">
                <table>
                    <tr>
                        <td width="30%"> <%: Html.DropDownListFor(model => model.CategoryId, new SelectList((IEnumerable)ViewData["categories"], "Id", "ShortDescription", Model.CategoryId), new {@class = "combobox"}) %>
                             <%: Html.ValidationMessageFor(model => model.CategoryId) %>
                        </td>
                         <td width="70%">     
                            <p><%=Ask.KindHelp %></p>
                            <p><%=Ask.KindMoreInfo.Replace("{{SiteLink}}","<a href=\"http://washingtonlawhelp.org\" target=\"_blank\">washingtonlawhelp.org</a>") %></p>   
                        </td>
                    </tr>
                </table>
            </div>
            <div class="editor-label">
                <span><%=Ask.AboutQuestion %></span>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Subject) %>
                <%: Html.ValidationMessageFor(model => model.Subject) %>
            </div>

            <div class="editor-label">
                <span><%=Ask.CourtDateQuestion %> <strong><%=Ask.CourtDateMessage %></strong></span>
            </div>

            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.CourtDate, new {@class = "datepicker"}) %>
            </div>

            <div class="editor-label">
                <span><%=Ask.NameQuestion %></span>
            </div>

            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.OpposingParty) %>
            </div>

            <div class="editor-label">
                <span><%=Ask.CountyQuestion %></span>
            </div>

            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.CaseCountyId, new SelectList((IEnumerable)ViewData["casecounties"], "Id", "CountyName", Model.CaseCountyId),"Select a county", new {@class = "combobox"}) %>
                <%: Html.ValidationMessageFor(model => model.CaseCountyId) %>
            </div>
            
            <div class="editor-label">
                <span><%=Ask.QuestionLabel %></span>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.Body, 20, 80, new {@class = "bbcode"}) %>
                <%: Html.ValidationMessageFor(model => model.Body) %>
            </div>
            
            <p>
                <%: Html.ActionLink(Common.CancelButton, "Questions", "Client", null, new {@class = "ImageLink"}) %>
                <input type="submit" value="<%=Common.SendButton %>" class="ImageLink" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink(Common.BackToList, "Index") %>
    </div>

</asp:Content>

