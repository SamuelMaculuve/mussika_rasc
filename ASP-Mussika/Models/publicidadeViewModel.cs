using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ASP_Mussika.Models;

namespace ASP_Mussika.Models
{
    public class publicidadeViewModel
    {
        public int id { get; set; }
        public string nome { get; set; }
        public decimal preco_por_mes { get; set; }
        public bool activo { get; set; }

        public int id_item { get; set; }
        public string item_nome { get; set; }
        public string activo_item { get; set; }
        public int id_pacote_subscricao { get; set; }

        public class item_lista
        {
            public int id_item { get; set; }
            public string item_nome { get; set; }
            public string activo_item { get; set; }
            public int id_pacote_subscricao { get; set; }
        }
        public List<beneficio_pacote> beneficiosPacote { get; set; }
    }
}