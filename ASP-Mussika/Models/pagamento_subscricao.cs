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
    
    public partial class pagamento_subscricao
    {
        public long id { get; set; }
        public Nullable<long> id_usuario { get; set; }
        public string nome_entidade { get; set; }
        public string celular { get; set; }
        public string endereco { get; set; }
        public string email { get; set; }
        public string tipo_actividade { get; set; }
        public string informacao_adicional { get; set; }
        public Nullable<bool> confirmado { get; set; }
        public Nullable<int> id_pacote_subscricao { get; set; }
        public Nullable<System.DateTime> data_cadastro { get; set; }
        public Nullable<System.DateTime> validade { get; set; }
    
        public virtual Usuario Usuario { get; set; }
        public virtual pacote_subscricao pacote_subscricao { get; set; }
    }
}
