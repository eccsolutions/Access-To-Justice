using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web.Mvc;
using Tals.ProBono.Domain.Filters;

namespace Tals.ProBono.Domain.Entities
{
    [MetadataType(typeof(CategoryValidation))]
	public partial class Category
	{
        public bool IsSubscribed(string userName)
        {
           
            return Subscriptions.Count(s => s.UserName == userName) > 0;
        }

	    public Subscription GetSubscriptionFor(string userName)
	    {
	        return Subscriptions.SingleOrDefault(s => s.UserName == userName);
	    }

	    public Question LastQuestion
	    {
	        get { return Questions.AsQueryable().NotTaken().Active().OrderByDescending(x => x.CreatedDate).FirstOrDefault(); }
	    }
	}

    public class CategoryValidation
    {
        [HiddenInput(DisplayValue = false)]
        public int Id { get; set; }

        [Required]
        [DisplayName("Category Name")]
        public string CategoryName { get; set; }

        [Required]
        [DisplayName("Short Description")]
        public string ShortDescription { get; set; }

        [DisplayName("Long Description")]
        public string LongDescription { get; set; }

        [DisplayName("Sort Order")]
        [Required]
        public int SortOrder { get; set; }
    }
}