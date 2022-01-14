using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _1000Dizi.ViewModels
{
    public class BiletBilgileri
    {
        public int koltuk_no { get; set; }
        public int seans_no { get; set; }
        public string film_ismi { get; set; }

        public string bilet_tarih { get; set; }
        public string bilet_saat { get; set; }
        public int uye_id { get; set; }
    }
}