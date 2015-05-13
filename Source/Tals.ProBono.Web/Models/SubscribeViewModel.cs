using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Web.Infrastructure;

namespace Tals.ProBono.Web.Models
{
    public class SubscribeViewModel
    {
        public Subscription Subscription { get; set; }
        public string ReturnUrl { get; set; }

        public static SubscribeViewModel CreateViewModel(Category category, string returnUrl)
        {
            var view = new SubscribeViewModel
            {
                Subscription = new Subscription
                                   {
                                       Category = category,
                                       UserName = UserModel.Current.UserName,
                                       Email = UserModel.Current.Email,
                                       CategoryId = category.Id
                                   },
                ReturnUrl = returnUrl
            };

            return view;
        }
    }
}