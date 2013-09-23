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
        [DataMember()]
        public int? ArticleId { get; set; }

        [DataMember()]
        public string Name { get; set; }

        [DataMember()]
        public string Description { get; set; }

        [DataMember()]
        public decimal Price { get; set; }

        [DataMember()]
        public int? Total_in_self { get; set; }

        [DataMember()]
        public int? Total_in_vault { get; set; }

        [DataMember()]
        public int? StoreId { get; set; }   
    }

    [DataContract(Namespace = "API.SShoes")]
    public class StoresBE
    {
        [DataMember()]
        public int? StoreId { get; set; }

        [DataMember()]
        public string Name { get; set; }

        [DataMember()]
        public string Address { get; set; }
    }
}