using System;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace Tals.ProBono.Domain.Entities
{
    [MetadataType(typeof(PostValidation))]
    public partial class Post
    {
        public bool IsShowAsAnswer()
        {
            return Accepted;
        }

        public void MarkAsAccepted(string userName)
        {
            Accepted = true;
            Question.Close(userName);
        }

        public void UnAccept()
        {
            if (!Accepted) return;
            Accepted = false;
        }
    }

    public class PostValidation
    {
        [AllowHtml]
        public string Body { get; set; }
    }
}