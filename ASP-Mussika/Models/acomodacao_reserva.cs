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
    
    public partial class acomodacao_reserva
    {
        public long id { get; set; }
        public Nullable<long> id_acomodacao_quarto { get; set; }
        public Nullable<System.DateTime> data_reserva { get; set; }
        public Nullable<System.DateTime> checkin { get; set; }
        public Nullable<System.DateTime> checkout { get; set; }
        public Nullable<double> preco { get; set; }
        public Nullable<double> iva { get; set; }
        public Nullable<double> total { get; set; }
        public string nome_hospede { get; set; }
        public string apelido_hospede { get; set; }
        public string email { get; set; }
        public string telefone { get; set; }
        public string endereco { get; set; }
        public Nullable<bool> confirmado { get; set; }
        public Nullable<bool> cancelado { get; set; }
        public string data_entrada { get; set; }
        public string data_saida { get; set; }
    }
}
