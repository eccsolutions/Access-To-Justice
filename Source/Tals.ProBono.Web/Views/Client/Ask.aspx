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
                             <p><strong>Bankruptcy</strong></p>
                             <p>If you live in Aitkin, Carlton, Cass, Cook, Crow Wing, Itasca, Kanabec, Koochiching, Lake, Pine, or St. Louis County, contact the Volunteer Attorney Program by clicking <a href="http://volunteerattorney.org/AboutUs/VolunteerAttorneyProgram/ConsumerCreditAdvocacyProjectCCAP.aspx" target="_blank">here</a>. If you live in any other Minnesota county, contact the Volunteer Lawyers Network by clicking <a href="https://www.formstack.com/forms/vln-intake" target="_blank">here.</a></p>
                             <p><strong>Sealing (Expunging) Criminal Records</strong></p>
                             <p>If you live in Aitkin, Carlton, Cass, Cook, Crow Wing, Itasca, Kanabec, Lake, Pine, or St. Louis County, contact the Volunteer Attorney Program by clicking <a href="http://volunteerattorney.org/AboutUs/VolunteerAttorneyProgram/AskanAttorneyProgram.aspx" target="_blank">here</a> If you live in any other Minnesota county, contact the Volunteer Lawyers Network by clicking <a href="https://www.formstack.com/forms/vln-intake " target="_blank">here.</a></p>
                             <p><strong>Received Court Papers about a Debt Issue</strong></p>
                             <p>If your debt case is in Aitkin, Carlton, Cass, Cook, Crow Wing, Itasca, Kanabec, Koochiching, Lake, Pine, or St. Louis County, contact the Volunteer Attorney Program by clicking <a href="http://volunteerattorney.org/AboutUs/VolunteerAttorneyProgram/AskanAttorneyProgram.aspx" target="_blank">here.</a> If your case is in any other Minnesota county, contact the Volunteer Lawyers Network by clicking <a href="https://www.formstack.com/forms/vln-intake" target="_blank">here.</a></p>
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
               <%: Html.TextBoxFor(model => model.CaseCounty) %>
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

