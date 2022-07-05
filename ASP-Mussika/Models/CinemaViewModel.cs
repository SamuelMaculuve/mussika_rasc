using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Models
{
    public class CinemaViewModel
    {
        public long id { get; set; }
        public int id_distrito { get; set; }
        public string nomeDistrito { get; set; }
        public string nome { get; set; }
        public string foto_capa { get; set; }
        public string localizacao { get; set; }
        [AllowHtml]
        public string descricao { get; set; }
        public bool inactivo { get; set; }
    }
}