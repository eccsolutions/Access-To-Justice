using System.Collections.Generic;
using System.Linq;
using System.Text;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Services
{
    public interface IEligibilityService
    {
        bool IsEligible(string sessionId);
        void LogEligibility(RuleAnswer answer);
    }
}
