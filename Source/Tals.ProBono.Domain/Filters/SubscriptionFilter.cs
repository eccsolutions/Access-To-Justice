using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Filters
{
    public static class SubscriptionFilter
    {
        public static Subscription WithCategoryFor(this IQueryable<Subscription> qry, int categoryId, string userName)
        {
            return qry.FirstOrDefault(q => q.CategoryId == categoryId && q.UserName == userName);
        }

        public static IQueryable<Subscription> For(this IQueryable<Subscription> qry, string userName) {
            return qry.Where(q => q.UserName == userName);
        }

        public static Subscription WithId(this IQueryable<Subscription> qry, int id)
        {
            return qry.FirstOrDefault(q => q.Id == id);
        }

        public static bool SubscriptionsExceededFor(this IQueryable<Subscription> qry, string userName) {
            return For(qry, userName).Count() >= 3;
        }
    }
}
