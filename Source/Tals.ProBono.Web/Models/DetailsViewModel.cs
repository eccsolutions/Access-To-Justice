using System.Collections.Generic;
using System.Linq;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Filters;
using Tals.ProBono.Domain.Services;

namespace Tals.ProBono.Web.Models
{
    public class DetailsViewModel
    {
        public Question Question { get; set; }
        public IEnumerable<DetailsPostViewModel> Posts { get; set; }


        public static DetailsViewModel CreateViewModel(Question q)
        {
            var model = new DetailsViewModel
                            {
                                Question = q,
                                Posts = q.Responses.Select(DetailsPostViewModel.CreateViewModel),
                            };

            return model;
        }
    }
}