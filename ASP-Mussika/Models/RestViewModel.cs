using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Models
{
    public class RestViewModel
    {
        public long id { get; set; }
        public long id__prato_categoria { get; set; }
        public string nome { get; set; }
        public string endereco { get; set; }
        public string telefone { get; set; }
        public string email { get; set; }
        [AllowHtml]
        public string descricao { get; set; }
        public string foto_capa { get; set; }
        public string website { get; set; }
        public string mapa { get; set; }
        public int id_restaurante_tipo { get; set; }
        public int id_distrito { get; set; }
        public string nomeDistrito { get; set; }
        public string nomeRestauranteTipo { get; set; }
        public long size { get; set; }
        public bool activo { get; set; }
    }
}