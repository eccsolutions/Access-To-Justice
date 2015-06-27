using System.Data.Entity;

namespace Tals.ProBono.Domain.Entities
{
    public class AdviceContext : DbContext
    {
        public AdviceContext() : base("AdviceContext")
        {
            this.Configuration.LazyLoadingEnabled = true;
            this.Configuration.ProxyCreationEnabled = true;
        }

        public DbSet<Question> Questions { get; set; }
        public DbSet<Post> Posts { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<ReferralOrganization> ReferralOrganizations { get; set; }
        public DbSet<County> Counties { get; set; }
        public DbSet<WorkEntry> WorkEntries { get; set; }
        public DbSet<Subscription> Subscriptions { get; set; }
        public DbSet<Email> Emails { get; set; }
        public DbSet<RuleAnswer> RuleAnswers { get; set; }
        public DbSet<BBCodeItem> BbCodeItems { get; set; }
        public DbSet<Audit> Audits { get; set; }
        public DbSet<FedPovertySetting> FedPovertySettings { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<Question>()
                        .HasRequired(x => x.County)
                        .WithMany(x => x.Questions)
                        .HasForeignKey(x => x.CountyId);

            modelBuilder.Entity<Question>()
                        .HasOptional(x => x.CaseCounty)
                        .WithMany(x => x.CaseQuestions)
                        .HasForeignKey(x => x.CaseCountyId);

            modelBuilder.Entity<FedPovertySetting>().Property(x => x.YearlyIncome).HasPrecision(18, 6);
            modelBuilder.Entity<FedPovertySetting>().Property(x => x.DependentsModifier).HasPrecision(18, 6);
            modelBuilder.Entity<FedPovertySetting>().Property(x => x.LegalAidLevel).HasPrecision(18, 6);
            modelBuilder.Entity<FedPovertySetting>().Property(x => x.ModestMeansLevel).HasPrecision(18, 6);
        }
    }
}
