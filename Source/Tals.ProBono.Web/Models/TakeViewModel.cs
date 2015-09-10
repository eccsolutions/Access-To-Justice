using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Web.Models
{
    public class TakeViewModel
    {
        public Question Question { get; set; }

        public DetailsCreatedByModel CreatedBy { get; set; }
    }
}