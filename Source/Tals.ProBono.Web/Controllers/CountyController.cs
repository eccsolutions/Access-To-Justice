using System.Linq;
using System.Web.Mvc;
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
            var model = id == 0 ? new County() : _unitOfWork.CountyRepository.Get().FirstOrDefault(c => c.Id == id);
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

            return View(county);
        }
    }
}
