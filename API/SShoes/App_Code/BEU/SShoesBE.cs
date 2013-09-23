//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
//'''' 
//''''     Document    :  SShoes\BEU\SShoesBL.cs
//''''     Description :  Holds the business entity unit for for Super Shoes API.
//''''    
//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
using System.Runtime.Serialization;

namespace API.SShoes.BEU
{
    [DataContract(Namespace = "API.SShoes")]    
    public class ArticlesBE
    {
        /// <summary>
        /// Article Id
        /// </summary>
        [DataMember()]
        public int? ArticleId { get; set; }

        /// <summary>
        /// Name
        /// </summary>
        [DataMember()]
        public string Name { get; set; }

        /// <summary>
        /// Description
        /// </summary>
        [DataMember()]
        public string Description { get; set; }

        /// <summary>
        /// Price
        /// </summary>
        [DataMember()]
        public decimal Price { get; set; }

        /// <summary>
        /// Total_in_self
        /// </summary>
        [DataMember()]
        public int? Total_in_self { get; set; }

        /// <summary>
        /// Total_in_vault
        /// </summary>
        [DataMember()]
        public int? Total_in_vault { get; set; }

        /// <summary>
        /// StoreId
        /// </summary>
        [DataMember()]
        public int? StoreId { get; set; }   
    }

    [DataContract(Namespace = "API.SShoes")]
    public class StoresBE
    {
        /// <summary>
        /// Store Id
        /// </summary>
        [DataMember()]
        public int? StoreId { get; set; }

        /// <summary>
        /// Name
        /// </summary>
        [DataMember()]
        public string Name { get; set; }

        /// <summary>
        /// Address
        /// </summary>
        [DataMember()]
        public string Address { get; set; }
    }
}