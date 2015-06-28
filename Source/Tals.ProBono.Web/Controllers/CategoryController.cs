using System.Linq;
using System.Web.Mvc;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Infrastructure;

namespace Tals.ProBono.Web.Controllers
{
    [Authorize(Roles=UserRoles.Administrators)]
    [DynamicMasterPageFilter]
    public class CategoryController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;

        public CategoryController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        //
        // GET: /Category/

        public ActionResult List()
        {
            var model = _unitOfWork.CategoryRepository.Get();
            return View(model);
        }

        public ActionResult Edit(int id = 0)
        {
            Category model;

            if (id <= 0)
            {
                model = new Category();
                ViewBag.PageTitle = "Add New Category";
            }
            else
            {
                model = _unitOfWork.CategoryRepository.Get().FirstOrDefault(c => c.Id == id);
                ViewBag.PageTitle = "Edit " + model.CategoryName;
            }

            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(Category category)
        {
            if(ModelState.IsValid)
            {
                if (category.Id == 0)
                    _unitOfWork.CategoryRepository.Insert(category);
                else
                {
                    _unitOfWork.CategoryRepository.Update(category);                    
                }

                _unitOfWork.Save();
                return RedirectToAction("List");
            }

            ViewBag.PageTitle = "Edit " + category.CategoryName;

            return View(category);
        }
    }
}
