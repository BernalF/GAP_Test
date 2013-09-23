using SShoes.Business;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace SShoes.Controllers
{
    /// <summary>
    /// Home Controller class
    /// </summary>
    public class HomeController : Controller
    {
        /// <summary>
        /// Articles Index VIew
        /// </summary>
        /// <returns></returns>
        public ActionResult ArticlesI()
        {
            using (SShoesBL SShoesBL = new SShoesBL())
            {
                return View(SShoesBL.GetArticles(null));
            }
        }

        /// <summary>
        /// Articles New View
        /// </summary>
        /// <returns></returns>
        public ActionResult ArticlesN()
        {
            return View();
        }

        /// <summary>
        /// Articles Edit VIew
        /// </summary>
        /// <returns></returns>
        public ActionResult ArticlesE(int? id)
        {
            using (SShoesBL SShoesBL = new SShoesBL())
            {
                return View(SShoesBL.GetArticles(id).FirstOrDefault());
            }
        }

        /// <summary>
        /// Article Delete Action
        /// </summary>
        public ActionResult ArticlesD(int? id)
        {
            HttpWebRequest webrequest = (HttpWebRequest)WebRequest.Create("http://localhost:8010/API/SShoes/Services/SShoesSL.svc/DelArticles/" + id);
            webrequest.Method = "GET";
            using (WebResponse response = webrequest.GetResponse())
            {
                return RedirectToAction("ArticlesI");
            }
        }

    }
}
