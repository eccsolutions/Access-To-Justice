using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Objects;
using System.Data.Objects.DataClasses;
using Tals.ProBono.Domain.Abstract;
using Tals.ProBono.Domain.Entities;
using System.Linq;
using Category = Tals.ProBono.Domain.Entities.Category;
using Post = Tals.ProBono.Domain.Entities.Post;
using Question = Tals.ProBono.Domain.Entities.Question;

namespace Tals.ProBono.Domain.Concrete
{
    public class QuestionRepositorySql : IQuestionRepository
    {
        private readonly LegalAdviceContainer _container;

        public QuestionRepositorySql()
        {
            _container = new LegalAdviceContainer();
        }

        public IQueryable<Question> Questions
        {
            get { return _container.Questions; }
        }

        public IQueryable<RuleAnswer> RuleAnswers
        {
            get { return _container.RuleAnswers; }
        }

        public IQueryable<Category> Categories
        {
            get { return _container.Categories.OrderBy(c => c.SortOrder); }
        }

        public IQueryable<WorkEntry> WorkEntries
        {
            get { return _container.WorkEntries; }
        }

        public IQueryable<County> Counties
        {
            get { return _container.Counties; }
        }

        public void SaveChanges()
        {
            _container.SaveChanges();
        }

        public void SaveQuestion(Question question)
        {
            _container.Questions.AddObject(question);
            _container.SaveChanges();
        }

        public void DeleteDataFor(IEnumerable<string> usersToDelete)
        {
            var postsToDelete = _container.Posts.Where(x => usersToDelete.Contains(x.CreatedBy));
            DeletePosts(postsToDelete.ToList());

            var questionsToDelete = _container.Questions.Where(x => usersToDelete.Contains(x.CreatedBy));
            DeleteQuestions(questionsToDelete.ToList());
        }

        public void SaveCategory(Category category)
        {
            if (category.Id == 0)
                _container.Categories.AddObject(category);
            else if(category.EntityState == EntityState.Detached)
            {
                _container.Categories.Attach(category);
                _container.ObjectStateManager.GetObjectStateEntry(category).SetModified();
                _container.Refresh(RefreshMode.ClientWins, category);
            }

            _container.SaveChanges();
        }


        /*
            else if(productsTable.GetOriginalEntityState(product) == null)
            {
                // We're updating an existing product, but it's not attached to
                // this data context, so attach it and detect the changes
                productsTable.Attach(product);
                productsTable.Context.Refresh(RefreshMode.KeepCurrentValues, product);
            }

            productsTable.Context.SubmitChanges();
         */

        private void DeleteQuestions(IList<Question> questionsToDelete)
        {

            int count = questionsToDelete.Count();
            for (int i = 0; i < count; i++)
            {
                DeletePosts(questionsToDelete[i].Responses.ToList());
                _container.DeleteObject(questionsToDelete[i]);
            }

            _container.SaveChanges();
        }

        private void DeletePosts(IList<Post> posts)
        {
            int count = posts.Count();
            for (int i = 0; i < count; i++)
            {
                _container.DeleteObject(posts[i]);
            }

            _container.SaveChanges();
        }
    }
}
