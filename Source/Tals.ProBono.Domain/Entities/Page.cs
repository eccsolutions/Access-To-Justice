using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Tals.ProBono.Domain.Entities
{
    public class Page
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        [StringLength(300)]
        [DisplayName("Page Title")]
        public string Title { get; set; }

        [Required]
        [DisplayName("Page Content")]
        public string Content { get; set; }

        public DateTimeOffset CreatedDate { get; set; }

        [StringLength(256)]
        public string CreatedByUserName { get; set; }

        public DateTimeOffset? LastModifiedDate { get; set; }

        [StringLength(256)]
        public string LastModifiedUserName { get; set; }
    }
}
