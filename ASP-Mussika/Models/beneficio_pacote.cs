using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class beneficio_pacote
    {
        public int id_item { get; set; }
        public string item_nome { get; set; }
        public string activo_item { get; set; }
        public int id_pacote_subscricao { get; set; }
    }
}