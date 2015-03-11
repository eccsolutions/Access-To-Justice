using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Filters
{
    public static class CategoryFilters
    {
        public static IQueryable<Category> PublicCategories(this IQueryable<Category> categories)
        {
            return categories.Where(x => x.Hidden == false);
        }
    }
}
