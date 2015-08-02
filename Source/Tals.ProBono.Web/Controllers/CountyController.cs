using System.Linq;
using System.Web.Mvc;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Services;

namespace Tals.ProBono.Web.Controllers
{
    [Authorize(Roles=UserRoles.Administrators)]
    public class CountyController : ControllerBase
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
            County model;

            if (id <= 0)
            {
                model = new County();
                ViewBag.PageTitle = "Add New County";
            }
            else
            {
                model = _unitOfWork.CountyRepository.Get().FirstOrDefault(c => c.Id == id);
                ViewBag.PageTitle = "Edit " + model.CountyName;
            }

            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(County county)
        {
            if (ModelState.IsValid)
            {
                if (county.Id == 0)
                {
                    _unitOfWork.CountyRepository.Insert(county);
                }
                else
                {
                    _unitOfWork.CountyRepository.Update(county);
                }
                
                _unitOfWork.Save();
                return RedirectToAction("List");
            }

            ViewBag.PageTitle = "Edit " + county.CountyName;

            return View(county);
        }
    }
}
