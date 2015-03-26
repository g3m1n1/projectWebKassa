using System.ComponentModel.DataAnnotations;
namespace projectWebKassa.Models
{
    public class ProductmanagmentViewModel
    {
    }

    public class IndexPrijsViewModel
    {
        [Display(Name = "startDatum")]
        public string startDatum { get; set; }
    }
}