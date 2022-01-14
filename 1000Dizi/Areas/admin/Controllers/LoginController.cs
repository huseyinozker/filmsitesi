using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using _1000Dizi.Models;

namespace _1000Dizi.Areas.admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: admin/Login
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Alogin(KullanicilarTablosu kullanici)
        {
            using(VeriTabaniEntities db = new VeriTabaniEntities())
            {
                var kullaniciVarmi = db.KullanicilarTablosu.FirstOrDefault(
                    m => m.kullanici_ad == kullanici.kullanici_ad && m.kullanici_sifre == kullanici.kullanici_sifre);
                if (kullaniciVarmi != null)
                {
                    FormsAuthentication.SetAuthCookie(kullaniciVarmi.kullanici_ad, false);
                    return RedirectToAction("/index", "Admin");
                }
            }
            ViewBag.Hata = "Kullanıcı adı veya şifre hatalı!";
            return View("index");
        }
    }
}