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
            Don't see your legal issue listed? Click <a href="http://www.lawhelpmn.org/resource/mlao-referrals-1?ref=m1muK" target="_blank">here</a> if your question is about:
            <ul>
            <li>bankruptcy,</li>
            <li>sealing (expunging) criminal records, or</li>
            <li>being sued by a debt collector or credit card company.</li>
            </ul>
            This site can't help you with a problem you could go to jail for. 
            Click <a href="http://www.lawhelpmn.org/resource/criminal-law-info?ref=hliW4" target="_blank">here</a> for other places to get help with a criminal problem.       
        </div>
        </td>
    </tr>
</table>
