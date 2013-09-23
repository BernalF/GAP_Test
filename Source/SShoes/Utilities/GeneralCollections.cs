using SShoes.Business;
using SShoes.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SShoes.Utilities
{
    public class GeneralCollections
    {
        /// <summary>
        /// Return a list of Stores
        /// </summary>
        public static SelectList GetStores
        {
            get
            {
                Dictionary<int?, string> dictionary = new Dictionary<int?, string>();
                using (SShoesBL SShoesBL = new SShoesBL())
                {
                    IList<StoresModel> result = SShoesBL.GetStores(null);
                    foreach (var c in result)
                    {
                        dictionary.Add(c.StoreId, c.Name);
                    }
                }  
                return new SelectList(dictionary, "Key", "Value");
            }
        }
    }
}