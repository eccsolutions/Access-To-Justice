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

namespace Tals.ProBono.Web.Specs
{
    public class UserControllerSpecs {
        public class when_attorney_visits_client_profile {
            Establish context = () =>
            {
                var roles = A.Fake<IRoles>();
                var currentUser = A.Fake<IUser>();

                A.CallTo(() => roles.IsUserInRole(client, UserRoles.BasicUser)).Returns(true);
                A.CallTo(() => currentUser.UserName).Returns(attorney);

                controller = new UserController(A.Fake<IQuestionRepository>(), roles, currentUser)
                {ControllerContext = A.Fake<ControllerContext>()};
            };
            Because of = () => result = controller.Profile(client);

            It should_display_a_view = () => result.ShouldBeOfType<ViewResult>();
            It should_display_a_client_profile_view = () => ((ViewResult) result).ViewName.ShouldEqual("ClientProfile");

            static UserController controller;
            static ActionResult result;
            const string attorney = "attorney";
            const string client = "client";
        }

        public class when_attorney_visits_their_own_profile {
            Establish context = () => {
                var roles = A.Fake<IRoles>();
                var user = A.Fake<IUser>();

                A.CallTo(() => roles.IsUserInRole(UserRoles.Attorney)).Returns(true);
                A.CallTo(() => roles.IsUserInRole(attorney, UserRoles.Attorney)).Returns(true);

                controller = new UserController(A.Fake<IQuestionRepository>(), roles, user)
                {ControllerContext = A.Fake<ControllerContext>()};
            };

            Because of = () => result = controller.Profile(attorney);

            It should_display_an_attorney_profile_view = () => ((ViewResult) result).ViewName.ShouldEqual("AttorneyProfile");

            static ActionResult result;
            static UserController controller;
            static string attorney = "attorney";
        }
    }
}
