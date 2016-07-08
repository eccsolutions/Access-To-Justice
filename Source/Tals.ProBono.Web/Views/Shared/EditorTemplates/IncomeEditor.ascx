<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<Tals.ProBono.Domain.Entities.IncomeItem>>" %>
<%@ Import Namespace="Tals.ProBono.Resources" %>
<% for (int i = 0; i < Model.Count(); i++)
       { %>
    <fieldset>
    <legend><%=SignUpStep6.EnterForPerson.Replace("{{Num}}",(i+1).ToString()) %></legend>
        <div class="editor-label">
            <%=SignUpStep6.IncomeBeforeTaxes %><br />
            <strong><%=SignUpStep6.Note %>:</strong> <%=SignUpStep6.EnterOnly %>
        </div>
        <div class="editor-field">
            $<%: Html.TextBox(string.Format("Answer[{0}].GrossIncome", i), Model[i].GrossIncome) %>
        </div>
        <div class="editor-label">
            <%=SignUpStep6.HowOften %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList(string.Format("Answer[{0}].Frequency", i), ViewData["Frequencies"] as IEnumerable<SelectListItem>)%>
        </div>
    </fieldset>
    <% } %>