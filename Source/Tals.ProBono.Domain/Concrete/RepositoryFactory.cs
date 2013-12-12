using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Tals.ProBono.Domain.Abstract;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Concrete
{
    public class RepositoryFactory : IRepositoryFactory
    {
        private readonly IRepository<Question> _questions;
        private readonly IRepository<Category> _categories;
        private readonly IRepository<Post> _posts;
        private readonly IRepository<Audit> _audits;
        readonly IRepository<Subscription> _subscriptions;
        readonly IRepository<WorkEntry> _workEntries;

        public RepositoryFactory(
            IRepository<Question> questions,
            IRepository<Category> categories,
            IRepository<Post> posts,
            IRepository<Audit> audits, IRepository<Subscription> subscriptions, IRepository<WorkEntry> workEntries)
        {
            _questions = questions;
            _categories = categories;
            _posts = posts;
            _audits = audits;
            _subscriptions = subscriptions;
            _workEntries = workEntries;
        }

        public IRepository<Question> Questions { get { return _questions; } }
        public IRepository<Category> Categories { get { return _categories; } }
        public IRepository<Post> Posts { get { return _posts; } }
        public IRepository<Audit> Audits { get { return _audits; } }

        public IRepository<Subscription> Subscriptions {
            get { return _subscriptions; }
        }

        public IRepository<WorkEntry> WorkEntries {
            get { return _workEntries; }
        }
    }

    public interface IRepositoryFactory
    {
        IRepository<Question> Questions { get; }
        IRepository<Category> Categories { get; }
        IRepository<Post> Posts { get; }
        IRepository<Audit> Audits { get; }
        IRepository<Subscription> Subscriptions { get; }
        IRepository<WorkEntry> WorkEntries { get; } 
    }
}
