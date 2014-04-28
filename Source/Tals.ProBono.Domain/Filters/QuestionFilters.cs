using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Filters
{
    public static class QuestionFilters
    {
        public static bool ReachedLimit(this IQueryable<Question> qry, string userName)
        {
            var date = DateTime.Now.AddYears(-1);
            return qry.WithCreatedBy(userName).Since(date).Count() > 10000;
        }

        public static IQueryable<Question> Since(this IQueryable<Question> qry, DateTime since)
        {
            return qry.Where(x => x.CreatedDate > since);
        }

        public static IQueryable<Question> Urgent(this IQueryable<Question> qry)
        {
            var over25Days = DateTime.Now.AddDays(-25);
            return qry.Active().NotTaken().Where(q => q.CreatedDate < over25Days);
        }

        public static IQueryable<Question> Overdue(this IQueryable<Question> qry)
        {
            var over10Days = DateTime.Now.AddDays(-10);
            var over25Days = DateTime.Now.AddDays(-25);
            return qry.NotTaken().Where(q => q.CreatedDate < over10Days && q.CreatedDate > over25Days);
        }

        public static IQueryable<Question> Current(this IQueryable<Question> qry)
        {
            var over10Days = DateTime.Now.AddDays(-10);
            return qry.NotTaken().Where(q => q.CreatedDate > over10Days);
        }

        public static IQueryable<Question> NotTaken(this IQueryable<Question> qry)
        {
            return qry.Where(q => string.IsNullOrEmpty(q.TakenBy));
        }

        public static IQueryable<Question> WithCounty(this IQueryable<Question> qry, int countyId)
        {
            return from q in qry
                   where q.CountyId == countyId
                   select q;
        }

        public static IQueryable<Question> WithCategory(this IQueryable<Question> qry, int categoryId)
        {
            return from q in qry
                   where q.CategoryId == categoryId
                   select q;
        }

        public static IQueryable<Question> WithCategory(this IQueryable<Question> qry, string category)
        {
            return qry.Where(x => x.Category.CategoryName == category);
        }

        public static Question WithId(this IQueryable<Question> qry, int id)
        {
            return qry.SingleOrDefault(q => q.Id == id);
        }

        public static IQueryable<Question> WithCreatedBy(this IQueryable<Question> qry, string createdBy)
        {
            return from q in qry
                   where q.CreatedBy == createdBy
                   select q;
        }

        public static IQueryable<Question> WithCreatedBy(this IQueryable<Question> qry, IEnumerable<string> userNames)
        {
            return from q in qry
                   where userNames.Contains(q.CreatedBy)
                   select q;
        }

        public static IQueryable<Question> WithTakenBy(this IQueryable<Question> qry, string takenBy)
        {
            return from q in qry
                   where q.TakenBy == takenBy
                   select q;
        }

        public static IQueryable<Question> Taken(this IQueryable<Question> qry)
        {
            return from q in qry
                   where !string.IsNullOrEmpty(q.TakenBy)
                   select q;
        }

        public static void ExecuteActionOn(this IQueryable<Question> qry, Action<Question> f)
        {
            foreach(var question in qry)
            {
                f(question);
            }
        }

        public static IQueryable<Question> Closed(this IQueryable<Question> qry)
        {
            return from q in qry
                   where !string.IsNullOrEmpty(q.ClosedBy) && q.ClosedDate != null
                   select q;
        }

        public static IQueryable<Question> Active(this IQueryable<Question> qry)
        {
            return qry.Where(x => x.ClosedBy == null && x.ClosedDate == null);
        }

        public static IQueryable<Question> AnsweredBySinceLastLogin(this IQueryable<Question> qry, string userName, DateTime lastLogin)
        {
            return 
                qry.Where(
                    x =>
                    x.Posts.Count(p => p.CreatedBy == userName && p.CreatedDate > lastLogin) > 0);
        }
    }
}