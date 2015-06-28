using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Tals.ProBono.Domain.Entities
{
    public class FedPovertySetting
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        [Required]
        [DisplayName("Yearly Income")]
        public decimal YearlyIncome { get; set; }

        [Required]
        [DisplayName("Dependents Modifier")]
        public decimal DependentsModifier { get; set; }

        [Required]
        [DisplayName("Legal Aid Threshold")]
        public decimal LegalAidLevel { get; set; }

        [Required]
        [DisplayName("Modest Means Threshold")]
        public decimal ModestMeansLevel { get; set; }

        public DateTimeOffset? LastModifiedDate { get; set; }

        public string LastModifiedByUserName { get; set; }
    }
}
