using GridMvc.DataAnnotations;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SShoes.Models
{
    /// <summary>
    /// Articles Model
    /// </summary>
    [GridTable(PagingEnabled = true, PageSize = 5)]
    [Serializable]
    public class ArticlesModel
    {
        [NotMappedColumnAttribute]
        public int? ArticleId { get; set; }

        [Required(ErrorMessage = "{0} is required")]
        [DisplayName("Article Name")]
        [GridColumn(Title = "Name")]
        public string Name { get; set; }

        [DisplayName("Description")]
        [GridColumn(Title = "Description", Width = "110px")]
        public string Description { get; set; }

        [DisplayName("Price")]
        [GridColumn(Title = "Price", Format = "{0:C}")]
        [DataType(DataType.Currency)]
        public decimal Price { get; set; }

        [DisplayName("Total in self")]
        [GridColumn(Title = "Total in self")]
        [DataType(DataType.Currency)]
        public int? Total_in_self { get; set; }

        [DisplayName("Total in vault")]
        [GridColumn(Title = "Total in vault")]        
        public int? Total_in_vault { get; set; }

        [Required(ErrorMessage = "{0} is required")]
        [NotMappedColumnAttribute]
        public int? StoreId { get; set; }

        [DisplayName("Store Name")]
        [GridColumn(Title = "Store Name")]
        public string StoreName { get; set; }
    }

    /// <summary>
    /// Stores Model
    /// </summary>
    [GridTable(PagingEnabled = true, PageSize = 5)]
    [Serializable]
    public class StoresModel
    {
        [NotMappedColumnAttribute]
        public int? StoreId { get; set; }

        [Required(ErrorMessage = "{0} is required")]
        [DisplayName("Store Name")]
        [GridColumn(Title = "Name")]
        public string Name { get; set; }

        [DisplayName("Address")]
        [GridColumn(Title = "Address", Width = "210px")]
        public string Address { get; set; }

    }
}