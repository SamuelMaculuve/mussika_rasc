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
    
    public partial class acomodacao_servico
    {
        public long id { get; set; }
        public string descricao { get; set; }
        public Nullable<long> id_acomodacao { get; set; }
    
        public virtual acomodacao acomodacao { get; set; }
    }
}