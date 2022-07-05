using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class UsuarioViewModel
    {
        public long idusario { get; set; }
        public string nome { get; set; }
        public string telefone { get; set; }
        public string usuario1 { get; set; }
        public string senha { get; set; }
        public bool activo { get; set; }
        public System.DateTime datacadastro { get; set; }
        public string cod_autenticao { get; set; }
        public bool autenticado { get; set; }
        public bool provedor { get; set; }
        public string msg_autenticacao { get; set; }
        public string tipoUsuario { get; set; }
        public int id_usuario_tipo { get; set; }
        public string senhaActual { get; set; }
        public string foto_capa { get; set; }
        
    }
}