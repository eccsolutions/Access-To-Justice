<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DateTime?>" %>
    <div class="editor-field">
        <%: Html.TextBoxFor(model=>model) %> (MM/DD/YYYY)
    </div>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#<%:Html.IdFor(model=>model)%>").datepicker({
                changeMonth: true,
                changeYear: true,
                yearRange: '1900:+0',
                dateFormat: 'mm/dd/yy'
            });
        })
    </script>