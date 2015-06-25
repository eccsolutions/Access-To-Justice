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
        [DisplayName("Yearly Rate")]
        public decimal YearlyRate { get; set; }

        [Required]
        [DisplayName("Factor")]
        public decimal Factor { get; set; }

        [Required]
        [DisplayName("Legal Aid Threshold")]
        public decimal LegalAidLevel { get; set; }

        [Required]
        [DisplayName("Modest Means Threshold")]
        public decimal ModestMeansLevel { get; set; }
    }
}
