using System.Linq;
using System.Web.Mvc;
using Tals.ProBono.Domain.Abstract;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Infrastructure;

namespace Tals.ProBono.Web.Controllers
{
    [Authorize(Roles=UserRoles.Administrators)]
    [DynamicMasterPageFilter]
    public class CategoryController : Controller
    {
        private readonly IQuestionRepository _questionRepository;

        public CategoryController(IQuestionRepository questionRepository)
        {
            _questionRepository = questionRepository;
        }

        //
        // GET: /Category/

        public ActionResult List()
        {
            var model = _questionRepository.Categories;
            return View(model);
        }

        public ActionResult Edit(int id = 0)
        {
            if(id == 0)
                return View(new Category());

            var model = _questionRepository.Categories.FirstOrDefault(c => c.Id == id);

            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(Category category)
        {
            if(ModelState.IsValid)
            {
                _questionRepository.SaveCategory(category);
                return RedirectToAction("List");
            }

            return View(category);
        }
    }
}
