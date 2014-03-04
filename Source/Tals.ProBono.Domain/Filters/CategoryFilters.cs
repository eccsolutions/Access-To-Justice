using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Filters
{
    public static class CategoryFilters
    {
        public static Category WithId(this IQueryable<Category> qry, int id)
        {
            return qry.FirstOrDefault(q => q.Id == id);
        }
    }
}
