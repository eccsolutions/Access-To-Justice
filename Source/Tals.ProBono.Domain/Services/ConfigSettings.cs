using System.Configuration;
using System.Web;

namespace Tals.ProBono.Domain.Services
{
    public static class ConfigSettings
    {
        private static string _templatePath = null;
        
        public static string TemplatePath
        {
            get
            {
                if(_templatePath == null)
                {
                    _templatePath = VirtualPathUtility.ToAbsolute(ConfigurationManager.AppSettings["TemplatePath"]);
                }

                return _templatePath;
            }
        }

        public static string SiteUrl
        {
            get { return ConfigurationManager.AppSettings["SiteUrl"]; }
        }

        public static string SiteEmail
        {
            get { return ConfigurationManager.AppSettings["SiteEmail"]; }
        }
    }
}