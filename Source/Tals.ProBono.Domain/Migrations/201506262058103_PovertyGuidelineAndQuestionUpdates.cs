namespace Tals.ProBono.Domain.Migrations
{
    using System.Data.Entity.Migrations;
    
    public partial class PovertyGuidelineAndQuestionUpdates : DbMigration
    {
        public override void Up()
        {
            Sql("UPDATE dbo.Categories SET ShortDescription = CategoryName WHERE ShortDescription IS NULL");
            
            CreateTable(
                "dbo.FedPovertySettings",
                c => new
                    {
                        Id = c.Int(nullable: false),
                        YearlyIncome = c.Decimal(nullable: false, precision: 18, scale: 6),
                        DependentsModifier = c.Decimal(nullable: false, precision: 18, scale: 6),
                        LegalAidLevel = c.Decimal(nullable: false, precision: 18, scale: 6),
                        ModestMeansLevel = c.Decimal(nullable: false, precision: 18, scale: 6),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.Questions", "ClientPovertyLevel", c => c.Int());
            AlterColumn("dbo.Categories", "CategoryName", c => c.String(nullable: false));
            AlterColumn("dbo.Categories", "ShortDescription", c => c.String(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Categories", "ShortDescription", c => c.String());
            AlterColumn("dbo.Categories", "CategoryName", c => c.String());
            DropColumn("dbo.Questions", "ClientPovertyLevel");
            DropTable("dbo.FedPovertySettings");
        }
    }
}
