using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _1000Dizi.Models;
using System.Dynamic;
using _1000Dizi.ViewModels;

namespace _1000Dizi.Areas.admin.Controllers
{
    [Authorize]
    public class AdminController : Controller
    {
        // GET: admin/Admin
        public ActionResult Index()
        {
            using(VeriTabaniEntities db = new VeriTabaniEntities())
            {
                var model = db.FilmTablosu.ToList();
                return View(model);
            }
            
        }
        public ActionResult Seanslar()
        {
            dynamic mymodel = new ExpandoObject();
            using (VeriTabaniEntities db = new VeriTabaniEntities())
            {
                mymodel.filmModel = db.FilmTablosu.ToList();
                mymodel.seansModel = db.SeansTablosu.ToList();
            }

            return View(mymodel);
        }
        public ActionResult Yeni()
        {
            var model = new FilmTablosu();
            return View("FilmForm", model);
        }
        public ActionResult YeniSeans()
        {
            
            using (VeriTabaniEntities db = new VeriTabaniEntities())
            {
                var modelSeans = new SeansTablosu();
                var modelFilm = db.FilmTablosu.ToList();
                var SeansViewModel = new SeansViewModel
                {
                    Seanslar = modelSeans,
                    Filmler = modelFilm
                };


                return View("SeansForm", SeansViewModel);
            }
                
            
        }
        public ActionResult Guncelle(int id)
        {
            using(VeriTabaniEntities db = new VeriTabaniEntities())
            {
                var model = db.FilmTablosu.SingleOrDefault(m=>m.film_id==id);
                if (model == null)
                {
                    return HttpNotFound();
                }
                return View("FilmForm",model);
            }
        }
        public ActionResult SeansGuncelle(int id)
        {
            using (VeriTabaniEntities db = new VeriTabaniEntities())
            {
                var modelSeans = db.SeansTablosu.SingleOrDefault(m => m.seans_id == id);
                var modelFilm = db.FilmTablosu.ToList();
                var SeansViewModel = new SeansViewModel
                {
                    Seanslar = modelSeans,
                    Filmler = modelFilm
                };

               
                if (SeansViewModel == null)
                {
                    return HttpNotFound();
                }
                return View("SeansForm", SeansViewModel);
            }
        }
        public ActionResult Kaydet(FilmTablosu gelenFilm)
        {
            if (!ModelState.IsValid)
            {
                return View("FilmForm", gelenFilm);
            }
            using(VeriTabaniEntities db = new VeriTabaniEntities())
            {
                if (gelenFilm.film_id == 0)
                {
                    if (gelenFilm.resimFile==null) {
                        ViewBag.HataResim = "Lütfen Resim Yükleyin";
                        return View("FilmForm", gelenFilm);
                    }

                    string resimAdi = gelenFilm.resimFile.FileName;
                    gelenFilm.film_resim = resimAdi;
                    db.FilmTablosu.Add(gelenFilm);
                    gelenFilm.resimFile.SaveAs(Path.Combine(Server.MapPath("~/Content/images/movie"), Path.GetFileName(resimAdi)));

                }
                else
                {
                    var GuncellenecekVeri = db.FilmTablosu.SingleOrDefault(m => m.film_id == gelenFilm.film_id);
                    if(gelenFilm.resimFile != null)
                    {
                        string resimAdi = gelenFilm.resimFile.FileName;
                        gelenFilm.film_resim = resimAdi;
                        gelenFilm.resimFile.SaveAs(Path.Combine(Server.MapPath("~/Content/images/movie"), Path.GetFileName(resimAdi)));
                    }
                    db.Entry(GuncellenecekVeri).CurrentValues.SetValues(gelenFilm);
                }
                db.SaveChanges();
                return RedirectToAction("index");
            }
            
        }
        public ActionResult SeansKaydet(SeansViewModel gelenSeans)
        {
            /*if (!ModelState.IsValid)
            {
                return View("SeansForm", gelenSeans);
            }*/
            using (VeriTabaniEntities db = new VeriTabaniEntities())
            {
                var varMi = db.SeansTablosu.SingleOrDefault(m => m.seans_id == gelenSeans.Seanslar.seans_id);
                if (gelenSeans.Seanslar.seans_id == 0)
                {
                    //gelenSeans.Seanslar.seans_filmId = gelenSeans.Filmler[0].film_id;
                    db.SeansTablosu.Add(gelenSeans.Seanslar);

                }
                else
                {
                    var GuncellenecekVeri = db.SeansTablosu.SingleOrDefault(m => m.seans_id == gelenSeans.Seanslar.seans_id);
                    
                    db.Entry(GuncellenecekVeri).CurrentValues.SetValues(gelenSeans.Seanslar);
                }
                db.SaveChanges();
                return RedirectToAction("index");
            }

        }


    }
}