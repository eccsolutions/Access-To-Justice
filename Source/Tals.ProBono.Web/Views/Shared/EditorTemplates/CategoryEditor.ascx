<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewPage<Tals.ProBono.Domain.Entities.Question>" %>
    <style type="text/css">
        .auto-style1
        {
            width: 100%;
        }
    </style>

<table class="auto-style1">
    <tr>
        <td><div class="editor-field">
             <%: Html.DropDownListFor(model => model.CategoryId, new SelectList((IEnumerable)ViewData["categories"], "Id", "ShortDescription", Model.CategoryId), new {@class = "combobox"}) %>
             <%: Html.ValidationMessageFor(model => model.CategoryId) %>
    </div></td>
        <td>
            <p><strong>Bankruptcy</strong></p>
            <p>If you live in Aitkin, Carlton, Cass, Cook, Crow Wing, Itasca, Kanabec, Koochiching, Lake, Pine, or St. Louis County, contact the Volunteer Attorney Program by clicking <a href="http://volunteerattorney.org/AboutUs/VolunteerAttorneyProgram/ConsumerCreditAdvocacyProjectCCAP.aspx">here</a>. If you live in any other Minnesota county, contact the Volunteer Lawyers Network by clicking <a href="https://www.formstack.com/forms/vln-intake">here.</a></p>
            <p><strong>Sealing (Expunging) Criminal Records</strong></p>
            <p>If you live in Aitkin, Carlton, Cass, Cook, Crow Wing, Itasca, Kanabec, Lake, Pine, or St. Louis County, contact the Volunteer Attorney Program by clicking <a href="http://volunteerattorney.org/AboutUs/VolunteerAttorneyProgram/AskanAttorneyProgram.aspx">here</a> If you live in any other Minnesota county, contact the Volunteer Lawyers Network by clicking <a href="https://www.formstack.com/forms/vln-intake">here.</a></p>
            <p><strong>Received Court Papers about a Debt Issue</strong></p>
            <p>If your debt case is in Aitkin, Carlton, Cass, Cook, Crow Wing, Itasca, Kanabec, Koochiching, Lake, Pine, or St. Louis County, contact the Volunteer Attorney Program by clicking <a href="http://volunteerattorney.org/AboutUs/VolunteerAttorneyProgram/AskanAttorneyProgram.aspx">here.</a> If your case is in any other Minnesota county, contact the Volunteer Lawyers Network by clicking <a href="https://www.formstack.com/forms/vln-intake">here.</a></p>
        </td>
    </tr>
</table>
