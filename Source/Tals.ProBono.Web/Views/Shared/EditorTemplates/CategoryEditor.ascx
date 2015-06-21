<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<int>" %>
    <style type="text/css">
        .auto-style1
        {
            width: 100%;
        }
    </style>

<table class="auto-style1">
    <tr>
        <td><div class="editor-field">
        <%: Html.DropDownListFor(m => m, ViewData["Categories"] as SelectList) %>
        <%: Html.ValidationMessageFor(m => m) %>
    </div>
    <br />
        <div>  
           <p>If you do not know which category your legal issue is in, select "Other".</p>
           <p>To learn more about where your legal issue may fit or to receive general information about the law, visit <a href="http://azlawhelp.org/" target="_blank">AZLawhelp.org</a></p>      
        </div>
        </td>
    </tr>
</table>
