//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
//'''' 
//''''     Document    :  SShoes\BLL\SShoesBL.cs
//''''     Description :  Business Logic Layer for Super Shoes API.
//''''    
//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
using System.ServiceModel;
using System.ServiceModel.Web;
using API.SShoes.BEU;
using BBCorporation.DataAccess;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Activation;

namespace API.SShoes
{
    [ServiceBehavior(Namespace = "API.SShoes")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Required)]
    public class SShoesBL : ISShoesBL
    {

        /// <summary>
        /// Get Articles
        /// </summary>        
        public IList<ArticlesBE> GetArticles(int? articleId)
        {
            return (new DataAccess()).ExecuteReader<ArticlesBE>("[uspGetArticles]",
                                        new { ArticleId = articleId }).ToList();
        }

        /// <summary>
        /// Add  Articles
        /// </summary>        
        public void AddArticles(string Description, string Name, decimal Price, int StoreId, int Total_in_self, int Total_in_vault)
        {
            ArticlesBE model = new ArticlesBE
            {                
                Description = Description,
                Name = Name,
                Price = Price,
                StoreId = StoreId,
                Total_in_self = Total_in_self,
                Total_in_vault = Total_in_vault
            };
            (new DataAccess()).ExecuteNonQuery("[uspAddArticles]", model);
        }

        /// <summary>
        /// Update Articles
        /// </summary>        
        public void ModifyArticles(int? ArticleId, string Description, string Name, decimal Price, int StoreId, int Total_in_self, int Total_in_vault)
        {
            ArticlesBE model = new ArticlesBE
            {
                ArticleId = ArticleId,
                Description = Description,
                Name = Name,
                Price = Price,
                StoreId = StoreId,
                Total_in_self = Total_in_self,
                Total_in_vault = Total_in_vault
            };
            (new DataAccess()).ExecuteNonQuery("[uspModifyArticles]", model);
        }

        /// <summary>
        /// Delete Articles
        /// </summary>        
        public void DelArticles(string id)
        {
            (new DataAccess()).ExecuteNonQuery("[uspDelArticles]",
                                        new { ArticleId = int.Parse(id) });
        }
    }
}