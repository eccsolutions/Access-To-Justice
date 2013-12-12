using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tals.ProBono.Domain.Entities
{
    public partial class Audit
    {
        public Audit() {
            if(_AuditDate == DateTime.MinValue)
                _AuditDate = DateTime.Now;
        }
    }
}
