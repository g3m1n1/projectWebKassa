using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace projectWebKassa.Models
{
    public class ProductViewModels
    {





        /// <summary>
        /// dit gedeelt create een product met een naam en een productId
        /// en bind er een CategorieId aan
        /// 
        /// het product Maxlength = 100 
        /// </summary>

        public class ProductCreateViewModel
        {
            [Required]
            [Display(Name = "Naam")]
            [MaxLength(100)]
            [DataType(DataType.Text)]
            public string Naam { get; set; }
            /// <summary>
            /// hier onder koppel je een product met een categorie.
            /// het categorie Id is de naam van de categorie wat bij een product staat (nummer's).
            /// </summary>

            [Required]
            [Display(Name = "Id")]
            [DataType(DataType.Text)]

            public int CategorieId { get; set; }

        }

        /// <summary>
        ///  [Display(Naam = "naam ")] = de naam van de categorie die er gebruikt is.
        /// </summary>


        public class ProductDetailsViewModel
        {

            [Display(Name = "naam")]
            [DataType(DataType.Text)]

            public int naam { get; set; }

        }




    }

}