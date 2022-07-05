using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Models
{
    public class loja_produto_view_model
    {
        public long id { get; set; }
        public string codigo { get; set; }
        public Nullable<long> id_loja { get; set; }
        public string nome { get; set; }
        [AllowHtml]
        public string descricao { get; set; }
        public Nullable<decimal> preco_min { get; set; }
        public Nullable<decimal> preco_max { get; set; }
        public Nullable<decimal> preco_venda { get; set; }
        public Nullable<bool> e_servico { get; set; }
        public string foto_capa { get; set; }
        public Nullable<System.DateTime> data_cadastro { get; set; }
        public Nullable<int> clicks { get; set; }
        public Nullable<bool> inactivo { get; set; }
        public Nullable<int> id_categoria { get; set; }
        public Nullable<int> categoria { get; set; }

        public Nullable<decimal> peso { get; set; }
    }
}