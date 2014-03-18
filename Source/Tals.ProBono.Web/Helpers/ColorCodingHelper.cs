using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Web.Helpers
{
    public class MvcRow : IDisposable
    {
        private bool _disposed;
        private readonly ViewContext _viewContext;
        private readonly TextWriter _writer;

        public MvcRow(ViewContext viewContext)
        {
            if(viewContext == null)
                throw new ArgumentNullException("viewContext");

            _viewContext = viewContext;
            _writer = viewContext.Writer;
        }

        public void Dispose()
        {
            Dispose(true /* disposing */);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if(!_disposed)
            {
                _disposed = true;
                _writer.Write("</tr>");
            }
        }

        public void EndDiv()
        {
            Dispose(true);
        }
    }

    public static class RowExtensions
    {
        public static MvcRow BeginRowForCoding(this HtmlHelper helper, Question question)
        {
            DateTime created = question.CreatedDate;

            var tagBuilder = new TagBuilder("tr");

            var cssClass = question.IsClosed() ? "Closed" : created > DateTime.Now.AddDays(-5)
                                ? "Current"
                                : created < DateTime.Now.AddDays(-10) ? "Urgent" : "Overdue";

            tagBuilder.AddCssClass(cssClass);

            helper.ViewContext.Writer.Write(tagBuilder.ToString(TagRenderMode.StartTag));

            var row = new MvcRow(helper.ViewContext);

            return row;
        }
    }
}