using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using FakeItEasy;
using Machine.Specifications;
using Tals.ProBono.Domain.Abstract;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Controllers;
using Tals.ProBono.Web.Infrastructure;
using Tals.ProBono.Web.Models;

namespace Tals.ProBono.Web.Specs
{
    public class AccountControllerSpecs
    {
        public class when_user_provides_incorrect_password_question_and_answer {
            Establish context = () => {
                var membership = A.Fake<IMembershipService>();

                A.CallTo(() => membership.ChangeQuestionAndAnswer(A<string>.Ignored, A<string>.Ignored, A<string>.Ignored, A<string>.Ignored)).Returns(false);

                controller = new AccountController(A.Fake<IQuestionRepository>(), A.Fake<IFormsAuthenticationService>(), membership, A.Fake<IEmailService>(), A.Fake<IUser>());
                model = new QuestionAndAnswerModel();
            };

            Because of = () => result = controller.QuestionAndAnswer(model) as ViewResult;

            It should_display_incorrect_password_error = () => result.ViewName.ShouldEqual(string.Empty);

            static ViewResult result;
            static AccountController controller;
            static QuestionAndAnswerModel model;
        }
    }
}
