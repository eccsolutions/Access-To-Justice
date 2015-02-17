using System.Collections.Generic;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<Tals.ProBono.Domain.Entities.AdviceContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
        }

        //protected override void Seed(Tals.ProBono.Domain.Entities.AdviceContext context)
        //{
        //    context.Database.ExecuteSqlCommand("DELETE FROM Counties");
        //    context.Database.ExecuteSqlCommand("DBCC CHECKIDENT ('AccessToJustice.dbo.Counties', RESEED, 0)");
        //    context.Counties.AddRange(new List<County>()
        //    {
        //        new County() {CountyName = "Adams County"},
        //        new County() {CountyName = "Alcorn County"},
        //        new County() {CountyName = "Amite County"},
        //        new County() {CountyName = "Attala County"},
        //        new County() {CountyName = "Benton County"},
        //        new County() {CountyName = "Bolivar County"},
        //        new County() {CountyName = "Calhoun County"},
        //        new County() {CountyName = "Carroll County"},
        //        new County() {CountyName = "Chickasaw County"},
        //        new County() {CountyName = "Choctaw County"},
        //        new County() {CountyName = "Claiborne County"},
        //        new County() {CountyName = "Clarke County"},
        //        new County() {CountyName = "Clay County"},
        //        new County() {CountyName = "Coahoma County"},
        //        new County() {CountyName = "Copiah County"},
        //        new County() {CountyName = "Covington County"},
        //        new County() {CountyName = "DeSoto County"},
        //        new County() {CountyName = "Forrest County"},
        //        new County() {CountyName = "Franklin County"},
        //        new County() {CountyName = "George County"},
        //        new County() {CountyName = "Greene County"},
        //        new County() {CountyName = "Grenada County"},
        //        new County() {CountyName = "Hancock County"},
        //        new County() {CountyName = "Harrison County"},
        //        new County() {CountyName = "Hinds County"},
        //        new County() {CountyName = "Holmes County"},
        //        new County() {CountyName = "Humphreys County"},
        //        new County() {CountyName = "Issaquena County"},
        //        new County() {CountyName = "Itawamba County"},
        //        new County() {CountyName = "Jackson County"},
        //        new County() {CountyName = "Jasper County"},
        //        new County() {CountyName = "Jefferson County"},
        //        new County() {CountyName = "Jefferson Davis County"},
        //        new County() {CountyName = "Jones County"},
        //        new County() {CountyName = "Kemper County"},
        //        new County() {CountyName = "Lafayette County"},
        //        new County() {CountyName = "Lamar County"},
        //        new County() {CountyName = "Lauderdale County"},
        //        new County() {CountyName = "Lawrence County"},
        //        new County() {CountyName = "Leake County"},
        //        new County() {CountyName = "Lee County"},
        //        new County() {CountyName = "Leflore County"},
        //        new County() {CountyName = "Lincoln County"},
        //        new County() {CountyName = "Lowndes County"},
        //        new County() {CountyName = "Madison County"},
        //        new County() {CountyName = "Marion County"},
        //        new County() {CountyName = "Marshall County"},
        //        new County() {CountyName = "Monroe County"},
        //        new County() {CountyName = "Montgomery County"},
        //        new County() {CountyName = "Neshoba County"},
        //        new County() {CountyName = "Newton County"},
        //        new County() {CountyName = "Noxubee County"},
        //        new County() {CountyName = "Oktibbeha County"},
        //        new County() {CountyName = "Panola County"},
        //        new County() {CountyName = "Pearl River County"},
        //        new County() {CountyName = "Perry County"},
        //        new County() {CountyName = "Pike County"},
        //        new County() {CountyName = "Pontotoc County"},
        //        new County() {CountyName = "Prentiss County"},
        //        new County() {CountyName = "Quitman County"},
        //        new County() {CountyName = "Rankin County"},
        //        new County() {CountyName = "Scott County"},
        //        new County() {CountyName = "Sharkey County"},
        //        new County() {CountyName = "Simpson County"},
        //        new County() {CountyName = "Smith County"},
        //        new County() {CountyName = "Stone County"},
        //        new County() {CountyName = "Sunflower County"},
        //        new County() {CountyName = "Tallahatchie County"},
        //        new County() {CountyName = "Tate County"},
        //        new County() {CountyName = "Tippah County"},
        //        new County() {CountyName = "Tishomingo County"},
        //        new County() {CountyName = "Tunica County"},
        //        new County() {CountyName = "Union County"},
        //        new County() {CountyName = "Walthall County"},
        //        new County() {CountyName = "Warren County"},
        //        new County() {CountyName = "Washington County"},
        //        new County() {CountyName = "Wayne County"},
        //        new County() {CountyName = "Webster County"},
        //        new County() {CountyName = "Wilkinson County"},
        //        new County() {CountyName = "Winston County"},
        //        new County() {CountyName = "Yalobusha County"},
        //        new County() {CountyName = "Yazoo County"}
        //    });

        //    context.SaveChanges();
        //}
    }
}
