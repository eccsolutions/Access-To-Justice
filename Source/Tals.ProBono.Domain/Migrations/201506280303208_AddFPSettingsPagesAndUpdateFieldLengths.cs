namespace Tals.ProBono.Domain.Migrations
{
    using System.Data.Entity.Migrations;
    
    public partial class AddFPSettingsPagesAndUpdateFieldLengths : DbMigration
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
                        LastModifiedDate = c.DateTimeOffset(precision: 7),
                        LastModifiedByUserName = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Pages",
                c => new
                    {
                        Id = c.Int(nullable: false),
                        Title = c.String(maxLength: 300),
                        Content = c.String(nullable: false),
                        CreatedDate = c.DateTimeOffset(nullable: false, precision: 7),
                        CreatedByUserName = c.String(maxLength: 256),
                        LastModifiedDate = c.DateTimeOffset(precision: 7),
                        LastModifiedUserName = c.String(maxLength: 256),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.Questions", "ClientPovertyLevel", c => c.Int());
            AlterColumn("dbo.Counties", "CountyName", c => c.String(nullable: false, maxLength: 300));
            AlterColumn("dbo.Categories", "CategoryName", c => c.String(nullable: false, maxLength: 300));
            AlterColumn("dbo.Categories", "ShortDescription", c => c.String(nullable: false, maxLength: 500));
            AlterColumn("dbo.Categories", "LongDescription", c => c.String(maxLength: 1000));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Categories", "LongDescription", c => c.String());
            AlterColumn("dbo.Categories", "ShortDescription", c => c.String());
            AlterColumn("dbo.Categories", "CategoryName", c => c.String());
            AlterColumn("dbo.Counties", "CountyName", c => c.String());
            DropColumn("dbo.Questions", "ClientPovertyLevel");
            DropTable("dbo.Pages");
            DropTable("dbo.FedPovertySettings");
        }
    }
}
