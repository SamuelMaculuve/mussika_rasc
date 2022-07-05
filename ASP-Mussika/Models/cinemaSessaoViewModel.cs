using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Models
{
    public class cinemaSessaoViewModel
    {
        public long id { get; set; }
        public long id_cinema { get; set; }
        public string nome_cinema { get; set; }
        public DateTime data { get; set; }
        public string dataConvetido { get; set; }
        public string hora { get; set; }
        [AllowHtml]
        public string descricao { get; set; }
        public long id_filme { get; set; }
        public string nome_filme { get; set; }
        public decimal preco { get; set; }
        public bool inactivo { get; set; }
    }
}