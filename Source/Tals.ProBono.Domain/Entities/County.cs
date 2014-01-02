using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace Tals.ProBono.Domain.Entities
{
    [MetadataType(typeof(CountyValidation))]
    public partial class County
    {
    }

    public class CountyValidation
    {
        [HiddenInput(DisplayValue = false)]
        public int Id { get; set; }

        [Required]
        [DisplayName("County Name")]
        public string CountyName { get; set; }
    }
}
