using System;

namespace Tals.ProBono.Domain.Entities
{
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
}