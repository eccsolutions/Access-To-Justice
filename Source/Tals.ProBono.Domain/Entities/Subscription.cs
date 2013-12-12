using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tals.ProBono.Domain.Entities
{
    public partial class Subscription
    {
        public Subscription() {
            if(_Subscribed == DateTime.MinValue)
                _Subscribed = DateTime.Now;
        }
    }
}
