//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ASP_Mussika.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class produto
    {
        public long id { get; set; }
        public Nullable<int> id_categoria { get; set; }
        public Nullable<int> id_tipo_produto { get; set; }
        public string nome_oficial { get; set; }
        public string nome_tradicional { get; set; }
        public string nome_vulgar { get; set; }
        public string origem { get; set; }
        public string poder_comercial { get; set; }
        public string volume_producao { get; set; }
        public string forma_aquisicao { get; set; }
        public Nullable<decimal> preco_custo { get; set; }
        public Nullable<decimal> preco_venda { get; set; }
        public Nullable<decimal> preco_exportacao { get; set; }
        public Nullable<bool> aceita_reserva { get; set; }
        public string metodo_reserva { get; set; }
        public Nullable<bool> aceita_envio { get; set; }
        public string metodo_envio { get; set; }
        public Nullable<bool> activo { get; set; }
    
        public virtual tipo_produto tipo_produto { get; set; }
    }
}
