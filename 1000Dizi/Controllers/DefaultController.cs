using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Threading.Tasks;
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;
using _1000Dizi.Models;
using _1000Dizi.ViewModels;



namespace _1000Dizi.Controllers
{
    

    public class DefaultController : Controller
    {
        
        //api url
        string api_url = "https://api.themoviedb.org/3/";
        string api_key = "618296b0d4de78eb022d87ef779c6ab0";
        string language = "tr";
        public async Task<ActionResult> Index()
        {
            using(var client = new HttpClient())
            {
               /* string baseUrl = api_url;//+ "trending/tv/week?api_key=" + api_key + "&language=" + language;
                client.BaseAddress = new Uri(baseUrl);
                client.DefaultRequestHeaders.Clear();

                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                HttpResponseMessage Res = await client.GetAsync("trending/tv/week?api_key=" + api_key + "&language=tr");

                if (Res.IsSuccessStatusCode)
                {
                    var SeriesResponse = Res.Content.ReadAsStringAsync().Result;
                    //Deserializing the response recieved from web api and storing into the Employee list
                    SeriesInfo = JsonConvert.DeserializeObject<Series>(SeriesResponse);

                    System.Diagnostics.Debug.WriteLine(SeriesResponse);
                    System.Diagnostics.Debug.WriteLine(SeriesInfo);
                    System.Diagnostics.Debug.WriteLine(SeriesInfo.page);
                }

                System.Diagnostics.Debug.WriteLine("xxx " + SeriesInfo.page + " bbb");*/

            }
            using (VeriTabaniEntities db = new VeriTabaniEntities())
            {
                var model = db.FilmTablosu.ToList();
                return View(model);
            }

        }
        public ActionResult Film(int id)
        {
            /*using (VeriTabaniEntities db = new VeriTabaniEntities())
            {
                var model = db.FilmTablosu.SingleOrDefault(m => m.film_id == id);
                return View(model);
            }*/

            using (VeriTabaniEntities db = new VeriTabaniEntities())
            {
                var modelSeans = db.SeansTablosu.Where(m=>m.seans_filmId == id).ToList();
                var modelFilm = db.FilmTablosu.SingleOrDefault(m => m.film_id == id);
                var modelSeansKoltuklar = db.SeansKoltukTablosu.ToList();
                var FilmViewModel = new FilmViewModel
                {
                    Seanslar = modelSeans,
                    Film = modelFilm,
                    SeansKoltuklari = modelSeansKoltuklar
                };


                return View(FilmViewModel);
            }

        }
        public ActionResult Biletal(int koltuk,int seans,string film,string seans_saat,string seans_tarih)
        {
            var model = new BiletBilgileri
            {
                koltuk_no = koltuk,
                seans_no = seans,
                film_ismi = film,
                bilet_saat = seans_saat,
                bilet_tarih = seans_tarih,
                uye_id = -1 //yani üyesiz
            };
            if(Session["uye_id"] != null)
            {
                model.uye_id = int.Parse(Session["uye_id"].ToString());
            }
            return View(model);
        }
        public ActionResult BiletKaydet(int koltuk, int seans, string film, string seans_saat, string seans_tarih)
        {
            using (VeriTabaniEntities db = new VeriTabaniEntities())
            {
                BiletTablosu bilet = new BiletTablosu
                {
                    bilet_film = film,
                    bilet_koltuk = koltuk.ToString(),
                    bilet_uyeId = "-1",
                    bilet_saat = seans_saat,
                    bilet_tarih = seans_tarih,
                };
                SeansKoltukTablosu koltukKayit = new SeansKoltukTablosu
                {
                    koltuk_no = koltuk.ToString(),
                    seans_id = seans
                };
                if (Session["uye_id"] != null)
                {
                    bilet.bilet_uyeId = Session["uye_id"].ToString();
                }
                db.BiletTablosu.Add(bilet);
                db.SeansKoltukTablosu.Add(koltukKayit);
                db.SaveChanges();

                var model = db.FilmTablosu.ToList();

                return View("Index",model);
            }
           
        }
        public ActionResult Giris()
        {
            return RedirectToAction("/index", "Giris");
        }
    }
}