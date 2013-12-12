using System.Collections.Generic;
using System.Linq;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Web.Models
{
    public class WorkEntryViewModel
    {
        public WorkEntry Entry { get; set; }
        public double? YearToDateHours { get; set; }
        public IQueryable<Question> QuestionsAnswered { get; set; }
    }
}