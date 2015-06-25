using System.Linq;
using System.Web.Mvc;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Infrastructure;

namespace Tals.ProBono.Web.Controllers
{
    [Authorize(Roles=UserRoles.Administrators)]
    [DynamicMasterPageFilter]
    public class FPSettingsController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;

        public FPSettingsController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public ActionResult Edit()
        {
            var model = _unitOfWork.FedPovertySettingRepository.Get().FirstOrDefault();
            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(FedPovertySetting settings)
        {
            if(ModelState.IsValid)
            {
                _unitOfWork.FedPovertySettingRepository.Update(settings); 

                _unitOfWork.Save();
                return RedirectToAction("Edit");
            }

            return View(settings);
        }
    }
}
