using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading;
using System.Web.Security;
using Tals.ProBono.Domain.Abstract;
using Tals.ProBono.Domain.Concrete;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Filters;
using Tals.ProBono.Domain.Services;

namespace Tals.ProBono.EmailProcessing
{
    class Program
    {
        static void Main(string[] args)
        {
            var processor = new EmailProcessor(new EmailService(), new QuestionRepositorySql());

            //processor.OverTwoDays();
            //processor.OverThreeDays();
            processor.Over25Days();
        }
    }

    public class GenericEmailAssembler : EmailAssembler
    {
        public GenericEmailAssembler(string templateName, IEnumerable<Question> questions)
        {
            TemplatePath = GetTemplatePath(templateName);
            var htmlTable = this.GetHtmlTable(questions);
            Properties = new Dictionary<string, string>
                             {
                                 {"Questions", htmlTable}
                             };
        }
    }

    public class Over25DaysEmailAssembler : GenericEmailAssembler
    {
        public Over25DaysEmailAssembler(string categoryName, string templateName, IEnumerable<Question> questions) : base(templateName, questions)
        {
            Properties.Add("CategoryName", categoryName);
        }
    }
}