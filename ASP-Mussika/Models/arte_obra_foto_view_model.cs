using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class arte_obra_foto_view_model
    {
        public long id { get; set; }
        public long id_obra_arte { get; set; }
        public string caminho_imagem { get; set; }
        public long size { get; set; }
    }
}