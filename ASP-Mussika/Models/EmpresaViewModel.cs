using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Models
{
    public class EmpresaViewModel
    {
        public int id { get; set; }
        [AllowHtml]
        public string descricao { get; set; }
        [AllowHtml]
        public string seguranca { get; set; }
        public string telefone { get; set; }
        public string website { get; set; }
       
        public string email { get; set; }
        public string endereco { get; set; }
        [AllowHtml]
        public string comopagar { get; set; }
    }
}