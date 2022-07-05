using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Models
{
    public class AutorArteViewModel
    {
        public long id { get; set; }
        public string nome { get; set; }
        [AllowHtml]
        public string descricao { get; set; }
        public string fotografia { get; set; }
        public int id_distrito { get; set; }
        public string NomeDistrito { get; set; }
        public string telefone { get; set; }
        public string layout { get; set; }
    }
}