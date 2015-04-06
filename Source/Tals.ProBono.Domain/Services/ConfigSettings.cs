using System;
using System.Configuration;
using System.Web;

namespace Tals.ProBono.Domain.Services
{
    public static class ConfigSettings
    {
        private static string _templatePath;
        private static string _siteUrl;
        private static string _siteEmail;
        private static string _stateName;
        private static string _appName;

        public static string TemplatePath
        {
            get
            {
                if(_templatePath == null)
                {
                    if (String.IsNullOrWhiteSpace(ConfigurationManager.AppSettings["TemplatePath"]))
                    {
                        throw new ConfigurationErrorsException("Config setting [TemplatePath] is not set or is invalid");
                    }

                    _templatePath = VirtualPathUtility.ToAbsolute(ConfigurationManager.AppSettings["TemplatePath"]);
                }

                return _templatePath;
            }
        }

        public static string SiteUrl
        {
            get
            {
                if (_siteUrl == null)
                {
                    if (String.IsNullOrWhiteSpace(ConfigurationManager.AppSettings["SiteUrl"]))
                    {
                        throw new ConfigurationErrorsException("Config setting [SiteUrl] is not set or is invalid");
                    }

                    _siteUrl = ConfigurationManager.AppSettings["SiteUrl"];
                }

                return _siteUrl;
            }
        }

        public static string SiteEmail
        {
            get
            {
                if (_siteEmail == null)
                {
                    if (String.IsNullOrWhiteSpace(ConfigurationManager.AppSettings["SiteEmail"]))
                    {
                        throw new ConfigurationErrorsException("Config setting [SiteEmail] is not set or is invalid");
                    }

                    _siteEmail = ConfigurationManager.AppSettings["SiteEmail"];
                }

                return _siteEmail;
            }
        }

        public static string StateName
        {
            get
            {
                if (_stateName == null)
                {
                    if (String.IsNullOrWhiteSpace(ConfigurationManager.AppSettings["StateName"]))
                    {
                        throw new ConfigurationErrorsException("Config setting [StateName] is not set or is invalid");
                    }

                    _stateName = ConfigurationManager.AppSettings["StateName"];
                }

                return _stateName;
            }
        }

        public static string AppName
        {
            get
            {
                if (_appName == null)
                {
                    if (String.IsNullOrWhiteSpace(ConfigurationManager.AppSettings["AppName"]))
                    {
                        throw new ConfigurationErrorsException("Config setting [AppName] is not set or is invalid");
                    }

                    _appName = ConfigurationManager.AppSettings["AppName"];
                }

                return _appName;
            }
        }
    }
}