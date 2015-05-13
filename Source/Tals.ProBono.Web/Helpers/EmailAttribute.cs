using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Tals.ProBono.Web.Helpers
{
    public class EmailAttribute : RegularExpressionAttribute
    {
        public EmailAttribute()
            : base(@"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}" +
                   @"\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\" +
                   @".)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$")
        {
        }

        public IEnumerable GetClientValidationRules(ModelMetadata metadata, ControllerContext context)
        {
            var errorMessage = FormatErrorMessage(metadata.GetDisplayName());

            yield return new EmailValidationRule(errorMessage);
        }
    }

    public class EmailValidationRule : ModelClientValidationRule
    {
        public EmailValidationRule(string errorMessage)
        {
            ErrorMessage = errorMessage;
            ValidationType = "email";
        }
    }
}