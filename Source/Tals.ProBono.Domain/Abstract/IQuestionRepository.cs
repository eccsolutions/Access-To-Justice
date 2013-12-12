using System.Collections.Generic;
using System.Linq;
using Tals.ProBono.Domain.Entities;
using Category = Tals.ProBono.Domain.Entities.Category;
using Post = Tals.ProBono.Domain.Entities.Post;
using Question = Tals.ProBono.Domain.Entities.Question;

namespace Tals.ProBono.Domain.Abstract
{
    public interface IQuestionRepository
    {
        IQueryable<Question> Questions { get; }
        IQueryable<RuleAnswer> RuleAnswers { get; }
        IQueryable<Category> Categories { get; }
        IQueryable<WorkEntry> WorkEntries { get; }
        IQueryable<County> Counties { get; }
        void SaveChanges();
        void SaveQuestion(Question question);
        void DeleteDataFor(IEnumerable<string> usersToDelete);
        void SaveCategory(Category category);
    }
}