using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Migrations
{
    public class DatabaseInitializer
    {
        public void MigrateDatabaseToLatestVersion()
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<AdviceContext, Configuration>());
        }
    }
}
