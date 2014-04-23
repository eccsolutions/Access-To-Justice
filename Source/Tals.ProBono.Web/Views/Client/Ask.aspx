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
               <span>Kind of Problem</span>
            </div>
            <div class="editor-field">
                <table>
                    <tr>
                        <td width="30%"> <%: Html.DropDownListFor(model => model.CategoryId, new SelectList((IEnumerable)ViewData["categories"], "Id", "ShortDescription", Model.CategoryId), new {@class = "combobox"}) %>
                             <%: Html.ValidationMessageFor(model => model.CategoryId) %>
                        </td>
                         <td width="70%">     
                               Don't see your legal issue listed? Click <a href="http://www.lawhelpmn.org/resource/mlao-referrals-1?ref=m1muK" target="_blank">here</a> if your question is about:
                               <ul>
                                    <li>bankruptcy,</li>
                                    <li>sealing (expunging) criminal records, or</li>
                                    <li>being sued by a debt collector or credit card company.</li>
                               </ul>
                                This site can't help you with a problem you could go to jail for. 
                                Click <a href="http://www.lawhelpmn.org/resource/criminal-law-info?ref=hliW4" target="_blank">here</a> for other places to get help with a criminal problem.
                        </td>
                    </tr>
                </table>
            </div>
            <div class="editor-label">
                <span>What is your question about?</span>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Subject) %>
                <%: Html.ValidationMessageFor(model => model.Subject) %>
            </div>

            <div class="editor-label">
                <span>If you have a court date, enter it here. <strong>You might not get an answer to your question before your court date.</strong></span>
            </div>

            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.CourtDate, new {@class = "datepicker"}) %>
            </div>

            <div class="editor-label">
                <span>What is the name of the person or organization causing your legal problem?</span>
                <span>If you don't know, just leave it blank.</span>
            </div>

            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.OpposingParty) %>
            </div>

            <div class="editor-label">
                <span>If this question is about an open legal case, what county is your case in?</span>
            </div>

            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.CaseCountyId, new SelectList((IEnumerable)ViewData["casecounties"], "Id", "CountyName", Model.CaseCountyId),"Select a county", new {@class = "combobox"}) %>
                <%: Html.ValidationMessageFor(model => model.CaseCountyId) %>
            </div>
            
            <div class="editor-label">
                <span>Type your question here:</span>
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

