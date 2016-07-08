<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<int>" %>
<%@ Import Namespace="Tals.ProBono.Resources" %>
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
           <p><%=SignUpStep3.OtherMessage %></p>
           <p><%=SignUpStep3.LearnMoreMessage.Replace("{{Link}}","<a href=\"http://washingtonlawhelp.org\" target=\"_blank\">washingtonlawhelp.org</a>") %></p>      
        </div>
        </td>
    </tr>
</table>
