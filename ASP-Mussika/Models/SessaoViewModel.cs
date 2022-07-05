using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class SessaoViewModel
    {
        public long id { get; set; }
        public long id_cinema { get; set; }
        public string nome_cinema { get; set; }
        public string nome_Filme { get; set; }
        public DateTime data { get; set; }
        public string hora { get; set; }

        public string descricao { get; set; }
        public long id_filme { get; set; }
        public bool inactivo { get; set; }
    }
}