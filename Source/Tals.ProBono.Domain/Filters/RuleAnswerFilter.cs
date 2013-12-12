using System.Linq;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Filters
{
    public static class RuleAnswerFilter
    {
        public static bool IsUserEligible(this IQueryable<RuleAnswer> qry, string sessionId)
        {
            return qry.Count(q => q.SessionID == sessionId && q.Question == "IsEligible" && q.Answer == "True") > 0;
        }
    }
}