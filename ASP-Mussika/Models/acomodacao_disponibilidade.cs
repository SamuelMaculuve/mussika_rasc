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
    
    public partial class acomodacao_disponibilidade
    {
        public long id { get; set; }
        public Nullable<long> id_acomodacao_quarto { get; set; }
        public Nullable<System.DateTime> checkin { get; set; }
        public Nullable<System.DateTime> checkout { get; set; }
        public Nullable<int> quantidade { get; set; }
    
        public virtual acomodacao_quarto acomodacao_quarto { get; set; }
    }
}