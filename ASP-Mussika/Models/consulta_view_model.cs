using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class consulta_view_model
    {
        public string nome_paciente { get; set; }
        public string enedereco { get; set; }
        public int idade { get; set; }
        public long id { get; set; }
        public string hora { get; set; }
        public string dia { get; set; }
        public string sintomas { get; set; }
        public long centro { get; set; }
        public bool clinica { get; set; }
        public bool hospital { get; set; }
    }
}