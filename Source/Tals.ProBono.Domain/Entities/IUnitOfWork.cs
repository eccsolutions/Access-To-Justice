﻿
namespace Tals.ProBono.Domain.Entities
{
    public interface IUnitOfWork
    {
        GenericRepository<Question> QuestionRepository { get; }

        GenericRepository<County> CountyRepository { get; }

        GenericRepository<ReferralOrganization> ReferralOrganizationRepository { get; }

        GenericRepository<Post> PostRepository { get; }

        GenericRepository<BBCodeItem> BbCodeRepository { get; }

        GenericRepository<Audit> AuditRepository { get; }

        GenericRepository<RuleAnswer> RuleAnswerRepository { get; }

        GenericRepository<Category> CategoryRepository { get; }

        GenericRepository<Subscription> SubscriptionRepository { get; }

        GenericRepository<WorkEntry> WorkEntryRepository { get; }

        GenericRepository<FedPovertySetting> FedPovertySettingRepository { get; }

        GenericRepository<Page> PageRepository { get; }

        void Save();
    }
}