using System;
using System.Linq;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Filters;

namespace Tals.ProBono.Domain.Services
{
    public class EligibilityService : IEligibilityService
    {
        private readonly AdviceContext _container;
        public EligibilityService()
        {
            _container = new AdviceContext();
        }

        public bool IsEligible(string sessionId)
        {
            return _container.RuleAnswers.IsUserEligible(sessionId);
        }

        public void LogEligibility(RuleAnswer answer)
        {
            throw new NotImplementedException();
        }
    }
}