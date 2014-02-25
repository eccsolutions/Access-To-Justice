using System.Linq;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Filters
{
    public static class PostFilters
    {
        public static IQueryable<Post> CreatedBy(this IQueryable<Post> qry, string createdBy)
        {
            return qry.Where(q => q.CreatedBy == createdBy);
        }

        public static Post WithId(this IQueryable<Post> qry, int id)
        {
            return qry.SingleOrDefault(q => q.Id == id);
        }

        public static Post Accepted(this IQueryable<Post> qry)
        {
            return qry.FirstOrDefault(q => q.Accepted);
        }

        public static IQueryable<Post> DraftsFor(this IQueryable<Post> qry, string userName)
        {
            return qry.Where(p => p.CreatedBy == userName);
        }

        public static IQueryable<Post> WithQuestionId(this IQueryable<Post> qry, int id)
        {
            return qry.Where(p => p.QuestionId == id);
        }

        //public static IQueryable<Post> Drafts(this IQueryable<Post> qry, string userName)
        //{
        //    return qry.Where(p => p.Draft && p.CreatedBy == userName);
        //}
    }
}