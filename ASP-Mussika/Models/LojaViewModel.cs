using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Models
{
    public class LojaViewModel
    {
        public long id { get; set; }
        public string nome { get; set; }
        public string nome_distrito { get; set; }
        public string tipo_loja { get; set; }
        public Nullable<int> id_distrito { get; set; }
        public string bairro { get; set; }
        [AllowHtml]
        public string descricao { get; set; }
        public Nullable<bool> inactivo { get; set; }
        public string foto_capa { get; set; }
        public Nullable<System.DateTime> data_cadastro { get; set; }
        public string telefone { get; set; }
        public string email { get; set; }
        public Nullable<int> id_tipo_loja { get; set; }
    }
}