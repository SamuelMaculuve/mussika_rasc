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
    
    public partial class transportadora
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public transportadora()
        {
            this.transportadora_parametro = new HashSet<transportadora_parametro>();
            this.compras = new HashSet<compra>();
        }
    
        public int id_transportadora { get; set; }
        public Nullable<long> id_provedor { get; set; }
        public string nome { get; set; }
        public string descricao { get; set; }
        public Nullable<bool> inactivo { get; set; }
        public Nullable<decimal> preco { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<transportadora_parametro> transportadora_parametro { get; set; }
        public virtual Usuario Usuario { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<compra> compras { get; set; }
    }
}
