using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Web.Models
{
    public class ReplyViewModel
    {
        public ReplyViewModel(Question question)
        {
            OriginalQuestion = question;
            Reply = new Post { Subject = "Re: " + question.Subject };
        }

        public DetailsCreatedByModel CreatedBy { get; set; }
        public Question OriginalQuestion { get; private set; }
        public Post Reply { get; set; }
    }
}