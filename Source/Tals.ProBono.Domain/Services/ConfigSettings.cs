using System.Configuration;

namespace Tals.ProBono.Domain.Services
{
    public static class ConfigSettings
    {
        public static string TemplatePath
        {
            get { return ConfigurationManager.AppSettings["TemplatePath"]; }
        }

        public static string SiteUrl
        {
            get { return ConfigurationManager.AppSettings["SiteUrl"]; }
        }

        public static string SiteEmail
        {
            get { return ConfigurationManager.AppSettings["SiteEmail"]; }
        }

        public static string AdminUserName { get { return "talsadmin"; }}
    }
}