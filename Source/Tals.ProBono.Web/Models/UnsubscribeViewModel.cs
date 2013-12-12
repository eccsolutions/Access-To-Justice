using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Web.Models
{
    public class UnsubscribeViewModel
    {
        public Subscription Subscription { get; set; }
        public string ReturnUrl { get; set; }

        public static UnsubscribeViewModel CreateViewModel(Subscription subscription, string returnUrl)
        {
            return new UnsubscribeViewModel
                       {
                           Subscription = subscription,
                           ReturnUrl = returnUrl
                       };
        }
    }
}