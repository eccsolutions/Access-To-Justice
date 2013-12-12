using System.Collections.Generic;
using System.Web.Mvc;
using Tals.ProBono.Domain.Entities;
using System.Linq;
using Tals.ProBono.Domain.Services;

namespace Tals.ProBono.Web.Models
{
    public class EditViewModel
    {
        public int QuestionId { get; set; }
        public string AssignedTo { get; set; }
        public int CategoryId { get; set; }
        public DetailsViewModel Details { get; set; }
        public IEnumerable<SelectListItem> AssignmentList { get; set; }
        public IEnumerable<SelectListItem> CategoryList { get; set; }

        public static EditViewModel CreateViewModel(Question q, IEnumerable<Category> categories, IEnumerable<string> users)
        {
            var model = new EditViewModel();

            model.Details = DetailsViewModel.CreateViewModel(q);
            model.AssignedTo = q.TakenBy;
            model.CategoryId = q.CategoryId.GetValueOrDefault();
            model.QuestionId = q.Id;

            model.CategoryList = categories.Select(c => new SelectListItem
                                       {
                                           Selected = false,
                                           Text = c.CategoryName,
                                           Value = c.Id.ToString()
                                       });

            model.AssignmentList = users.Select(u => new SelectListItem {Selected = false, Text = u, Value = u});

            return model;
        }
    }
}