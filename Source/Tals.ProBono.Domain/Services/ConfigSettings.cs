using System;
using System.Configuration;
using System.Web.Hosting;

namespace Tals.ProBono.Domain.Services
{
    public static class ConfigSettings
    {
        private static string _templatePath;
        private static string _siteUrl;
        private static string _siteEmail;
        private static string _stateName;
        private static string _siteName;
        private static string _adminUserName;

        public static string TemplatePath
        {
            get { return _templatePath ?? (_templatePath = GetConfigSetting("TemplatePath")); }
        }

        public static string SiteUrl
        {
            get { return _siteUrl ?? (_siteUrl = GetConfigSetting("SiteUrl")); }
        }

        public static string SiteEmail
        {
            get { return _siteEmail ?? (_siteEmail = GetConfigSetting("SiteEmail")); }
        }

        public static string StateName
        {
            get { return _stateName ?? (_stateName = GetConfigSetting("StateName")); }
        }

        public static string SiteName
        {
            get { return _siteName ?? (_siteName = GetConfigSetting("SiteName")); }
        }

        public static string AdminUserName {
            get { return _adminUserName ?? (_adminUserName = GetConfigSetting("AdminUserName")); }
        }

        private static string GetConfigSetting(string settingName) {
            if (String.IsNullOrWhiteSpace(ConfigurationManager.AppSettings[settingName]))
            {
                throw new ConfigurationErrorsException(string.Format("Config setting [{0}] is not set or is invalid", settingName));
            }

           var settingValue = ConfigurationManager.AppSettings[settingName];

            return settingValue;
        }
    }
}