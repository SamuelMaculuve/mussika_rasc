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
    
    public partial class taxi_categoria
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public taxi_categoria()
        {
            this.taxis = new HashSet<taxi>();
        }
    
        public int id { get; set; }
        public string descricao { get; set; }
        public string fotografia { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<taxi> taxis { get; set; }
    }
}
