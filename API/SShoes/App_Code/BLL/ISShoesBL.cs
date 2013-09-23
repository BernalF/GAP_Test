//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
//'''' 
//''''     Document    :  SShoes\BLL\ISShoesBL.cs
//''''     Description :  Interface Business Logic Layer for Super Shoes API.
//''''    
//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Collections.Generic;
using System.Linq;
using API.SShoes.BEU;

namespace API.SShoes
{
    [ServiceContract(Namespace = "API.SShoes")]
    public interface ISShoesBL
    {      
        /// <summary>
        /// Get Articles
        /// </summary>        
        [OperationContract()]
        [WebInvoke(Method = "POST",
            RequestFormat = WebMessageFormat.Json,
            ResponseFormat = WebMessageFormat.Json,                       
            BodyStyle = WebMessageBodyStyle.Wrapped)]
        IList<ArticlesBE> GetArticles(int? articleId);

        /// <summary>
        /// Add Articles
        /// </summary>        
        [OperationContract(Name = "AddArticles")]
        [WebInvoke(Method = "POST",
            RequestFormat = WebMessageFormat.Json,
            ResponseFormat = WebMessageFormat.Json,
            UriTemplate = "/AddArticles",
            BodyStyle = WebMessageBodyStyle.Wrapped)]
        void AddArticles(string Description, string Name, decimal Price, int StoreId, int Total_in_self, int Total_in_vault);

        /// <summary>
        /// Update Articles
        /// </summary>        
        [OperationContract(Name = "ModifyArticles")]
        [WebInvoke(Method = "POST",
            RequestFormat = WebMessageFormat.Json,
            ResponseFormat = WebMessageFormat.Json,
            UriTemplate = "/ModifyArticles",
            BodyStyle = WebMessageBodyStyle.Wrapped)]
        void ModifyArticles(int? ArticleId, string Description, string Name, decimal Price, int StoreId, int Total_in_self, int Total_in_vault);

        /// <summary>
        /// Delete Articles
        /// </summary>        
        [OperationContract(Name = "DelArticles")]
        [WebGet(UriTemplate = "DelArticles/{id}")]
        void DelArticles(string id);

    }

}