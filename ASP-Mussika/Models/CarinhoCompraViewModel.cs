using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class CarinhoCompraViewModel
    {
        public long id { get; set; }
        public long id_usuario { get; set; }
        public bool e_restaurante { get; set; }
        public bool e_Produto_loja { get; set; }
        public bool e_farmacia_produto { get; set; }
        public bool e_artigo { get; set; }
        public bool e_acomodacao { get; set; }
        public bool e_Obra { get; set; }
        public bool e_Musica { get; set; }
        public bool e_taxi { get; set; }
        public bool e_Filme { get; set; }
        public bool e_evento { get; set; }
        public long id_restaurante { get; set; }
        public long id_loja_produto { get; set; }
        public long id_farmacia_produto { get; set; }
        public long id_Musica { get; set; }
        public long id_obra { get; set; }
        public long id_acomodacao { get; set; }
        public long id_quarto { get; set; }
        public long id_artigo { get; set; }
        public long id_taxi { get; set; }
        public long id_filme { get; set; }
        public long id_evento { get; set; }
        public bool activo { get; set; }
        public DateTime data_cadastro { get; set; }
        public string descricao { get; set; }
        public decimal preco { get; set; }
        public string bairro { get; set; }
        public string foto { get; set; }
        public string distrito { get; set; }
        public string nome { get; set; }
    }
}