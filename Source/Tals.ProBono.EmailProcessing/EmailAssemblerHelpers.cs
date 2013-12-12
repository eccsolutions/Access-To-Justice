using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Services;

namespace Tals.ProBono.EmailProcessing
{
    public static class EmailAssemblerHelpers
    {
        public static string GetHtmlTable(this EmailAssembler assembler, IEnumerable<Question> questions)
        {
            var htmlTable = new StringBuilder();

            htmlTable.Append("<table border='1' style='border: 1px solid #000; width: 100%;'>");
            htmlTable.Append(@"
<tr>
    <th>Category</th>
    <th>Subject</th>
    <th>Request Date</th>
    <th>Taken By</th>
</tr>
");
            foreach (var q in questions)
            {
                htmlTable.AppendFormat(
                    @"
<tr>
    <td>{0}</td>
    <td><a href='http://{4}'>{1}</a></td>
    <td style='text-align:right'>{2}</td>
    <td>{3}</td>
</tr>",
                    q.Category.CategoryName, q.Subject, q.CreatedDate, q.TakenBy,
                    ConfigSettings.SiteUrl + "attorney/details/" + q.Id);
            }
            htmlTable.Append("</table>");

            return htmlTable.ToString();
        }
    }
}
