using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class comentarioViewModel
    {
        public long id_classificacao { get; set; }
        public int id_distrito { get; set; }
        public int id_turismo { get; set; }
        public int id_acomodacao { get; set; }
        public int id_evento { get; set; }
        public int id_restaurante { get; set; }
        public long id_usuario { get; set; }
        public bool e_like { get; set; }
        public DateTime data_cadastro { get; set; }
        public bool activo { get; set; }
        public string nomeUsuario { get; set; }
        public string email { get; set; }
        public string assunto { get; set; }
        public int estrelas { get; set; }

        public long id_comentario { get; set; }       
        public string comentario { get; set; }
        public DateTime data { get; set; }
        public bool valido { get; set; }
       


    }
}