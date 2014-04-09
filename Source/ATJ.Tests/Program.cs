using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Filters;

namespace ATJ.Tests
{
    class Program
    {
        static void Main(string[] args) {
            using (var uow = new UnitOfWork()) {
                //var question = new Question();
                //question.Body = "testing";
                //question.Subject = "testing";
                //question.CountyId = 1;
                //question.CaseCountyId = 1;
                //question.CategoryId = 1;
                //question.CreatedBy = "democlient";
                //question.CreatedDate = DateTime.Now;

                //uow.QuestionRepository.Insert(question);
                //uow.Save();

                var question = uow.QuestionRepository.Get().WithId(7);
                var isUnread = question.IsUnread("democlient");                
            }
        }
    }
}
