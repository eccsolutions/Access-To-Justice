using Tals.ProBono.Domain.Abstract;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Web.Infrastructure {
    public class Auditor : IAuditor {
        readonly IRepository<Audit> _repository;

        public Auditor(IRepository<Audit> repository) {
            _repository = repository;
        }

        public void Audit(string username, int id) {
            var entity = new Audit {UserName = username, QuestionId = id, AuditType = "Read"};
            _repository.Add(entity);
        }
    }
}