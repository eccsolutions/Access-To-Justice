using System.Web.Mvc;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Infrastructure;

namespace Tals.ProBono.Web.Controllers
{
    [Authorize(Roles = UserRoles.Administrators)]
    [DynamicMasterPageFilter]
    public class ReportsController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;

        public ReportsController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public ActionResult Index()
        {
            return View("Index");
        }

        public ActionResult AttorneyActivitySummary()
        {
            return View("AttorneyActivitySummary");
        }

        public ActionResult QuestionsByCategory()
        {
            return View("QuestionsByCategory");
        }
    }
}
