using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class servicoViewModel
    {
        public long id { get; set; }
        public string nome { get; set; }
        public string endereco { get; set; }
        public string telefone { get; set; }
        public string email { get; set; }
        public string foto_capa { get; set; }
        public int id_servico_categoria { get; set; }
        public string nomeCategoria { get; set; }       
        public int id_distrito { get; set; }
        public string nomeDistrito { get; set; }
    }
}