using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tals.ProBono.Domain.Abstract
{
    public interface IRoles
    {
        bool IsUserInRole(string userName, string role);
        bool IsUserInRole(string role);
    }
}
