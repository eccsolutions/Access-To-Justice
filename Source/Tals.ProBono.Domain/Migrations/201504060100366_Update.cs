namespace Tals.ProBono.Domain.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Update : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.ReferralOrganizations",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        OrgName = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.Questions", "ReferralOrganization", c => c.String());
            AddColumn("dbo.Questions", "OpposingParty", c => c.String());
            AddColumn("dbo.Questions", "ReferralOrganization_Id", c => c.Int());
            CreateIndex("dbo.Questions", "ReferralOrganization_Id");
            AddForeignKey("dbo.Questions", "ReferralOrganization_Id", "dbo.ReferralOrganizations", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Questions", "ReferralOrganization_Id", "dbo.ReferralOrganizations");
            DropIndex("dbo.Questions", new[] { "ReferralOrganization_Id" });
            DropColumn("dbo.Questions", "ReferralOrganization_Id");
            DropColumn("dbo.Questions", "OpposingParty");
            DropColumn("dbo.Questions", "ReferralOrganization");
            DropTable("dbo.ReferralOrganizations");
        }
    }
}
