using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Models
{
    public class DistritoViewModel
    {
        public int id { get; set; }
        public string codigo { get; set; }
        public string nome { get; set; }
        public string foto_capa { get; set; }
        public string linkmapa { get; set; }
        [AllowHtml]
        public string descricao { get; set; }
        public bool activar_galeria { get; set; }
        public string area { get; set; }
        public string populacao { get; set; }
        public string longitude { get; set; }
        public string latitude { get; set; }
        public long visitas { get; set; }
    }
}