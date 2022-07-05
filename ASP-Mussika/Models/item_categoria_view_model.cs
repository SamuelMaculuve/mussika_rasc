using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class item_categoria_view_model
    {
        public long id { get; set; }
        public long id_filme { get; set; }
        public long id_categoria { get; set; }
        public string nome { get; set; }
    }
}