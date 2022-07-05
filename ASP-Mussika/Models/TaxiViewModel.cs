using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class TaxiViewModel
    {
        public long id { get; set; }
        public string nome { get; set; }
        public string praca_fixa { get; set; }
        public string bairro { get; set; }
        public string condutor { get; set; }
        public string proprietario { get; set; }
        public string matricula { get; set; }
        public string marca { get; set; }
        public string cor { get; set; }
        public string telefone { get; set; }
        public string email { get; set; }
        public int id_distrito { get; set; }
        public string nomeDistrito { get; set; }
        public string foto_capa { get; set; }
        public bool Inactivo { get; set; }
        public int id_categoria { get; set; }
    }
}