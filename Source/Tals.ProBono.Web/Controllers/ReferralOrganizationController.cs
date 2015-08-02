using System.Linq;
using System.Web.Mvc;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Services;

namespace Tals.ProBono.Web.Controllers
{
    [Authorize(Roles = UserRoles.Administrators)]
    public class ReferralOrganizationController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;

        public ReferralOrganizationController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public ActionResult List()
        {
            var model = _unitOfWork.ReferralOrganizationRepository.Get().OrderBy(c => c.OrgName);
            return View(model);
        }

        public ActionResult Edit(int id = 0)
        {
            ReferralOrganization model;

            if (id <= 0)
            {
                model = new ReferralOrganization();
                ViewBag.PageTitle = "Add New Organization";
            }
            else
            {
                model = _unitOfWork.ReferralOrganizationRepository.Get().FirstOrDefault(c => c.Id == id);
                ViewBag.PageTitle = "Edit " + model.OrgName;
            }
            
            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(ReferralOrganization referralOrganization)
        {
            if (ModelState.IsValid) {

                if (referralOrganization.Id == 0)
                    _unitOfWork.ReferralOrganizationRepository.Insert(referralOrganization);
                else
                    _unitOfWork.ReferralOrganizationRepository.Update(referralOrganization);

                _unitOfWork.Save();
                return RedirectToAction("List");
            }

            ViewBag.PageTitle = "Edit " + referralOrganization.OrgName;

            return View(referralOrganization);
        }
    }
}
