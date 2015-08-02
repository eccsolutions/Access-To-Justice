using System;
using System.Linq;
using System.Web.Mvc;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Infrastructure;
using Tals.ProBono.Web.Models.Shared;

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

            this.SetViewMessage(this.GetTempMessage());

            return View("Edit",model);
        }

        [HttpPost]
        public ActionResult Edit(FedPovertySetting settings)
        {
            if (!ModelState.IsValid)
            {
                return View("Edit", settings);
            }

            if (settings.ModestMeansLevel <= settings.LegalAidLevel)
            {
                ModelState.AddModelError("ModestMeansLevel","Modest Means Threshold must be greater than Legal Aid Threshold");
                return View("Edit", settings);
            }

            settings.LastModifiedByUserName = UserModel.Current.UserName;
            settings.LastModifiedDate = DateTimeOffset.UtcNow;

            _unitOfWork.FedPovertySettingRepository.Update(settings);

            _unitOfWork.Save();

            this.SetTempMessage(MessageDto.CreateSuccessMessage("Settings updated successfully"));

            return RedirectToAction("Edit");
        }
    }
}
