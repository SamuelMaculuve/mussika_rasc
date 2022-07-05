using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Models
{
    public class FilmeViewModel
    {
        public long id { get; set; }
        public string minutos { get; set; }
        public string direcao { get; set; }
        public string elenco { get; set; }
        public string nacionalidade { get; set; }
        public string titulo_original { get; set; }
        public string distribuidor { get; set; }
        public int ano_producao { get; set; }
        public string tipo_filme { get; set; }
        public decimal orcamento { get; set; }
        public string idioma { get; set; }
        public string cor { get; set; }
        [AllowHtml]
        public string sinopse { get; set; }
        public string foto_capa { get; set; }
        public bool inactivo { get; set; }
        public decimal preco { get; set; }
        public string link_trailer { get; set; }
    }
}