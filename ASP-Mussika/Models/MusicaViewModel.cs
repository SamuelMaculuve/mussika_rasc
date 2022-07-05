using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class MusicaViewModel
    {
        public long id { get; set; }
        public Nullable<int> id_genero_musical { get; set; }
        public string genero { get; set; }
        public string titulo { get; set; }
        public string artista { get; set; }
        public Nullable<int> ano { get; set; }
        public string album { get; set; }
        public string formato { get; set; }
        public string produtor { get; set; }
        public string distrito { get; set; }
        public string gravadora { get; set; }
        public string link { get; set; }
        public string caminho_ficheiro { get; set; }
        public string caminho_capa1 { get; set; }
        public string caminho_capa2 { get; set; }
        public Nullable<decimal> preco_venda { get; set; }
        public Nullable<decimal> preco_video { get; set; }
        public Nullable<bool> gratis { get; set; }
        public string duracao { get; set; }
        public Nullable<bool> pode_baixar { get; set; }
        public Nullable<bool> e_album { get; set; }
        public Nullable<long> id_artista_obra { get; set; }
    }
}