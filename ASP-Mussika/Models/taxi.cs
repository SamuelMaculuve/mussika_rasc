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
    
    public partial class taxi
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public taxi()
        {
            this.carrinho_compra = new HashSet<carrinho_compra>();
        }
    
        public long id { get; set; }
        public string nome { get; set; }
        public string praca_fixa { get; set; }
        public string bairro { get; set; }
        public string condutor { get; set; }
        public string proprietario { get; set; }
        public string matricula { get; set; }
        public string marca { get; set; }
        public string cor { get; set; }
        public string telefone { get; set; }
        public string email { get; set; }
        public Nullable<int> id_distrito { get; set; }
        public string foto_capa { get; set; }
        public Nullable<bool> Inactivo { get; set; }
        public Nullable<int> id_categoria { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<carrinho_compra> carrinho_compra { get; set; }
        public virtual distrito distrito { get; set; }
        public virtual taxi_categoria taxi_categoria { get; set; }
    }
}