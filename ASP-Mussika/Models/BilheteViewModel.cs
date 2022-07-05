using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class BilheteViewModel
    {
        public long id { get; set; }
        public Nullable<long> id_evento { get; set; }
        public Nullable<System.DateTime> data_compra { get; set; }
        public Nullable<decimal> valor { get; set; }
        public Nullable<bool> vip { get; set; }
        public Nullable<long> usuario { get; set; }
        public Nullable<bool> inactivo { get; set; }
        public string token { get; set; }
        public string nome_evento { get; set; }
        public string nome_usuario { get; set; }
        public string tipo { get; set; }
    }
}