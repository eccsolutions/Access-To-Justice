using System.Linq;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Migrations
{
    using System.Data.Entity.Migrations;

    internal sealed class Configuration : DbMigrationsConfiguration<AdviceContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
        }

        protected override void Seed(AdviceContext context)
        {
            addCounties(context);
        }

        private void addCounties(AdviceContext context)
        {
            if (context.Counties.Any())
            {
                return;
            }

            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Adams" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Ashland" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Barron" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Bayfield" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Brown" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Buffalo" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Burnett" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Calumet" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Chippewa" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Clark" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Columbia" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Crawford" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Dane" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Dodge" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Door" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Douglas" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Dunn" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Eau Claire" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Florence" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Fond du Lac" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Forest" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Grant" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Green" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Green Lake" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Iowa" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Iron" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Jackson" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Jefferson" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Juneau" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Kenosha" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Kewaunee" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "La Crosse" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Lafayette" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Langlade" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Lincoln" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Manitowoc" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Marathon" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Marinette" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Marquette" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Menominee" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Milwaukee" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Monroe" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Oconto" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Oneida" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Outagamie" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Ozaukee" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Pepin" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Pierce" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Polk" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Portage" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Price" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Racine" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Richland" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Rock" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Rusk" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Sauk" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Sawyer" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Shawano" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Sheboygan" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "St. Croix" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Taylor" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Trempealeau" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Vernon" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Vilas" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Walworth" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Washburn" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Washington" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Waukesha" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Waupaca" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Waushara" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Winnebago" });
            context.Counties.AddOrUpdate(c => c.CountyName, new County() { CountyName = "Wood" });        
        }
    }
}
