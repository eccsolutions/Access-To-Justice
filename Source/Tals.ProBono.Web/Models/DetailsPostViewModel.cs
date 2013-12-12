using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Services;

namespace Tals.ProBono.Web.Models
{
    public class DetailsPostViewModel
    {
        public int PostId { get; set; }
        public string Created { get; set; }
        public string UserName { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
        public bool IsAnswer { get; set; }
        public bool IsMarkedAsAnswer { get; set; }

        public static DetailsPostViewModel CreateViewModel(Post p)
        {
            var model = new DetailsPostViewModel
                            {
                                PostId = p.Id,
                                Created = p.CreatedDate.ToString(),
                                UserName = p.CreatedBy,
                                Subject = p.Subject,
                                Body = p.Body,
                                IsAnswer = p.Question.CreatedBy != p.CreatedBy,
                                IsMarkedAsAnswer = p.Accepted
                            };
            return model;
        }
    }
}