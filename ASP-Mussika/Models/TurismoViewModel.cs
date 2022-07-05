using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Models
{
    public class TurismoViewModel
    {
        public long id { get; set; }
        public string nome { get; set; }
        public DateTime data_cadastro { get; set; }
        public int id_distrito { get; set; }
        public string localizacao { get; set; }
        public bool inactivo { get; set; }
        public string foto_capa { get; set; }
        [AllowHtml]
        public string descricao { get; set; }
        public string nome_distrito { get; set; }
        public int comentarios { get; set; }
        public int id_categoria { get; set; }
    }
}