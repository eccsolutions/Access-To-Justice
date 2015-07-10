using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text.RegularExpressions;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Services
{
    public interface IEmailAssembler
    {
        string TemplateName { get; }
        Dictionary<string, string> Properties { get; set; }
    }

    public interface IEmailService
    {
        void SendEmailTo(string emailAddress, IEmailAssembler assembler);
        void SendEmailFor(Category category, IEmailAssembler assembler);
    }

    public class EmailService : IEmailService
    {
        private static String _appPath;

        private static int _defaultPort = 25;
        private static string _defaultHost = "localhost";
        private static SmtpClient _smtpClient;

        public EmailService( String appPath )
        {
            _appPath = appPath;
        }
        //private readonly IUnitOfWork _unitOfWork;

        //public EmailService(IUnitOfWork unitOfWork)
        //{
        //    _unitOfWork = unitOfWork;
        //}

        public void SendEmailTo(string emailAddress, IEmailAssembler assembler)
        {
            if (!string.IsNullOrEmpty(emailAddress))
            {
                SendEmail(emailAddress, assembler);
                //_unitOfWork.Save();
            }
        }

        private static void SendEmail(string email, IEmailAssembler assembler)
        {
            try {
                using (var mailMessage = BuildMailMessage(email, assembler))
                {
                    getSmtpClient().Send(mailMessage);
                }
            }
            catch {
            }
        }

        private static MailMessage BuildMailMessage(string email, IEmailAssembler assembler)
        {
            var text = BuildMessage(assembler);
            var message = new MailMessage(ConfigSettings.SiteEmail, email, GetSubject(text), text) { IsBodyHtml = true };
            message.Bcc.Add(ConfigSettings.SiteEmail);
            return message;
        }

        public void SendEmailFor(Category category, IEmailAssembler assembler)
        {
            var subscribers = category.Subscriptions.Select(s => s.Email).ToList();

            foreach(var subscriber in subscribers)
                SendEmail(subscriber, assembler);

            //_unitOfWork.Save();
        }

        private static string GetSubject(string text)
        {
            return  Regex.Match(text, @"(?<=<title.*>)([\s\S]*)(?=</title>)").Value.Trim();
        }

        private static string ReplaceVariables(string text, Dictionary<string, string> properties)
        {
            return properties.Aggregate(text, (current, item) => current.Replace("{" + item.Key + "}", item.Value));
        }

        private static string BuildMessage(IEmailAssembler assembler)
        {
            var path = _appPath + "Content\\EmailTemplates\\" + assembler.TemplateName + ".htm";
            TextReader tr = new StreamReader(path);

            var text = tr.ReadToEnd();

            tr.Close();

            return ReplaceVariables(text, assembler.Properties);
        }

        private static SmtpClient getSmtpClient()
        {
            if (_smtpClient == null)
            {
                if (ConfigurationManager.ConnectionStrings["SmtpClient"] == null)
                {
                    throw new ConfigurationErrorsException(string.Format("SmtpClient Connection String is not set or is invalid"));
                }

                var connectionString = ConfigurationManager.ConnectionStrings["SmtpClient"].ConnectionString;

                var keyValuePairs = connectionString.Split(';')
                                                    .Where(kvp => kvp.Contains('='))
                                                    .Select(kvp => kvp.Split(new char[] { '=' }, 2))
                                                    .ToDictionary(kvp => kvp[0].Trim(),
                                                                  kvp => kvp[1].Trim(),
                                                                  StringComparer.InvariantCultureIgnoreCase);
                String host = _defaultHost;
                int port = _defaultPort;

                if (keyValuePairs.ContainsKey("host"))
                {
                    host = keyValuePairs["host"];
                }
                if (keyValuePairs.ContainsKey("port"))
                {
                    port = Convert.ToInt32( keyValuePairs["port"] );
                }

                _smtpClient = new SmtpClient(host, port);

                if (keyValuePairs.ContainsKey("user") && keyValuePairs.ContainsKey("password"))
                {
                    _smtpClient.Credentials = new System.Net.NetworkCredential(keyValuePairs["user"], keyValuePairs["password"] );
                }
            }
            return _smtpClient;
        }

    }

    public abstract class EmailAssembler : IEmailAssembler
    {
        protected EmailAssembler() {
            Properties = new Dictionary<string, string> {
                {"SiteName", ConfigSettings.SiteName},
                {"SiteEmail", ConfigSettings.SiteEmail},
                {"SiteUrl", ConfigSettings.SiteUrl}
            };
        }

        public string TemplateName { get; protected set; }
        public Dictionary<string, string> Properties { get; set; }

        protected void AddProperty(string name, string value) {
            if (Properties.ContainsKey(name)) Properties[name] = value;
            else {
                Properties.Add(name, value);
            }
        }
    }

    public class ClientRegistrationEmail : EmailAssembler
    {
        public ClientRegistrationEmail(string userName) {
            AddProperty("UserName", userName);
            TemplateName="ClientRegistration";
        }
    }

    public class LawyerRegistrationEmail : EmailAssembler
    {
        public LawyerRegistrationEmail(string userName, string password)
        {
            AddProperty("UserName", userName);
            AddProperty("Password", password);
            TemplateName="LawyerRegistration";
        }
    }

    public class SubscribeEmail : EmailAssembler
    {
        public SubscribeEmail(string categoryName, string unsubscribeUrl)
        {
            AddProperty("CategoryName", categoryName);
            AddProperty("UnsubscribeUrl", unsubscribeUrl);
            Properties = new Dictionary<string, string>
                             {
                                 {"CategoryName", categoryName},
                                 {"UnsubscribeUrl", unsubscribeUrl}
                             };

            TemplateName="Subscribed";
        }
    }

    public class SubscriptionEmail : EmailAssembler
    {
        public SubscriptionEmail(string categoryName, string courtDate, string subject, string body, string questionUrl, string unsubscribeUrl) {
            AddProperty("CategoryName", categoryName);
            AddProperty("CourtDate", courtDate);
            AddProperty("Subject", subject);
            AddProperty("Body", body);
            AddProperty("QuestionUrl", questionUrl);
            AddProperty("UnsubscribeUrl", unsubscribeUrl);

            TemplateName="Subscription";
        }
    }

    public class ClientReplyEmail : EmailAssembler {
        public ClientReplyEmail(string categoryName, string courtDate, string subject, string body, string questionUrl) {
            AddProperty("CategoryName", categoryName);
            AddProperty("CourtDate", courtDate);
            AddProperty("Subject", subject);
            AddProperty("Body", body);
            AddProperty("QuestionUrl", questionUrl);
            AddProperty("SiteName", ConfigSettings.SiteName);
            AddProperty("SiteEmail", ConfigSettings.SiteEmail);

            TemplateName="ClientReply";
        }
    }

    public class StandardEmail : EmailAssembler
    {
        public StandardEmail(EmailTemplate template)
        {
            TemplateName = Enum.GetName(typeof(EmailTemplate), template);
        }

        public enum EmailTemplate
        {
            AcceptedAnswer,
            AccountApproved,
            LawyerReply,
            QuestionAssigned
        }
    }

}