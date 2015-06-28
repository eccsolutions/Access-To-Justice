using System;
using System.Linq;
using System.Web.Mvc;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Infrastructure;
using Tals.ProBono.Web.Models.Shared;

namespace Tals.ProBono.Web.Controllers
{
    [DynamicMasterPageFilter]
    public class PagesController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;

        public PagesController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public ActionResult Index(int id)
        {
            var model = _unitOfWork.PageRepository.Get().SingleOrDefault(x => x.Id == id);

            return View("Index", model);
        }

        [Authorize(Roles = UserRoles.Administrators)]
        public ActionResult Edit(int id)
        {
            var model = _unitOfWork.PageRepository.Get().SingleOrDefault(x => x.Id == id);

            if (model == null)
            {
                this.SetTempMessage(MessageDto.CreateErrorMessage("Page with id [" + id + "] was not found"));
                return RedirectToAction("Index","Settings");
            }

            this.SetViewMessage(this.GetTempMessage()); 

            return View("Edit", model);
        }

        [Authorize(Roles = UserRoles.Administrators)]
        [HttpPost]
        public ActionResult Edit(Page page)
        {
            if (ModelState.IsValid)
            {
                page.LastModifiedUserName = UserModel.Current.UserName;
                page.LastModifiedDate = DateTimeOffset.UtcNow;

                this.SetTempMessage(MessageDto.CreateSuccessMessage("Page edited successfully"));

                return RedirectToAction("Edit",new{id=page.Id});
            }
            
            return View("Edit", page);
        }
    }
}
