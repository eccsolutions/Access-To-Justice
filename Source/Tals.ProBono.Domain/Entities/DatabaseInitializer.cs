using System.Collections.Generic;
using System.Data.Entity;
using Tals.ProBono.Domain.Migrations;

namespace Tals.ProBono.Domain.Entities
{
    public class DatabaseInitializer
    {
        public void MigrateDatabaseToLatestVersion()
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<AdviceContext, Configuration>());
        }
    }
}
