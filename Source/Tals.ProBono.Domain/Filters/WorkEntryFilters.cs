using System;
using System.Linq;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Filters
{
    public static class WorkEntryFilters
    {
        public static IQueryable<WorkEntry> YearToDateFor(this IQueryable<WorkEntry> entries, string userName)
        {
            var firstDayOfYear = new DateTime(DateTime.Now.Year, 1, 1);
            return entries.Where(entry => entry.UserName == userName && entry.Logged > firstDayOfYear);
        }
    }
}