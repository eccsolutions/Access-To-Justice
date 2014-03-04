using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Filters
{
    public static class SubscriptionFilter
    {
        public static Subscription For(this IQueryable<Subscription> qry, int id, string userName)
        {
            return qry.FirstOrDefault(q => q.CategoryId == id && q.UserName == userName);
        }

        public static Subscription WithId(this IQueryable<Subscription> qry, int id)
        {
            return qry.FirstOrDefault(q => q.Id == id);
        }
    }
}
