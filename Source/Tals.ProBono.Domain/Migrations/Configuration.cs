using System.Linq;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Migrations
{
    using System.Data.Entity.Migrations;

    internal sealed class Configuration : DbMigrationsConfiguration<AdviceContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(AdviceContext context)
        {
            addCounties(context);
            addFedPovertySettings(context);
            context.SaveChanges();
        }

        private void addCounties(AdviceContext context)
        {
            if (context.Counties.Any())
            {
                return;
            }

            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Apache County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Cochise County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Coconino County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Gila County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Graham County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Greenlee County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "La Paz County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Maricopa County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Mohave County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Navajo County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Pima County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Pinal County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Santa Cruz County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Yavapai County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Yuma County" });
        }

        private void addFedPovertySettings(AdviceContext context)
        {
            if (context.FedPovertySettings.Any())
            {
                return;
            }

            context.FedPovertySettings.Add(new FedPovertySetting()
            {
                Id = 1,
                YearlyRate = 14588,
                Factor = 5075,
                LegalAidLevel = 2.6M,
                ModestMeansLevel = 2.0M
            });
        }
    }
}
