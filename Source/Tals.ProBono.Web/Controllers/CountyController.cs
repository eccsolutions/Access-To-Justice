using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tals.ProBono.Domain.Abstract;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Services;

namespace Tals.ProBono.Web.Controllers
{
    [Authorize(Roles=UserRoles.Administrators)]
    public class CountyController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;

        public CountyController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public ActionResult List()
        {
            var model = _unitOfWork.CountyRepository.Get().OrderBy(c => c.CountyName);
            return View(model);
        }

        public ActionResult Edit(int id = 0)
        {
            County model = id == 0 ? new County() : _unitOfWork.CountyRepository.Get().FirstOrDefault(c => c.Id == id);
            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(County county)
        {
            if (ModelState.IsValid)
            {
                _unitOfWork.CountyRepository.Update(county);
                return RedirectToAction("List");
            }

            return View(county);
        }
    }
}
