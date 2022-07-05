using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Models
{
    public class restaurante_prato_view_model
    {
        public long id { get; set; }
        public long id__prato_categoria { get; set; }
        public Nullable<long> id_resturante { get; set; }
        public string nome { get; set; }
        public Nullable<decimal> preco_venda { get; set; }
        public Nullable<decimal> peso { get; set; }
        public string foto_capa { get; set; }
        [AllowHtml]
        public string descricao { get; set; }
        public Nullable<System.DateTime> data_cadastrro { get; set; }
        public Nullable<bool> inactivo { get; set; }
    }
}