using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _1000Dizi.Models;
using System.Web.Security;



namespace _1000Dizi.Controllers
{
    public class GirisController : Controller
    {
        // GET: Giris
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Uyelogin(UyelerTablosu uye)
        {
            using (VeriTabaniEntities db = new VeriTabaniEntities())
            {
                var uyeVarmi = db.UyelerTablosu.FirstOrDefault(
                    m => m.uye_isim == uye.uye_isim && m.uye_sifre == uye.uye_sifre);
                if (uyeVarmi != null)
                {
                    FormsAuthentication.SetAuthCookie(uyeVarmi.uye_isim, true);
                    Session.Add("uye_id", uyeVarmi.uye_id);
                    Response.Write(uye.uye_id);
                    Session.Add("uye_isim", uye.uye_isim);
                    return RedirectToAction("/index", "Hesap");
                }
            }
            ViewBag.Hata = "Kullanıcı adı veya şifre hatalı!";
            return View("index");
        }
        public ActionResult UyeLogout()
        {
            FormsAuthentication.SignOut();
            Session.Remove("uye_id");
            Session.Remove("uye_isim");
            return View("Index");
        }
    }
}