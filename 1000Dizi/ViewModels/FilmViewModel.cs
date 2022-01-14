using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using _1000Dizi.Models;

namespace _1000Dizi.ViewModels
{
    public class FilmViewModel
    {
        public List<SeansTablosu> Seanslar { get; set; }

        public List<SeansKoltukTablosu> SeansKoltuklari { get; set; }

        public FilmTablosu Film { get; set; }
    }
}