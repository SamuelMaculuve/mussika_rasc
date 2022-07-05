using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Models
{
    public class farmacia_produto_view_model
    {
        public long id { get; set; }
        public Nullable<long> id_farmacia { get; set; }
        public string nome { get; set; }
        [AllowHtml]
        public string descricao { get; set; }
        public Nullable<decimal> preco_venda { get; set; }
        public string foto_capa { get; set; }
        public Nullable<System.DateTime> data_cadastro { get; set; }
        public Nullable<bool> inactivo { get; set; }
    }
}