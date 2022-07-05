using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Models
{
    public class ClinicaViewModel
    {
        public long id { get; set; }
        public int id_distrito { get; set; }
        [AllowHtml]
        public string descricao { get; set; }
        public string nome_distrito { get; set; }
        public string nome { get; set; }
        public string bairro { get; set; }
        public string telefone { get; set; }
        public string foto_capa { get; set; }
        public bool inactivo { get; set; }
        public string email { get; set; }
        public DateTime data_cadastro { get; set; }
        public decimal preco_consulta { get; set; }
    }
}