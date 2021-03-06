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
    
    public partial class acomodacao_quarto
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public acomodacao_quarto()
        {
            this.acomodacao_disponibilidade = new HashSet<acomodacao_disponibilidade>();
            this.carrinho_compra = new HashSet<carrinho_compra>();
        }
    
        public long id { get; set; }
        public Nullable<long> id_acomodacao { get; set; }
        public string descricao { get; set; }
        public Nullable<int> hospedes { get; set; }
        public Nullable<decimal> custo_diaria { get; set; }
        public Nullable<int> quantidade { get; set; }
        public string foto_capa { get; set; }
        public Nullable<bool> chk_ac { get; set; }
        public Nullable<bool> chk_parqueamento { get; set; }
        public Nullable<bool> chk_televisao { get; set; }
        public Nullable<bool> chk_geleira { get; set; }
        public Nullable<bool> chk_wifi { get; set; }
        public Nullable<bool> chk_minibar { get; set; }
        public string quarto_foto { get; set; }
        public Nullable<bool> Inactivo { get; set; }
        public string observacoes { get; set; }
    
        public virtual acomodacao acomodacao { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<acomodacao_disponibilidade> acomodacao_disponibilidade { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<carrinho_compra> carrinho_compra { get; set; }
    }
}
