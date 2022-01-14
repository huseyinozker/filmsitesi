using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using _1000Dizi.Models;

namespace _1000Dizi.ViewModels
{
    public class SeansViewModel
    {
        public SeansTablosu Seanslar { get; set; }
        public List<FilmTablosu> Filmler { get; set; }
    }
}