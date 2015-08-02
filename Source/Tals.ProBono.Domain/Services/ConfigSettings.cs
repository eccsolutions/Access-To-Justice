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
        private static int? _defaultResultsPerPage;
        private static int? _attorneyTimeoutInMinutes;
        private static int? _minimumAgeRequirement;

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

                    _templatePath = HostingEnvironment.MapPath(ConfigurationManager.AppSettings["TemplatePath"]);
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

        public static string SiteName
        {
            get
            {
                if (_siteName == null)
                {
                    if (String.IsNullOrWhiteSpace(ConfigurationManager.AppSettings["SiteName"]))
                    {
                        throw new ConfigurationErrorsException("Config setting [SiteName] is not set or is invalid");
                    }

                    _siteName = ConfigurationManager.AppSettings["SiteName"];
                }

                return _siteName;
            }
        }

        public static string AdminUserName
        {
            get
            {
                if (_adminUserName == null)
                {
                    if (String.IsNullOrWhiteSpace(ConfigurationManager.AppSettings["AdminUserName"]))
                    {
                        throw new ConfigurationErrorsException("Config setting [AdminUserName] is not set or is invalid");
                    }

                    _adminUserName = ConfigurationManager.AppSettings["AdminUserName"];
                }

                return _adminUserName;
            }
        }

        public static int DefaultResultsPerPage
        {
            get
            {
                if (_defaultResultsPerPage == null)
                {
                    int parsedInt;
                    if (Int32.TryParse(ConfigurationManager.AppSettings["DefaultResultsPerPage"], out parsedInt))
                    {
                        _defaultResultsPerPage = parsedInt;
                    }
                    else
                    {
                        _defaultResultsPerPage = 25;
                    }
                }

                return _defaultResultsPerPage.Value;
            }
        }

        public static int AttorneyTimeoutInMinutes
        {
            get
            {
                if (_attorneyTimeoutInMinutes == null)
                {
                    int parsedInt;
                    if (Int32.TryParse(ConfigurationManager.AppSettings["AttorneyTimeoutInMinutes"], out parsedInt))
                    {
                        _attorneyTimeoutInMinutes = parsedInt;
                    }
                    else
                    {
                        _attorneyTimeoutInMinutes = 30;
                    }
                }

                return _attorneyTimeoutInMinutes.Value;
            }
        }

        public static int MinimumAgeRequirement
        {
            get
            {
                if (_minimumAgeRequirement == null)
                {
                    int parsedInt;
                    if (Int32.TryParse(ConfigurationManager.AppSettings["MinimumAgeRequirement"], out parsedInt))
                    {
                        _minimumAgeRequirement = parsedInt;
                    }
                    else
                    {
                        _minimumAgeRequirement = 18;
                    }
                }

                return _minimumAgeRequirement.Value;
            }
        }
    }
}