using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;

namespace Tals.ProBono.Domain.Entities
{
    public class AdviceContext : DbContext
    {
        public AdviceContext() : base("name=LegalAdviceContainer") { }
        public DbSet<Question> Questions { get; set; }
        public DbSet<Post> Posts { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<County> Counties { get; set; }
        public DbSet<WorkEntry> WorkEntries { get; set; }
        public DbSet<Subscription> Subscriptions { get; set; }
        public DbSet<Email> Emails { get; set; }
        public DbSet<RuleAnswer> RuleAnswers { get; set; }
        public DbSet<BBCodeItem> BBCodeItems { get; set; }
        public DbSet<Audit> Audits { get; set; }
    }
}
