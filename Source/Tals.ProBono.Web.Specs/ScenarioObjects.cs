using System.Collections.Generic;
using System.Data.Objects.DataClasses;
using System.Linq;
using System.Web.Mvc;
using FakeItEasy;
using Machine.Specifications;
using Tals.ProBono.Domain.Abstract;
using Tals.ProBono.Domain.Concrete;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Controllers;
using Tals.ProBono.Web.Infrastructure;

namespace Tals.ProBono.Web.Specs {
    public class ScenarioObjects : Tals.Common.Testing.ScenarioObjects {
        protected const string username = "userName";
        protected const int questionId = 1;

        Establish context =
            () => EstablishContext(AssignFakes, AssignDeliberateValues, AssignArbitraryValues, AssignSystemsUnderTest);

        protected static IRoles RolesFake;
        protected static ActionExecutedContext FilterContextFake;
        protected static ControllerContext ControllerContextFake;
        protected static ViewResult ViewResultFake;
        protected static DynamicMasterPageFilter filter;
        protected static IAuditor AuditorFake;
        protected static AttorneyController AttorneyController;
        protected static IEmailService EmailServiceFake;
        protected static ISecurityService SecurityServiceFake;
        protected static IRepositoryFactory RepositoryFactoryFake;
        protected static IUser UserFake;
        protected static IQueryable<Question> Questions;
        protected static Question Question1;

        static void AssignFakes() {
            RolesFake = A.Fake<IRoles>();
            FilterContextFake = A.Fake<ActionExecutedContext>();
            ControllerContextFake = A.Fake<ControllerContext>();
            ViewResultFake = A.Fake<ViewResult>();
            AuditorFake = A.Fake<IAuditor>();
            EmailServiceFake = A.Fake<IEmailService>();
            SecurityServiceFake = A.Fake<ISecurityService>();
            RepositoryFactoryFake = A.Fake<IRepositoryFactory>();
            UserFake = A.Fake<IUser>();
        }

        static void AssignDeliberateValues() {
            Question1 = new Question() {Id = 1};
            Questions = new List<Question>() {Question1}.AsQueryable();
        }

        static void AssignArbitraryValues() {
        }

        static void AssignSystemsUnderTest() {
            AttorneyController = new AttorneyController(EmailServiceFake, SecurityServiceFake,
                                                RepositoryFactoryFake, UserFake, AuditorFake);
        }
    }

    public class ScenarioObjects<TResultType> : ScenarioObjects
    {
        protected static TResultType Result;
    }
}