namespace Tals.ProBono.Domain.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Audits",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        QuestionId = c.Int(nullable: false),
                        AuditType = c.String(),
                        UserName = c.String(),
                        AuditDate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Questions", t => t.QuestionId, cascadeDelete: true)
                .Index(t => t.QuestionId);
            
            CreateTable(
                "dbo.Questions",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Subject = c.String(),
                        Body = c.String(),
                        CreatedBy = c.String(),
                        TakenBy = c.String(),
                        TakenDate = c.DateTime(),
                        CreatedDate = c.DateTime(nullable: false),
                        CategoryId = c.Int(),
                        CountyId = c.Int(nullable: false),
                        CourtDate = c.DateTime(),
                        ClosedDate = c.DateTime(),
                        ClosedBy = c.String(),
                        PersonOrOrganization = c.String(),
                        CaseCountyId = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Counties", t => t.CaseCountyId)
                .ForeignKey("dbo.Categories", t => t.CategoryId)
                .ForeignKey("dbo.Counties", t => t.CountyId, cascadeDelete: true)
                .Index(t => t.CaseCountyId)
                .Index(t => t.CategoryId)
                .Index(t => t.CountyId);
            
            CreateTable(
                "dbo.Counties",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CountyName = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Categories",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CategoryName = c.String(),
                        ShortDescription = c.String(),
                        LongDescription = c.String(),
                        SortOrder = c.Int(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Subscriptions",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CategoryId = c.Int(nullable: false),
                        UserName = c.String(),
                        Email = c.String(),
                        Subscribed = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Categories", t => t.CategoryId, cascadeDelete: true)
                .Index(t => t.CategoryId);
            
            CreateTable(
                "dbo.Posts",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        QuestionId = c.Int(nullable: false),
                        Subject = c.String(),
                        Body = c.String(),
                        CreatedBy = c.String(),
                        CreatedDate = c.DateTime(nullable: false),
                        Accepted = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Questions", t => t.QuestionId, cascadeDelete: true)
                .Index(t => t.QuestionId);
            
            CreateTable(
                "dbo.BBCodeItems",
                c => new
                    {
                        BBCodeID = c.Int(nullable: false, identity: true),
                        Tag = c.String(),
                        BeginTag = c.String(),
                        EndTag = c.String(),
                        RequireClosingTag = c.Boolean(nullable: false),
                        AutoRenderContent = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.BBCodeID);
            
            CreateTable(
                "dbo.Emails",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        From = c.String(),
                        To = c.String(),
                        Subject = c.String(),
                        Body = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.RuleAnswers",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Question = c.String(),
                        Answer = c.String(),
                        IsEligible = c.Boolean(nullable: false),
                        SessionID = c.String(),
                        UserHostAddress = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.WorkEntries",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UserName = c.String(),
                        Hours = c.Double(nullable: false),
                        Logged = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Posts", "QuestionId", "dbo.Questions");
            DropForeignKey("dbo.Questions", "CountyId", "dbo.Counties");
            DropForeignKey("dbo.Subscriptions", "CategoryId", "dbo.Categories");
            DropForeignKey("dbo.Questions", "CategoryId", "dbo.Categories");
            DropForeignKey("dbo.Questions", "CaseCountyId", "dbo.Counties");
            DropForeignKey("dbo.Audits", "QuestionId", "dbo.Questions");
            DropIndex("dbo.Posts", new[] { "QuestionId" });
            DropIndex("dbo.Questions", new[] { "CountyId" });
            DropIndex("dbo.Subscriptions", new[] { "CategoryId" });
            DropIndex("dbo.Questions", new[] { "CategoryId" });
            DropIndex("dbo.Questions", new[] { "CaseCountyId" });
            DropIndex("dbo.Audits", new[] { "QuestionId" });
            DropTable("dbo.WorkEntries");
            DropTable("dbo.RuleAnswers");
            DropTable("dbo.Emails");
            DropTable("dbo.BBCodeItems");
            DropTable("dbo.Posts");
            DropTable("dbo.Subscriptions");
            DropTable("dbo.Categories");
            DropTable("dbo.Counties");
            DropTable("dbo.Questions");
            DropTable("dbo.Audits");
        }
    }
}
