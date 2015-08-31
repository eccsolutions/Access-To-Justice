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
            Don't see your legal issue listed? This site can't help you with a problem you could go to jail for. To get help with a criminal problem, contact the <a href="http://wispd.org/index.php/client-or-prospective-client">Wisconsin State Public Defender</a> or the <a href="http://www.wisbar.org/forpublic/ineedalawyer/pages/lris.aspx">Lawyer Referral & Information Service</a>. For questions about pardons and expungement, visit <a href="http://wilawlibrary.gov/topics/justice/crimlaw/pardons.php">this page</a> at the Wisconsin State Law Library.
        </div>
        </td>
    </tr>
</table>
