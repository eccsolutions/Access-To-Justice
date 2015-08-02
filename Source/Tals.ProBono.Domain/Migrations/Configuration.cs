using System;
using System.Linq;
using Tals.ProBono.Domain.Constants;
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
            addPages(context);

            context.SaveChanges();
        }

        private void addCounties(AdviceContext context)
        {
            if (context.Counties.Any())
            {
                return;
            }

            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Adams County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Asotin County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Benton County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Chelan County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Clallam County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Clark County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Columbia County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Cowlitz County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Douglas County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Ferry County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Franklin County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Garfield County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Grant County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Grays Harbor County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Island County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Jefferson County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "King County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Kitsap County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Kittitas County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Klickitat County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Lewis County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Lincoln County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Mason County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Okanogan County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Pacific County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Pend Oreille County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Pierce County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "San Juan County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Skagit County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Skamania County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Snohomish County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Spokane County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Stevens County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Thurston County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Wahkiakum County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Walla Walla County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Whatcom County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Whitman County" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Yakima County" });
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
                YearlyIncome = 11770,
                DependentsModifier = 4160,
                LegalAidLevel = 1.5M,
                ModestMeansLevel = 2.5M
            });
        }

        private void addPages(AdviceContext context)
        {

            if (context.Pages.Any())
            {
                return;
            }

            context.Pages.Add(new Page()
            {
                Id = ApplicationConstants.PAGE_ID_ADVOCATE,
                Title = "Attorney Advocate",
                Content = "Content Here",
                CreatedByUserName = "admin1",
                CreatedDate = DateTimeOffset.UtcNow
            });
        }
    }
}
