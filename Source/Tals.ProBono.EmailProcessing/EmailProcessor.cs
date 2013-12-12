using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using Tals.ProBono.Domain.Abstract;
using Tals.ProBono.Domain.Concrete;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Filters;
using Tals.ProBono.Domain.Services;

namespace Tals.ProBono.EmailProcessing
{
    public class EmailProcessor
    {
        private readonly IEmailService _emailService;
        private readonly IQuestionRepository _repository;

        public EmailProcessor(IEmailService emailService, IQuestionRepository repository)
        {
            _emailService = emailService;
            _repository = repository;
        }

        public void Over25Days()
        {
            var twentyFiveDaysAgo = DateTime.Now.AddDays(-25);
            var questions = _repository.Questions.NotTaken().Active().Where(x => x.CreatedDate < twentyFiveDaysAgo);
            var categories = questions.Select(x => x.Category).Distinct();

            if (questions.Count() > 0)
                _emailService.SendEmailTo(ConfigSettings.SiteEmail,
                                          new GenericEmailAssembler("Over25DaysAdminEmail", questions));

            foreach (var category in categories)
            {
                var subscriptions = category.Subscriptions;
                foreach (var subscription in subscriptions)
                    _emailService.SendEmailTo(subscription.Email,
                                              new Over25DaysEmailAssembler(category.CategoryName, "Over25DaysEmail",
                                                                        questions.Where(x => x.CategoryId == category.Id)));
            }
        }

        public void OverThreeDays()
        {
            var threeDaysAgo = DateTime.Now.AddDays(-3);
            var questions = _repository.Questions.Taken().Active().Where(x => x.TakenDate < threeDaysAgo);

            if (questions.Count() > 0)
            {
                _emailService.SendEmailTo(ConfigSettings.SiteEmail, new GenericEmailAssembler("OverThreeDaysAdminEmail", questions));
            }

            var userNames = questions.Select(x => x.TakenBy).Distinct();

            foreach (var userName in userNames)
            {
                SendEmail(userName,
                          new GenericEmailAssembler("OverThreeDaysEmail", questions.Where(x => x.TakenBy == userName)));
            }

            MoveBackToQueue(questions);
        }

        private void MoveBackToQueue(IEnumerable<Question> questions)
        {
            foreach(var question in questions)
            {
                question.UnTake();
            }
            _repository.SaveChanges();
        }

        public void OverTwoDays()
        {
            var twoDaysAgo = DateTime.Now.AddDays(-2);
            var threeDaysAgo = DateTime.Now.AddDays(-3);
            var questions =
                _repository.Questions.Taken().Active().Where(x => x.TakenDate < twoDaysAgo && x.TakenDate > threeDaysAgo);

            var users = questions.Select(x => x.TakenBy).Distinct();

            foreach (var user in users)
            {
                SendEmail(user, new GenericEmailAssembler("OverTwoDaysEmail", questions.Where(x => x.TakenBy == user)));
            }
        }

        private void SendEmail(string userName, GenericEmailAssembler genericEmailAssembler)
        {
            try
            {
                var user = Membership.GetUser(userName);
                _emailService.SendEmailTo(user.Email, genericEmailAssembler);
            }
            catch (Exception)
            {
            }
        }
    }
}
