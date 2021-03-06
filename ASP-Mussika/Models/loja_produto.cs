//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ASP_Mussika.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class loja_produto
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public loja_produto()
        {
            this.carrinho_compra = new HashSet<carrinho_compra>();
        }
    
        public long id { get; set; }
        public string codigo { get; set; }
        public Nullable<long> id_loja { get; set; }
        public string nome { get; set; }
        public string descricao { get; set; }
        public Nullable<decimal> preco_min { get; set; }
        public Nullable<decimal> preco_max { get; set; }
        public Nullable<decimal> preco_venda { get; set; }
        public Nullable<bool> e_servico { get; set; }
        public string foto_capa { get; set; }
        public Nullable<System.DateTime> data_cadastro { get; set; }
        public Nullable<int> clicks { get; set; }
        public Nullable<bool> inactivo { get; set; }
        public Nullable<int> id_categoria { get; set; }
        public Nullable<int> categoria { get; set; }
        public Nullable<decimal> peso { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<carrinho_compra> carrinho_compra { get; set; }
        public virtual loja loja { get; set; }
        public virtual produto_categoria produto_categoria { get; set; }
    }
}
