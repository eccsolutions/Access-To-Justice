using Tals.ProBono.Domain.Enums;

namespace Tals.ProBono.Web.Models
{
    public class DetailsCreatedByModel
    {
        public DetailsCreatedByModel(UserProfile userProfile, PovertyLevels? povertyLevel)
        {
            this.UserProfile = userProfile;
            this.PovertyLevel = povertyLevel;
        }
        
        public UserProfile UserProfile { get; set; }

        public PovertyLevels? PovertyLevel { get; set; }
    }
}