using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class AcomFotoViewModel
    {
        public long id { get; set; }
        public long id_acomodacao { get; set; }
        public string caminho { get; set; }
        public long size { get; set; }
    }
}