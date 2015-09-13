using System.Collections.Generic;
using System.Linq;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Web.Models
{
    public class DetailsViewModel
    {
        public Question Question { get; set; }
        public IEnumerable<DetailsPostViewModel> Posts { get; set; }
        public DetailsCreatedByModel CreatedBy { get; set; }

        public static DetailsViewModel CreateViewModel(Question q, IEnumerable<Post> posts)
        {
            var model = new DetailsViewModel
            {
                Question = q,
                Posts = posts.Select(DetailsPostViewModel.CreateViewModel),
                CreatedBy = new DetailsCreatedByModel(UserProfile.GetUserProfile(q.CreatedBy), q.ClientPovertyLevel)
            };

            return model;
        }
    }
}