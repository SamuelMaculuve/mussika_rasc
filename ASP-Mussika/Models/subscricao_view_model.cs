using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class subscricao_view_model
    {
        public long id { get; set; }
        public Nullable<long> id_usuario { get; set; }
        public string nome_entidade { get; set; }
        public string celular { get; set; }
        public string endereco { get; set; }
        public string email { get; set; }
        public string nome_usuario { get; set; }
        public string validade_ { get; set; }
        public string tipo_actividade { get; set; }
        public string informacao_adicional { get; set; }
        public Nullable<bool> confirmado { get; set; }
        public Nullable<int> id_pacote_subscricao { get; set; }
        public Nullable<System.DateTime> data_cadastro { get; set; }
        public Nullable<System.DateTime> validade { get; set; }
    }
}