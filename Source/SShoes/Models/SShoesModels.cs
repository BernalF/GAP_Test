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
    /// Articles Model class
    /// </summary>
    [GridTable(PagingEnabled = true, PageSize = 5)]
    [Serializable]
    public class ArticlesModel
    {
        /// <summary>
        /// ArticleId
        /// </summary>
        [NotMappedColumnAttribute]
        public int? ArticleId { get; set; }

        /// <summary>
        /// Name
        /// </summary>
        [Required(ErrorMessage = "{0} is required")]
        [DisplayName("Article Name")]
        [GridColumn(Title = "Name")]
        public string Name { get; set; }

        /// <summary>
        /// Description
        /// </summary>
        [DisplayName("Description")]
        [GridColumn(Title = "Description", Width = "110px")]
        public string Description { get; set; }

        /// <summary>
        /// Price
        /// </summary>
        [DisplayName("Price")]
        [GridColumn(Title = "Price", Format = "{0:C}")]
        [DataType(DataType.Currency)]
        public decimal Price { get; set; }

        /// <summary>
        /// Total_in_self
        /// </summary>
        [DisplayName("Total in self")]
        [GridColumn(Title = "Total in self")]        
        public int? Total_in_self { get; set; }

        /// <summary>
        /// Total_in_vault
        /// </summary>
        [DisplayName("Total in vault")]
        [GridColumn(Title = "Total in vault")]        
        public int? Total_in_vault { get; set; }

        /// <summary>
        /// StoreId
        /// </summary>
        [Required(ErrorMessage = "{0} is required")]
        [NotMappedColumnAttribute]
        public int? StoreId { get; set; }

        /// <summary>
        /// StoreName
        /// </summary>
        [DisplayName("Store Name")]
        [GridColumn(Title = "Store Name")]
        public string StoreName { get; set; }
    }

    /// <summary>
    /// Stores Model class
    /// </summary>
    [GridTable(PagingEnabled = true, PageSize = 5)]
    [Serializable]
    public class StoresModel
    {
        /// <summary>
        /// StoreId
        /// </summary>
        [NotMappedColumnAttribute]
        public int? StoreId { get; set; }

        /// <summary>
        /// Name
        /// </summary>
        [Required(ErrorMessage = "{0} is required")]
        [DisplayName("Store Name")]
        [GridColumn(Title = "Name")]
        public string Name { get; set; }

        /// <summary>
        /// Address
        /// </summary>
        [DisplayName("Address")]
        [GridColumn(Title = "Address", Width = "210px")]
        public string Address { get; set; }

    }
}