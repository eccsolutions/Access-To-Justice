using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Tals.ProBono.Domain.Abstract;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Services
{
    public class SecurityService : ISecurityService
    {
        private IRoles _roles;
        public SecurityService(IRoles roles)
        {
            _roles = roles;
        }

        public string ErrorMessage { get; private set; }

        public bool HasReplyAccess(Question question, string userName)
        {
            if(question.IsClosed())
            {
                ErrorMessage = "Question is closed";
                return false;
            }
            
            if(_roles.IsUserInRole(userName, UserRoles.Administrators))
                return true;

            if(question.IsTaker(userName))
                return true;

            if (!question.IsTaker(userName))
                ErrorMessage = "The question must be taken before replying or it has already been taken by someone else";

            return false;
        }

        public bool CanMarkAsAnswer(Question question, string userName)
        {
            if(question.IsClosed())
            {
                ErrorMessage = "Question is already closed";
                return false;
            }

            if (question.IsOwner(userName) || question.IsTaker(userName) || _roles.IsUserInRole(userName, UserRoles.Administrators))
                return true;

            ErrorMessage = "You do not have access to mark this question as answered";
            return false;
        }

        public bool CanTake(Question question, string userName)
        {
            if(!question.IsTaken())
                return true;

            if(!question.IsTaker(userName))
            {
                ErrorMessage =
                    "The question you have selected has been taken by another attorney and is no longer available";

                return false;
            }

            ErrorMessage = "You have already taken this question";

            return false;
        }
    }

    public interface ISecurityService
    {
        string ErrorMessage { get; }
        bool HasReplyAccess(Question question, string userName);
        bool CanMarkAsAnswer(Question question, string userName);
        bool CanTake(Question question, string userName);
    }
}
