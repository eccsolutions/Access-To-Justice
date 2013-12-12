using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace Tals.ProBono.Web.Helpers
{
    public static class JQueryHelpers
    {
        public static MvcHtmlString AutoCompleteTextBox(this HtmlHelper helper, string textBoxName, string fieldName, object htmlAttributes = null)
        {
            var textBox = helper.TextBox(textBoxName, null, htmlAttributes);
            var hidden = helper.Hidden(fieldName);

            var result = string.Format("{0} {1}", textBox, hidden);

            return MvcHtmlString.Create(result);
        }

        public static MvcHtmlString AutoCompleteScript(this HtmlHelper html, string textBoxName, string fieldName, string buttonName, string url, object options)
        {
            var script =
@"<script type='text/javascript'>
    $(function () {
        $('input#" + textBoxName + @"').autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '" + url + @"',
                    type: 'POST',
                    dataType: 'json',
                    data: { searchText: request.term, maxResults: 10},
                    success: function (data) {
                        response($.map(data, function (item) {
                            return { label: item.Value, value: item.Value, id: item.Key}
                        }))
                    }
                })
            },
            select: function (event, ui) {
                $('#" + fieldName + @"').val(ui.item.id);
                $('#" + buttonName + @"').click();
            }
        });
    });
</script>";
            return MvcHtmlString.Create(script);
        }
    }
}
/*
<script type="text/javascript">
    $(function () {
        $("input#searchText").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%: Url.Action("FindAccounts", "Admin") %>',
                    type: "POST",
                    dataType: "json",
                    data: { searchText: request.term, maxResults: 10},
                    success: function (data) {
                        response($.map(data, function (item) {
                            return { label: item.Description, value: item.UserName, id: item.UserName}
                        }))
                    }
                })
            },
            select: function (event, ui) {
                $("#searchButton").click();
            }
        });
    });
</script>
*/