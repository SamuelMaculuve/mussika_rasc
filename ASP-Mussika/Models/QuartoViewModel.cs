using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Models
{
    public class QuartoViewModel
    {
        public long id { get; set; }
        public long id_acomodacao { get; set; }
       
        public string descricao { get; set; }
        public int hospedes { get; set; }
        public decimal custo_diaria { get; set; }
        public int quantidade { get; set; }
        public string foto_capa { get; set; }
        public bool chk_ac { get; set; }
        public bool chk_parqueamento { get; set; }
        public bool chk_televisao { get; set; }
        public bool chk_geleira { get; set; }
        public bool chk_wifi { get; set; }
        public bool chk_minibar { get; set; }
        public string quarto_foto { get; set; }
        public bool Inactivo { get; set; }
        [AllowHtml]
        public string observacoes { get; set; }
    }
}