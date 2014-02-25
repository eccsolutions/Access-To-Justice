using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.ServiceModel;
using System.Web.Mvc;

namespace Tals.ProBono.Domain.Entities
{
    [MetadataType(typeof(QuestionValidation))]
    public partial class Question
    {
        public Question()
        {
        }

        public Question(string subject, string body)
        {
            this.Subject = subject;
            this.Body = body;
        }

        public DateTime? LastUpdated
        {
            get
            {
                if (this.Posts != null && this.Posts.Count > 0)
                    return Posts.Select(p => p.CreatedDate).Max();
                return null;
            }
        }

        public IQueryable<Post> Responses
        {
            get
            {
                try {
                    if (!this.Posts.IsLoaded)
                        this.Posts.Load();
                    return this.Posts.AsQueryable();                    
                }
                catch(Exception ex) {
                }

                return new List<Post>().AsQueryable();
            }
        }

        public string CourtDateAsShortString {
            get {
                return CourtDate == null
                    ? string.Empty
                    : CourtDate.Value.ToShortDateString();
            }
        }

        public bool AllowFollowUp()
        {
            return Posts.Count(p => p.CreatedBy == CreatedBy) == 0;
        }

        public bool ViewableBy(string userName)
        {
            return string.IsNullOrEmpty(TakenBy) || TakenBy == userName;
        }

        public QuestionStatus GetUrgency()
        {
            return this.CreatedDate > DateTime.Now.AddDays(-10)
                       ? QuestionStatus.Current
                       : (this.CreatedDate < DateTime.Now.AddDays(-25) ? QuestionStatus.Urgent : QuestionStatus.Overdue);
        }

        public bool IsTaken()
        {
            return !string.IsNullOrEmpty(TakenBy) && TakenDate != null;
        }

        public bool IsClosed()
        {
            return !string.IsNullOrEmpty(ClosedBy) && ClosedDate != null;
        }

        public string GetCurrentStatus()
        {
            return IsClosed() ? "Closed" : (IsTaken() ? "Taken" : "In Queue");
        }

        public DateTime GetCurrentStatusDate()
        {
            return IsClosed() ? ClosedDate.Value : (IsTaken() ? TakenDate.Value : CreatedDate);
        }

        public void Assign(string assignedTo)
        {
            if (TakenBy == assignedTo) return;

            TakenDate = string.IsNullOrEmpty(assignedTo) ? null : (DateTime?)DateTime.Now;
            TakenBy = assignedTo;
        }

        public void Open()
        {
            this.ClosedDate = null;
            this.ClosedBy = null;
            foreach (var post in Posts)
                post.UnAccept();
        }

        public bool IsOwner(string userName)
        {
            return !string.IsNullOrEmpty(CreatedBy) && CreatedBy.ToLower() == userName.ToLower();
        }

        public bool IsTaker(string userName)
        {
            return !string.IsNullOrEmpty(TakenBy) && TakenBy.ToLower() == userName.ToLower();
        }

        public void MarkAsAnswer(int id, string userName)
        {
            var post = Posts.First(x => x.Id == id);
            post.MarkAsAccepted(userName);
        }

        public void Close(string userName)
        {
            this.ClosedBy = userName;
            this.ClosedDate = DateTime.Now;
        }

        public void Take(string userName)
        {
            if (!string.IsNullOrEmpty(this.TakenBy))
                throw new ActionNotSupportedException("This item has already been taken");

            this.TakenBy = userName;
            this.TakenDate = DateTime.Now;
        }

        public void UnTake()
        {
            if(string.IsNullOrEmpty(this.TakenBy))
                throw new ActionNotSupportedException("This item has not yet been taken");

            this.TakenBy = null;
            this.TakenDate = null;
        }

        public void AddReply(Post reply)
        {
            this.Posts.Add(reply);
        }

        public bool IsUnread(string userName) {
            var audit = Audits.LastOrDefault(x => x.UserName == userName);
            
            return audit == null || Posts.Any(x => x.CreatedDate > audit.AuditDate);
        }
    }


    public class QuestionValidation
    {
        [HiddenInput(DisplayValue = false)]
        public int Id { get; set; }

        [Required(ErrorMessage = "Subject is required!")]
        [StringLength(100, ErrorMessage = "Subject may not be longer than 100 characters")]
        [DisplayName("What is your question about?")]
        public string Subject { get; set; }

        [Required(ErrorMessage = "Question is required")]
        [StringLength(8000, ErrorMessage = "Question may not be longer than 8000 characters")]
        [DisplayName("Type your question here:")]
        public string Body { get; set; }

        [HiddenInput(DisplayValue = false)]
        public string CreatedBy { get; set; }

        [DisplayName("Kind of problem")]
        [Required(ErrorMessage = "Kind of problem is required.")]
        public int CategoryId { get; set; }

        [DisplayName("If you have a court date, enter it here")]
        public DateTime? CourtDate { get; set; }

        public DateTime LastUpdated { get; set; }

        public DateTime TakenDate { get; set; }

        public string County { get; set; }

        public DateTime CreatedDate { get; set; }
    }

    public enum QuestionStatus
    {
        Current,
        Overdue,
        Urgent
    }
}