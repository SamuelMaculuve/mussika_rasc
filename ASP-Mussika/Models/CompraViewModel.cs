using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class CompraViewModel
    {
        public long id_compra { get; set; }
        public long id_usuario { get; set; }
        public string oque_e { get; set; }
        public string nome { get; set; }
        public Nullable<long> id_produto { get; set; }
        public Nullable<decimal> valor { get; set; }
        public Nullable<System.DateTime> data_cadastro { get; set; }
        public Nullable<bool> inactivo { get; set; }
        public string descricao { get; set; }
        public Nullable<bool> confirmado { get; set; }
        public Nullable<bool> vip { get; set; }
        public Nullable<bool> provedor_pago { get; set; }
        public string modo_pagamento { get; set; }
        public string foto_capa { get; set; }
        public string linkVideo { get; set; }
        public string linkAudio { get; set; }
        public string titulo { get; set; }
        public string subtitulo { get; set; }
        public decimal ganho_provedor { get; set; }
        public decimal comissao { get; set; }
        public decimal peso { get; set; }
    }
}