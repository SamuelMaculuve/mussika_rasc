using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Models
{
    public class EventoViewModel
    {
        public long id { get; set; }
        public long comentarios { get; set; }
        public string nome { get; set; }
        public DateTime data_cadastro { get; set; }
        public DateTime data_evento { get; set; }
        public string data_evento_convertido { get; set; }
        [AllowHtml]
        public string descricao { get; set; }
        public string foto_capa { get; set; }
        public int id_distrito { get; set; }
        public string nome_distrito { get; set; }
        public string local { get; set; }
        public bool inactivo { get; set; }
        public bool adiado { get; set; }
        public bool realizado { get; set; }
        public int id_categoria { get; set; }
        public string nome_categoria { get; set; }
        public decimal preco_bilhete { get; set; }
        public decimal preco_bilhete_vip { get; set; }
        public string orador { get; set; }
        public string moderador { get; set; }
        public string part_assistente { get; set; }
        public string email { get; set; }
        public string celular { get; set; }
        public string Responsavel { get; set; }
        public int nr_participantes { get; set; }
    }
}