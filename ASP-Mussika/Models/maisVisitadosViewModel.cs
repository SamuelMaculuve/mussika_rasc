using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class maisVisitadosViewModel
    {
        public long id_acomodacao { get; set; }
        public long id_Restaurante { get; set; }
        public string Nome { get; set; }
        public string linkhref { get; set; }
        public string tipo { get; set; }
        public string foto { get; set; }

        public bool e_Restaurante { get; set; }
        public bool e_Acomodacao { get; set; }
        public string endereco { get; set; }
        public string telefone { get; set; }


    }
}