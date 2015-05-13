using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text.RegularExpressions;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Services
{
    public interface IEmailAssembler
    {
        string TemplatePath { get; }
        Dictionary<string, string> Properties { get; set; }
    }

    public interface IEmailService
    {
        void SendEmailTo(string emailAddress, IEmailAssembler assembler);
        void SendEmailFor(Category category, IEmailAssembler assembler);
    }

    public class EmailService : IEmailService
    {
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
                using (var smtpClient = new SmtpClient())
                using (var mailMessage = BuildMailMessage(email, assembler))
                {
                    smtpClient.Send(mailMessage);
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
            var path = assembler.TemplatePath;
            TextReader tr = new StreamReader(path);

            var text = tr.ReadToEnd();

            tr.Close();

            return ReplaceVariables(text, assembler.Properties);
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

        public string TemplatePath { get; protected set; }
        public Dictionary<string, string> Properties { get; set; }

        protected string GetTemplatePath(string templateName)
        {
            var path = ConfigSettings.TemplatePath;

            if(!Directory.Exists(path))
                throw new ArgumentException("The email template path has not been set correctly in the configuration file.");

            path = path.EndsWith("\\") ? path : path + "\\";
            var filePath = path + templateName + ".htm";

            if(!File.Exists(filePath))
                throw new ArgumentException(string.Format("The email template {0} is missing from the template path.",
                                                          templateName));

            return filePath;
        }

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
            TemplatePath = GetTemplatePath("ClientRegistration");
        }
    }

    public class LawyerRegistrationEmail : EmailAssembler
    {
        public LawyerRegistrationEmail(string userName, string password)
        {
            AddProperty("UserName", userName);
            AddProperty("Password", password);
            TemplatePath = GetTemplatePath("LawyerRegistration");
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

            TemplatePath = GetTemplatePath("Subscribed");
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

            TemplatePath = GetTemplatePath("Subscription");
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

            TemplatePath = GetTemplatePath("ClientReply");
        }
    }

    public class StandardEmail : EmailAssembler
    {
        public StandardEmail(EmailTemplate template)
        {
            TemplatePath = GetTemplatePath(Enum.GetName(typeof (EmailTemplate), template));
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