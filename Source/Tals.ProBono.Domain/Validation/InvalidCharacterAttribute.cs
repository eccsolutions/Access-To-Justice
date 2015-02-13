using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace Tals.ProBono.Domain.Validation
{
    public class InvalidCharacterAttribute : ValidationAttribute
    {
        private readonly string[] _characters;

        public InvalidCharacterAttribute(string[] characters)
        {
            _characters = characters;
        }

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (value != null)
            {
                string data = value.ToString();

                foreach (var character in _characters.Where(data.Contains))
                {
                    return new ValidationResult(string.Format("Invalid character: {0}", character));
                }
            }
            return ValidationResult.Success;
        }
    }
}