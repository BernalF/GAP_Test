using SShoes.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SShoes.Models;

namespace SShoes.Controllers
{
    /// <summary>
    /// Store Controller class
    /// </summary>
    public class StoreController : Controller
    {
        /// <summary>
        /// Store Index VIew
        /// </summary>
        /// <returns></returns>
        public ActionResult StoreI()
        {
            using (SShoesBL SShoesBL = new SShoesBL())
            {
                return View(SShoesBL.GetStores(null));
            }             
        }

        /// <summary>
        /// Store New View
        /// </summary>
        /// <returns></returns>
        public ActionResult StoreN()
        {
            return View();
        }

        /// <summary>
        /// Store Edit VIew
        /// </summary>
        /// <returns></returns>
        public ActionResult StoreE(int? id)
        {
            using (SShoesBL SShoesBL = new SShoesBL())
            {
                return View(SShoesBL.GetStores(id).FirstOrDefault());
            }
        }

        /// <summary>
        /// Stores Add or update Action
        /// </summary>
        public ActionResult AddorUpdateStores(StoresModel model, string parentView)
        {
            if (ModelState.IsValid)
            {
                using (SShoesBL SShoesBL = new SShoesBL())
                {
                    SShoesBL.AddOrModifyStores(model);
                }
                return RedirectToAction("StoreI");
            }
            return View(parentView, model);
        }

        /// <summary>
        /// Store Delete Action
        /// </summary>
        public ActionResult StoreD(int? id)
        {
            using (SShoesBL SShoesBL = new SShoesBL())
            {
                SShoesBL.DelStores(id);
                return RedirectToAction("StoreI");
            }
        }

    }
}
