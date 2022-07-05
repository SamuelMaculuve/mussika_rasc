using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class ProvedorServicoViewModel
    {
       
        public Nullable<long> usuario { get; set; }
        public Nullable<bool> musica { get; set; }
        public Nullable<bool> bazar { get; set; }
        public Nullable<bool> loja { get; set; }
        public Nullable<bool> acomodacao { get; set; }
        public Nullable<bool> taxi { get; set; }
        public Nullable<bool> restaurante { get; set; }
        public Nullable<bool> arte_cultura { get; set; }
        public Nullable<bool> evento { get; set; }
        public Nullable<bool> turismo { get; set; }
        public Nullable<bool> farmacia { get; set; }
        public Nullable<bool> clinica { get; set; }
        public Nullable<bool> transportadora { get; set; }
        public Nullable<bool> pagamento_servico { get; set; }
        public string referencia { get; set; }
    }
}