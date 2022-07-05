using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class reserva_acomodacaoViewModel
    {
        
        public long id { get; set; }
        public long id_quarto { get; set; }
        public string data_chegada { get; set; }
        public string nome { get; set; }
        public string datas { get; set; }
        public string Hora { get; set; }
        public string data_saida { get; set; }
        public int Hospedes { get; set; }
        public decimal deposito { get; set; }
        public decimal sub_total { get; set; }
        public decimal custo_total { get; set; }
        public bool confirmado { get; set; }
        public bool cancelado { get; set; }

    }
}