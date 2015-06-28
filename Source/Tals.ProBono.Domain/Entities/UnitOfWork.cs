using System;

namespace Tals.ProBono.Domain.Entities
{
    public class UnitOfWork : IDisposable, IUnitOfWork
    {
        readonly AdviceContext _context = new AdviceContext();
        bool _disposed = false;

        private GenericRepository<Question> _questionRepository;
        private GenericRepository<County> _countyRepository;
        private GenericRepository<ReferralOrganization> _referralorganizationRepository;
        private GenericRepository<Post> _postRepository;
        private GenericRepository<BBCodeItem> _bbCodeRepository;
        private GenericRepository<Audit> _auditRepository;
        private GenericRepository<RuleAnswer> _ruleAnswerRepository;
        private GenericRepository<Category> _categoryRepository;
        private GenericRepository<Subscription> _subscriptionRepository;
        private GenericRepository<WorkEntry> _workEntryRepository;
        private GenericRepository<FedPovertySetting> _fedPovertySettingRepository;
        private GenericRepository<Page> _pageRepository;

        public GenericRepository<Question> QuestionRepository
        {
            get { return _questionRepository ?? (_questionRepository = new GenericRepository<Question>(_context)); }
        } 

        public GenericRepository<County> CountyRepository
        {
            get { return _countyRepository ?? (_countyRepository = new GenericRepository<County>(_context)); }
        }

        public GenericRepository<ReferralOrganization> ReferralOrganizationRepository
        {
            get { return _referralorganizationRepository ?? (_referralorganizationRepository = new GenericRepository<ReferralOrganization>(_context)); }
        }

        public GenericRepository<Post> PostRepository
        {
            get { return _postRepository ?? (_postRepository = new GenericRepository<Post>(_context)); }
        }

        public GenericRepository<BBCodeItem> BbCodeRepository
        {
            get { return _bbCodeRepository ?? (_bbCodeRepository = new GenericRepository<BBCodeItem>(_context)); }
        }

        public GenericRepository<Audit> AuditRepository
        {
            get { return _auditRepository ?? (_auditRepository = new GenericRepository<Audit>(_context)); }
        }

        public GenericRepository<RuleAnswer> RuleAnswerRepository
        {
            get { return _ruleAnswerRepository ?? (_ruleAnswerRepository = new GenericRepository<RuleAnswer>(_context)); }
        }

        public GenericRepository<Category> CategoryRepository
        {
            get { return _categoryRepository ?? (_categoryRepository = new GenericRepository<Category>(_context)); }
        }

        public GenericRepository<Subscription> SubscriptionRepository
        {
            get { return _subscriptionRepository ?? (_subscriptionRepository = new GenericRepository<Subscription>(_context)); }
        }

        public GenericRepository<WorkEntry> WorkEntryRepository
        {
            get { return _workEntryRepository ?? (_workEntryRepository = new GenericRepository<WorkEntry>(_context)); }
        }

        public GenericRepository<FedPovertySetting> FedPovertySettingRepository
        {
            get { return _fedPovertySettingRepository ?? (_fedPovertySettingRepository = new GenericRepository<FedPovertySetting>(_context)); }
        }

        public GenericRepository<Page> PageRepository
        {
            get { return _pageRepository ?? (_pageRepository = new GenericRepository<Page>(_context)); }
        }

        public void Save()
        {
            _context.SaveChanges();
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!this._disposed)
            {
                if (disposing)
                {
                    _context.Dispose();
                }
            }
            this._disposed = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}
