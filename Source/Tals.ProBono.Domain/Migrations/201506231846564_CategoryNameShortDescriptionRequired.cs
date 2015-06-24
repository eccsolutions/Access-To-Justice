namespace Tals.ProBono.Domain.Migrations
{
    using System.Data.Entity.Migrations;
    
    public partial class CategoryNameShortDescriptionRequired : DbMigration
    {
        public override void Up()
        {
            Sql("UPDATE dbo.Categories SET ShortDescription = CategoryName WHERE ShortDescription IS NULL");
            AlterColumn("dbo.Categories", "CategoryName", c => c.String(nullable: false));
            AlterColumn("dbo.Categories", "ShortDescription", c => c.String(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Categories", "ShortDescription", c => c.String());
            AlterColumn("dbo.Categories", "CategoryName", c => c.String());
        }
    }
}
