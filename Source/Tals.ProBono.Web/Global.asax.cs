using System;
using System.Globalization;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Tals.ProBono.Domain.Entities;
using Tals.ProBono.Web.Infrastructure;
using Tals.ProBono.Web.Models;

namespace Tals.ProBono.Web
{
    public class MvcApplication : HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.IgnoreRoute("{*favicon}", new { favicon = @"(.*/)?favicon.ico(/.*)?" });
            routes.IgnoreRoute("{*robots}", new {robots = @"(.*/)?robots.txt(/.*)?"});
            routes.IgnoreRoute("Scripts");
            routes.IgnoreRoute("{*php}", new { php = @"(.*/)?wp-login.php(/.*)?" });

            // Urgent Questions with Paging
            routes.MapRoute(null, "Attorney/Urgent",
                            new {controller = "Attorney", action = "Urgent", page = 1});

            routes.MapRoute(null, "Attorney/Urgent/Page{page}",
                            new {controller = "Attorney", action = "Urgent"},
                            new { page = @"\d+" });


            // My Taken Questions with Paging
            routes.MapRoute(null, "Attorney/My Taken Questions",
                            new {controller = "Attorney", action = "MyTaken", page = 1});

            routes.MapRoute(null, "Attorney/My Taken Questions/Page{page}",
                            new { controller = "Attorney", action = "MyTaken" },
                            new {page = @"\d+"});


            // Profile
            routes.MapRoute(null, "User/",
                            new {controller = "User", action = "Profile", userName = (string) null});
            routes.MapRoute(null, "User/EditAttorneyProfile",
                            new {controller = "User", action = "EditProfile", userName = (string) null});
            routes.MapRoute(null, "User/EditAttorneyProfile/{userName}",
                            new {controller = "User", action = "EditAttorneyProfile"});
            routes.MapRoute(null, "User/EditAccountInfo",
                            new {controller = "User", action = "EditAccountInfo", userName = (string) null});
            routes.MapRoute(null, "User/EditAccountInfo/{userName}",
                            new {controller = "User", action = "EditAccountInfo"});
            routes.MapRoute(null, "User/{userName}",
                            new {controller = "User", action = "Profile"});

            routes.MapRoute(null, "QuestionHistory/",
                new { controller = "User", action = "QuestionHistory", userName = (string)null, page = 1 });
            routes.MapRoute(null, "QuestionHistory/{userName}",
                            new { controller = "User", action = "QuestionHistory", page = 1 });
            routes.MapRoute(null, "QuestionHistory/{userName}/Page{page}",
                            new { controller = "User", action = "QuestionHistory" },
                            new { page = @"\d+" });

            // Queued questions with paging and categories
            routes.MapRoute(null, "Attorney", // matches the Attorney controller
                            new {controller = "Attorney", action = "List", category = (string) null, page = 1}
                );
            routes.MapRoute(null, "Attorney/List/Page{page}",
                new { controller = "Attorney", action = "List", category = (string) null},
                new { page = @"\d+"}
                );
            routes.MapRoute(null, "Attorney/List/{category}",
                new { controller = "Attorney", action = "List", page = 1}
                );
            routes.MapRoute(null, "Attorney/List/{category}/Page{page}",
                new { controller = "Attorney", action = "List"},
                new { page = @"\d+" }
                );


            // Admin list of questions with paging, categories, status, and taken status
            routes.MapRoute(null, "Admin",
                            new {controller = "Admin", action = "List", page = 1});
            routes.MapRoute(null, "Admin/Page{page}",
                            new {controller = "Admin", action = "List"},
                            new {page = @"\d+"});

            routes.MapRoute(
                "Questions", // Route name
                "Client/{action}/{id}", // URL with parameters
                new { controller = "Client", action = "Questions", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );
        }

        protected void Application_Start() {
            AreaRegistration.RegisterAllAreas();
            RegisterRoutes(RouteTable.Routes);
            ControllerBuilder.Current.SetControllerFactory(new NinjectControllerFactory());
            ModelBinders.Binders.Add(typeof (ReturnUrl), new ReturnUrlModelBinder());
            MembershipConfig.Config();
        }

        protected void Application_AcquireRequestState(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["_culture"] ??
                                new HttpCookie("_culture") { HttpOnly = false, Value = "en", Expires = DateTime.Now.AddYears(1) };
            Response.Cookies.Add(cookie);

            var lang = cookie.Value;
            var ci = new CultureInfo(lang);
            System.Threading.Thread.CurrentThread.CurrentUICulture = ci;
            System.Threading.Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(ci.Name);
        }

        //void ErrorLog_Filtering(object sender, ExceptionFilterEventArgs args)
        //{
        //    var message = args.Exception.Message;
        //    if (args.Exception.GetType().Name == "InvalidOperation")
        //    {
        //        if (message.Contains("robots.txt") ||
        //            message.Contains("favicon") ||
        //            message.Contains("wp-login.php") ||
        //            message.Contains("Scripts"))
        //        {
        //            args.Dismiss();
        //        }
        //    }
        //}
    }
}