using System;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Web.Infrastructure {
    public class Auditor : IAuditor {
        readonly IUnitOfWork _unitOfWork;

        public Auditor(IUnitOfWork unitOfWork) {
            _unitOfWork = unitOfWork;
        }

        public void Audit(string username, int id) {
            var entity = new Audit {UserName = username, QuestionId = id, AuditType = "Read", AuditDate = DateTime.Now};
            _unitOfWork.AuditRepository.Insert(entity);
            _unitOfWork.Save();
        }
    }
}