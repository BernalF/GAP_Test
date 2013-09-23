using BBCorporation.DataAccess;
using SShoes.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SShoes.Business
{
    public class SShoesBL : IDisposable
    {
        //--------------------------------------------------- Stores
        /// <summary>
        /// Get Stores
        /// </summary>        
        public IList<StoresModel> GetStores(int? storeID)
        {
            return (new DataAccess()).ExecuteReader<StoresModel>("[uspGetStores]",
                                        new { StoreId = storeID }).ToList();
        }

        /// <summary>
        /// Add or Update Stores
        /// </summary>        
        public void AddOrModifyStores(StoresModel model)
        {
            (new DataAccess()).ExecuteNonQuery("[uspAddOrModifyStores]", model);
        }

        /// <summary>
        /// Delete Stores
        /// </summary>        
        public void DelStores(int? storeID)
        {
            (new DataAccess()).ExecuteNonQuery("[uspDelStores]",
                                        new { StoreId = storeID });
        }

        //--------------------------------------------------- Articles
        /// <summary>
        /// Get Articles
        /// </summary>        
        public IList<ArticlesModel> GetArticles(int? articleID)
        {
            return (new DataAccess()).ExecuteReader<ArticlesModel>("[uspGetArticles]",
                                        new { ArticleId = articleID }).ToList();
        }

        /// <summary>
        /// Implements IDispoable
        /// </summary>
        void IDisposable.Dispose()
        {
            GC.SuppressFinalize(this);
        }
    }
}