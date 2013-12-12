using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using FakeItEasy;
using Machine.Specifications;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Infrastructure;

namespace Tals.ProBono.Web.Specs
{
    public class DynamicMasterPageFilterSpecs
    {
        public class when_an_attorney_visits_a_page : ScenarioObjects {
            Establish context = () => A.CallTo(() => RolesFake.IsUserInRole(UserRoles.Attorney)).Returns(true);
            Because of = () => filter.OnActionExecuted(FilterContextFake);
            It should_display_attorney_masterpage = () => ((ViewResult)FilterContextFake.Result).MasterName.ShouldEqual("Attorney");
        }

        public class when_a_client_visits_a_page : ScenarioObjects
        {
            Establish context = () => A.CallTo(() => RolesFake.IsUserInRole(UserRoles.BasicUser)).Returns(true);
            Because of = () => filter.OnActionExecuted(FilterContextFake);
            It should_display_client_masterpage = () => ((ViewResult)FilterContextFake.Result).MasterName.ShouldEqual("Client");
        }

        public class when_an_administrator_visits_a_page : ScenarioObjects
        {
            Establish context = () => A.CallTo(() => RolesFake.IsUserInRole(UserRoles.Administrators)).Returns(true);
            Because of = () => filter.OnActionExecuted(FilterContextFake);
            It should_display_client_masterpage = () => ((ViewResult)FilterContextFake.Result).MasterName.ShouldEqual("Admin");
        }

        public class when_a_guest_visits_a_page : ScenarioObjects
        {
            Because of = () => filter.OnActionExecuted(FilterContextFake);
            It should_display_guest_masterpage = () => ((ViewResult)FilterContextFake.Result).MasterName.ShouldEqual("Guest");
        }

        public class when_the_view_is_not_a_view_result : ScenarioObjects
        {
            Establish context = () => {
                A.CallTo(() => RolesFake.IsUserInRole(A<string>.Ignored)).Returns(true);
                A.CallTo(() => FilterContextFake.IsChildAction).Returns(true);
            };
            Because of = () => filter.OnActionExecuted(FilterContextFake);
            It should_not_set_the_masterpage = () => ((ViewResult)FilterContextFake.Result).MasterName.ShouldEqual(String.Empty);
        }
    }
}
