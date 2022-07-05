using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Models
{
    public class ArtigoViewModel
    {
        public long id { get; set; }
        public string codigo { get; set; }
        public int id_categoria_artigo { get; set; }
        public string nomeCategoria { get; set; }
        public string nome { get; set; }
        [AllowHtml]
        public string descricao { get; set; }
        public bool marca_registada { get; set; }
        public bool atracao_internacional { get; set; }
        public string e_atracao { get; set; }
        public decimal preco_min { get; set; }
        public decimal preco_max { get; set; }
        public decimal preco_venda { get; set; }
        public decimal peso { get; set; }
        public string observacoes { get; set; }
        public string portofolio { get; set; }
        public string genero { get; set; }
        public bool e_servico { get; set; }
        public string foto_capa { get; set; }
        public int id_distrito { get; set; }
        public string nomeDistrito { get; set; }
        public string bairro { get; set; }
        public long clicks { get; set; }
        public System.DateTime data_cadastro { get; set; }
        public bool Inactivo { get; set; }

    }
}