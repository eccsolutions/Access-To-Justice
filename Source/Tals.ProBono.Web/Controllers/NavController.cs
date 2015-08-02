using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Filters;
using Tals.ProBono.Web.Infrastructure;
using Tals.ProBono.Web.Models;

namespace Tals.ProBono.Web.Controllers
{
    public class NavController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;
        public NavController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public ViewResult QuestionMenu()
        {
            var currentAction = ControllerContext.ParentActionViewContext.RouteData.GetRequiredString("action");

            Func<string, string, string, int, NavLink> makeLink = (text, actionName, controller, count) => new NavLink
                                                           {
                                                               Text = text,
                                                               Count = count.ToString(),
                                                               RouteValues = new RouteValueDictionary(
                                                                   new
                                                                       {
                                                                           controller = controller ?? "Attorney",
                                                                           action = actionName
                                                                       }
                                                                   ),
                                                               IsSelected = (currentAction == actionName)
                                                           };
            var navLinks = new List<NavLink>
                               {
                                   makeLink("Queue", "List", null, _unitOfWork.QuestionRepository.Get().Active().NotTaken().Count()),
                                   makeLink("Taken", "MyTaken", null, _unitOfWork.QuestionRepository.Get().Active().WithTakenBy(UserModel.Current.UserName).Count()),
                                   makeLink("Urgent", "Urgent", null, _unitOfWork.QuestionRepository.Get().Active().NotTaken().Urgent().Count()),
                                   //makeLink("Drafts (Coming Soon...)", "Drafts", null, 0)
                               };

            return View("Menu", navLinks);
        }

        public ViewResult RolesMenu(string role)
        {
            Func<string, NavLink> makeLink = roleName => new NavLink
                                                             {
                                                                 Text = roleName ?? "All Users",
                                                                 RouteValues =
                                                                     new RouteValueDictionary(
                                                                     new
                                                                         {
                                                                             controller = "Admin",
                                                                             action = "AccountList",
                                                                             role = roleName,
                                                                             page = 1
                                                                         }),
                                                                 IsSelected = (roleName == role)
                                                             };

            var navLinks = new List<NavLink> {makeLink(null)};

            var roles = Roles.GetAllRoles();
            navLinks.AddRange(roles.Select(makeLink));

            return View("Menu", navLinks);
        }

        public ViewResult CategoryMenu(string category, string status, bool? taken)
        {
            Func<string, NavLink> makeLink = categoryName => new NavLink
            {
                Text = categoryName ?? "All Categories",
                RouteValues =
                    new RouteValueDictionary(
                    new
                    {
                        controller = "Admin",
                        action = "List",
                        category = categoryName,
                        status,
                        taken,
                        page = 1
                    }),
                IsSelected = (categoryName == category)
            };

            var navLinks = new List<NavLink> { makeLink(null) };
            var categories = _unitOfWork.CategoryRepository.Get().Select(x => x.CategoryName).ToList();
            navLinks.AddRange(categories.Select(makeLink));

            return View("Menu", navLinks);
        }

        public ViewResult StatusMenu(string category, string status, bool? taken)
        {
            Func<string, NavLink> makeLink = statusName => new NavLink
            {
                Text = statusName ?? "All Statuses",
                RouteValues =
                    new RouteValueDictionary(
                    new
                    {
                        controller = "Admin",
                        action = "List",
                        category,
                        status = statusName,
                        taken,
                        page = 1
                    }),
                IsSelected = (statusName == status)
            };

            var navLinks = new List<NavLink> { makeLink(null) };
            var statuses = new string[] {"Active", "Closed"};
            navLinks.AddRange(statuses.Select(makeLink));

            return View("Menu", navLinks);
        }

        public ViewResult TakenMenu(string category, string status, bool? taken)
        {
            Func<bool?, NavLink> makeLink = takenStatus => new NavLink
            {
                Text = takenStatus == null ? "All Statuses" : takenStatus.Value ? "Taken" : "Not Taken",
                RouteValues =
                    new RouteValueDictionary(
                    new
                    {
                        controller = "Admin",
                        action = "List",
                        category,
                        status,
                        taken = takenStatus,
                        page = 1
                    }),
                IsSelected = (takenStatus == taken)
            };

            var navLinks = new List<NavLink> {makeLink(null), makeLink(false), makeLink(true)};

            return View("Menu", navLinks);
        }

        public ActionResult ListActionButtons(Question question)
        {
            return View(question);
        }

        public ActionResult QuestionActionButtons(Question question)
        {
            return View(question);
        }

        public ActionResult PostActionsButtons(int postId, int questionId)
        {
            var question = _unitOfWork.QuestionRepository.Get().WithId(questionId);
            var post = _unitOfWork.PostRepository.Get().WithId(postId);
            return View(post);
        }
    }
}