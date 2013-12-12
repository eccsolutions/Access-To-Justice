using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Filters
{
    public static class CountyFilters
    {
        public static IQueryable<County> WithCounty(this IQueryable<County> qry, string county)
        {
            return qry.Where(x => x.CountyName == county);
        }
    }
}
