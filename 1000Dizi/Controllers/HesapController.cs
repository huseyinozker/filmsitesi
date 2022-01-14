using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using _1000Dizi.Models;


namespace _1000Dizi.Controllers
{
    [Authorize]
    public class HesapController : Controller
    {
        // GET: Hesap
        [Authorize]
        public ActionResult Index()
        {
            using (VeriTabaniEntities db = new VeriTabaniEntities())
            {
                string uye_id = Session["uye_id"].ToString();
                var model = db.BiletTablosu.Where(m => m.bilet_uyeId == uye_id).ToList();
                return View(model);
            }
                             
        }
    }
}