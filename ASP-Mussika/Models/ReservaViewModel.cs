using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class ReservaViewModel
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