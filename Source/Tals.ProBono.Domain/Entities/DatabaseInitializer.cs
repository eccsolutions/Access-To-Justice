using System.Collections.Generic;
using System.Data.Entity;
using Tals.ProBono.Domain.Migrations;

namespace Tals.ProBono.Domain.Entities
{
    public class DatabaseInitializer
    {
        public void MigrateDatabaseToLatestVersion()
        {
            //Database.SetInitializer(new MigrateDatabaseToLatestVersion<AdviceContext, Configuration>());
            Database.SetInitializer(new AdviceContextInitializer());
        }
    }

    public class AdviceContextInitializer : DropCreateDatabaseAlways<AdviceContext>
    {
        protected override void Seed(AdviceContext context)
        {
            context.Counties.AddRange(new List<County>()
                {
                    new County(){CountyName = "Aitkin County"},
                    new County() {CountyName = "Anoka County"},
                    new County() {CountyName = "Becker County"},
                    new County() {CountyName = "Beltrami County"},
                    new County() {CountyName = "Benton County"},
                    new County() {CountyName = "Big Stone County"},
                    new County() {CountyName = "Blue Earth County"},
                    new County() {CountyName = "Brown County"},
                    new County() {CountyName = "Carlton County"},
                    new County() {CountyName = "Carver County"},
                    new County() {CountyName = "Cass County"},
                    new County() {CountyName = "Chippewa County"},
                    new County() {CountyName = "Chisago County"},
                    new County() {CountyName = "Clay County"},
                    new County() {CountyName = "Clearwater County"},
                    new County() {CountyName = "Cook County"},
                    new County() {CountyName = "Cottonwood County"},
                    new County() {CountyName = "Crow Wing County"},
                    new County() {CountyName = "Dakota County"},
                    new County() {CountyName = "Dodge County"},
                    new County() {CountyName = "Douglas County"},
                    new County() {CountyName = "Faribault County"},
                    new County() {CountyName = "Fillmore County"},
                    new County() {CountyName = "Freeborn County"},
                    new County() {CountyName = "Goodhue County"},
                    new County() {CountyName = "Grant County"},
                    new County() {CountyName = "Hennepin County"},
                    new County() {CountyName = "Houston County"},
                    new County() {CountyName = "Hubbard County"},
                    new County() {CountyName = "Isanti County"},
                    new County() {CountyName = "Itasca County"},
                    new County() {CountyName = "Jackson County"},
                    new County() {CountyName = "Kanabec County"},
                    new County() {CountyName = "Kandiyohi County"},
                    new County() {CountyName = "Kittson County"},
                    new County() {CountyName = "Koochiching County"},
                    new County() {CountyName = "Lac qui Parle County"},
                    new County() {CountyName = "Lake County"},
                    new County() {CountyName = "Lake of the Woods County"},
                    new County() {CountyName = "Le Sueur County"},
                    new County() {CountyName = "Lincoln County"},
                    new County() {CountyName = "Lyon County"},
                    new County() {CountyName = "McLeod County"},
                    new County() {CountyName = "Mahnomen County"},
                    new County() {CountyName = "Marshall County"},
                    new County() {CountyName = "Martin County"},
                    new County() {CountyName = "Meeker County"},
                    new County() {CountyName = "Mille Lacs County"},
                    new County() {CountyName = "Morrison County"},
                    new County() {CountyName = "Mower County"},
                    new County() {CountyName = "Murray County"},
                    new County() {CountyName = "Nicollet County"},
                    new County() {CountyName = "Nobles County"},
                    new County() {CountyName = "Norman County"},
                    new County() {CountyName = "Olmsted County"},
                    new County() {CountyName = "Otter Tail County"},
                    new County() {CountyName = "Pennington County"},
                    new County() {CountyName = "Pine County"},
                    new County() {CountyName = "Pipestone County"},
                    new County() {CountyName = "Polk County"},
                    new County() {CountyName = "Pope County"},
                    new County() {CountyName = "Ramsey County"},
                    new County() {CountyName = "Red Lake County"},
                    new County() {CountyName = "Redwood County"},
                    new County() {CountyName = "Renville County"},
                    new County() {CountyName = "Rice County"},
                    new County() {CountyName = "Rock County"},
                    new County() {CountyName = "Roseau County"},
                    new County() {CountyName = "Saint Louis County"},
                    new County() {CountyName = "Scott County"},
                    new County() {CountyName = "Sherburne County"},
                    new County() {CountyName = "Sibley County"},
                    new County() {CountyName = "Stearns County"},
                    new County() {CountyName = "Steele County"},
                    new County() {CountyName = "Stevens County"},
                    new County() {CountyName = "Swift County"},
                    new County() {CountyName = "Todd County"},
                    new County() {CountyName = "Traverse County"},
                    new County() {CountyName = "Wabasha County"},
                    new County() {CountyName = "Wadena County"},
                    new County() {CountyName = "Waseca County"},
                    new County() {CountyName = "Washington County"},
                    new County() {CountyName = "Watonwan County"},
                    new County() {CountyName = "Wilkin County"},
                    new County() {CountyName = "Winona County"},
                    new County() {CountyName = "Wright County"},
                    new County() {CountyName = "Yellow Medicine County"}
                });

            context.SaveChanges();
        }
    }
}
