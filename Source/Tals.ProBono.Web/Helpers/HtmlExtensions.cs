using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using System.Web.Security;
using Ninject;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Domain.Services;
using Tals.ProBono.Web.Infrastructure;
using Tals.ProBono.Web.Models;

namespace Tals.ProBono.Web.Helpers
{
    public static class HtmlExtensions
    {
        public static MvcHtmlString DisplayProfileButton(this HtmlHelper helper, string userName)
        {
            if (Roles.IsUserInRole(userName, UserRoles.Administrators)) return MvcHtmlString.Empty;
            return helper.ActionLink("Profile", "Profile", "User", new { userName = userName }, null);
        }

        public static MvcHtmlString DisplayTakeButton(this HtmlHelper helper, Question question)
        {
            var currentUser = UserModel.Current.UserName;
            if ((question.IsTaken() && question.TakenBy == currentUser) || Roles.IsUserInRole(UserRoles.Administrators))
            {
                return helper.ActionLink("Reply", "Reply", "Attorney", new { id = question.Id }, new { @class = "ImageLink" });
            }
            else
            {
                return helper.ActionLink("Take", "Take", "Attorney", new { id = question.Id }, new { @class = "ImageLink" });
            }
        }

        public static string DisplayTimeElapsed(this HtmlHelper helper, DateTime since)
        {
            var elapsed = DateTime.Now - since;

            return elapsed.Days > 0
                      ? string.Format("{0} days, {1} hours, {2} minutes ago", elapsed.Days, elapsed.Hours,
                                      elapsed.Minutes)
                      : (elapsed.Hours > 0
                             ? string.Format("{0} hours, {1} minutes ago", elapsed.Hours, elapsed.Minutes)
                             : string.Format("{0} minutes ago", elapsed.Minutes));

        }

        public static MvcHtmlString DisplayUser(this HtmlHelper helper, string userName)
        {
            if (Roles.IsUserInRole(UserRoles.BasicUser))
            {
                if (Roles.IsUserInRole(userName, UserRoles.Attorney))
                {
                    return MvcHtmlString.Create(UserProfile.GetUserProfile(userName).FullName);
                }
                if (Roles.IsUserInRole(userName, UserRoles.Administrators)) return MvcHtmlString.Create("Moderator");
            }

            return helper.ActionLink(UserProfile.GetUserProfile(userName).FullName + " (" + userName + ")", "Profile", "User", new { userName }, null);
        }

        public static string KPI(this HtmlHelper helper, QuestionStatus status)
        {
            return status == QuestionStatus.Current ? "Green" : (status == QuestionStatus.Overdue ? "Yellow" : "Red");
        }

        public static string Stylesheet(this UrlHelper helper)
        {
            return helper.Content("~/Content/Site.css");
        }

        public static string Image(this UrlHelper helper, string fileName)
        {
            return helper.Content("~/Content/Images/{0}".FormatWith(fileName));
        }

        public static MvcHtmlString ImageLink(this HtmlHelper htmlHelper, string fileName, string altText, string actionName, string controllerName)
        {
            var image = new TagBuilder("img");
            image.Attributes.Add("src",
                                 UrlHelper.GenerateContentUrl("~/Content/Images/{0}".FormatWith(fileName),
                                                              htmlHelper.ViewContext.HttpContext));
            image.Attributes.Add("alt", altText);
            image.Attributes.Add("border", "0");

            var link = new TagBuilder("a");
            link.Attributes.Add("href", String.Format("/{0}/{1}", controllerName, actionName));

            link.InnerHtml = image.ToString();

            return MvcHtmlString.Create(link.ToString());
        }

        public static MvcHtmlString ActionMenuItem(this HtmlHelper htmlHelper, String linkText, String actionName, String controllerName, object routeValues=null, object htmlAttributes=null)
        {
            var li = new TagBuilder("li");

            if (htmlHelper.ViewContext.RequestContext.IsCurrentRoute(null, controllerName, actionName))
            {
                li.AddCssClass("selected");
            }

            var span = new TagBuilder("span");
            span.SetInnerText(linkText);
            var atag = htmlHelper.ActionLink(linkText, actionName, controllerName, routeValues, htmlAttributes).ToString();
            atag = atag.Replace(string.Format(">{0}<", linkText), string.Format(">{0}<", span.ToString()));

            li.InnerHtml = atag;

            return MvcHtmlString.Create(li.ToString());
        }

        public static SelectList ToSelectList<T>(this IEnumerable<T> enumerable, Func<T, string> text, Func<T, string> value, string defaultOption, string defaultValue, object selectedValue)
        {
            var items =
                enumerable.Where(e => value(e) != null).Select(f => new KeyValuePair<string, string>(value(f), text(f)))
                    .ToList();
            items.Insert(0, new KeyValuePair<string, string>(defaultValue, defaultOption));

            var list = new SelectList(items, "Key", "Value", selectedValue);

            return list;
        }

        public static MvcHtmlString RoleActionLink(this HtmlHelper helper, String linkText, String actionName, String controllerName, String roleName, object routeValues, object htmlAttributes)
        {
            string[] roles = roleName.Split(',');

            return roles.Where(Roles.IsUserInRole).Count() > 0 ?
                helper.ActionLink(linkText, actionName, controllerName, routeValues, htmlAttributes) :
                MvcHtmlString.Empty;
        }

        public static MvcHtmlString Encode(this HtmlHelper helper, bool encode, string value)
        {
            if (encode)
                return MvcHtmlString.Create(HttpUtility.HtmlEncode(value));

            return MvcHtmlString.Create(value);
        }

        public static MvcHtmlString RoleActionMenuLink(this HtmlHelper helper, String linkText, String actionName, String controllerName, String roleName, object routeValues=null, object htmlAttributes=null)
        {
            string[] roles = roleName.Split(',');

            return roles.Where(Roles.IsUserInRole).Count() > 0 ?
                helper.ActionMenuItem(linkText, actionName, controllerName, routeValues, htmlAttributes) :
                MvcHtmlString.Empty;
        }

        public static MvcHtmlString Spinner(this HtmlHelper helper, string id)
        {
            var builder = new TagBuilder("script");
            builder.Attributes.Add("type", "text/javascript");
            builder.InnerHtml = "$(function () {$('#" + id +
                                "').spinner({max: 24.00,min: 0.00,step: 0.25,value: 0.00});});";

            return MvcHtmlString.Create(builder.ToString());
        }

        public static MvcHtmlString Parse(this HtmlHelper helper, string text)
        {
            IKernel kernal = new StandardKernel(new LegalAdviceServices());
            var parseService = new ParseServices((IUnitOfWork)kernal.Get(typeof (IUnitOfWork)));

            return MvcHtmlString.Create(parseService.ParseBBCodeText(text));
        }

        public static MvcHtmlString PreviousPageLink(this HtmlHelper helper, string text, string className = null)
        {
            var url = helper.ViewContext.HttpContext.Request.QueryString["r"];
            if (url == null) return MvcHtmlString.Empty;

            var builder = new TagBuilder("a");
            builder.Attributes.Add("href", url);
            if(className != null) builder.Attributes.Add("class", className);
            builder.SetInnerText(text);

            return MvcHtmlString.Create(builder.ToString());
        }

        public static string AttorneyQuestionDetailsLink(this UrlHelper helper, int questionId) {
            return ConfigSettings.SiteUrl.TrimEnd('/') + helper.Action("Details", "Attorney", new { id = questionId });
        }
    }
}
