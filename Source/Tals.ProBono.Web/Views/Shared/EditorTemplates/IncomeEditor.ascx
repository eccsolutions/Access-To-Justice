<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<Tals.ProBono.Domain.Entities.IncomeItem>>" %>
    <% for (int i = 0; i < Model.Count(); i++)
       { %>
    <fieldset>
    <legend>Enter income for person #<%: i + 1 %></legend>
        <div class="editor-label">
            Income before taxes are taken out:<br />
            <strong>Note:</strong> Enter only numbers without signs. (Example: 1000)
        </div>
        <div class="editor-field">
            $<%: Html.TextBox(string.Format("Answer[{0}].GrossIncome", i), Model[i].GrossIncome) %>
        </div>
        <div class="editor-label">
            How Often?
        </div>
        <div class="editor-field">
            <%: Html.DropDownList(string.Format("Answer[{0}].Frequency", i), ViewData["Frequencies"] as IEnumerable<SelectListItem>)%>
        </div>
    </fieldset>
    <% } %>