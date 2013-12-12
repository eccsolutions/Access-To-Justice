using System.Collections.Generic;
using System.Linq;
using FakeItEasy;
using Machine.Specifications;
using Tals.ProBono.Domain.Concrete;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Controllers;
using Tals.ProBono.Web.Infrastructure;

namespace Tals.ProBono.Web.Specs
{
    public class AttorneyControllerSpecs
    {
        public class when_a_user_views_a_question : ScenarioObjects
        {
            Establish context = () => {
                A.CallTo(() => RepositoryFactoryFake.Questions.Get()).Returns(Questions);
                A.CallTo(() => UserFake.UserName).Returns(username);
            };
            Because of = () => AttorneyController.Details(questionId);
            It should_record_that_the_user_read_the_question = () => A.CallTo(() => AuditorFake.Audit(username, questionId)).MustHaveHappened();
        }
    }
}
