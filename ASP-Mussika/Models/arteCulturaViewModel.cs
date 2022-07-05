using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Models
{
    public class arteCulturaViewModel
    {
        public long id { get; set; }
        public int id_categoria_obra { get; set; }
        public string nome_categoria_obra { get; set; }
        public string nome_distrito { get; set; }
        public string titulo { get; set; }
        public string autor { get; set; }
        public string materia { get; set; }
        public string suporte { get; set; }
        public string tecnica { get; set; }
        public string dimensoes { get; set; }
        public string autoria_producao { get; set; }
        [AllowHtml]
        public string informacao_tecnica { get; set; }
        public string fotografo { get; set; }
        public string proprietario { get; set; }
        public string caminho_imagem { get; set; }
        public string ano { get; set; }
        public long id_artista_obra { get; set; }
        public decimal preco { get; set; }
        public decimal preco_venda { get; set; }
        public decimal peso { get; set; }
    }
}