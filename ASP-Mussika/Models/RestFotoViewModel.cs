using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class RestFotoViewModel
    {
        public int id { get; set; }
        public string caminho { get; set; }
        public long size { get; set; }
        public long id_restaurante { get; set; }
        public bool activo { get; set; }
    }
}