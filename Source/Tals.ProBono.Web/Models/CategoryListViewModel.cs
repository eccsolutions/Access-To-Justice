using System.Collections.Generic;
using System.Linq;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Filters;

namespace Tals.ProBono.Web.Models
{
    public class CategoryListViewModel
    {
        private readonly IQueryable<Category> _categories;

        public CategoryListViewModel(IQueryable<Category> categories)
        {
            _categories = categories;
        }

        public IEnumerable<CategoryViewModel> Categories
        {
            get { return _categories.ToList().Select(x => new CategoryViewModel(x)); }
        }
    }

    public class CategoryViewModel
    {
        public CategoryViewModel(Category category)
        {
            Category = category;
            LastQuestion = category.LastQuestion;
            CurrentCount = category.Questions.AsQueryable().Current().Count();
            OverdueCount = category.Questions.AsQueryable().Overdue().Count();
            UrgentCount = category.Questions.AsQueryable().Urgent().Count();
        }

        public Category Category { get; set; }
        public Question LastQuestion { get; set; }
        public int CurrentCount { get; set; }
        public int OverdueCount { get; set; }
        public int UrgentCount { get; set; }
    }
}