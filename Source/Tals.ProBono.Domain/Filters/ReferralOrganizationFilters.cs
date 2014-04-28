using System.Linq;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Filters {
    public static class ReferralOrganizationFilters {
        public static string OrgNameWithId(this IQueryable<ReferralOrganization> qry, int id) {
            return qry.Where(x => x.Id == id).Select(x => x.OrgName).FirstOrDefault(x => !string.IsNullOrEmpty(x));
        }
    }
}