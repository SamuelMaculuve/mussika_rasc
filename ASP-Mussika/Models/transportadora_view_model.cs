using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class transportadora_view_model
    {
        public int id_transportadora { get; set; }
        public Nullable<long> id_provedor { get; set; }
        public string nome { get; set; }
        public string descricao { get; set; }
        public Nullable<bool> inactivo { get; set; }
        public Nullable<decimal> preco { get; set; }

        public Nullable<int> id_tipo_carga { get; set; }
        public Nullable<decimal> distancia_minima { get; set; }
        public Nullable<decimal> distancia_maxima { get; set; }
        public Nullable<bool> sensivel { get; set; }
        public Nullable<decimal> valor { get; set; }

        public Nullable<int> peso_pequeno { get; set; }
        public Nullable<int> peso_medio { get; set; }
        public Nullable<int> peso_grande { get; set; }
        public Nullable<int> percentagem_sensivel { get; set; }

        public Nullable<decimal> peso_max_carga_pequena { get; set; }
        public Nullable<decimal> peso_max_carga_media { get; set; }
        public Nullable<decimal> peso_max_carga_grande { get; set; }
    }
}