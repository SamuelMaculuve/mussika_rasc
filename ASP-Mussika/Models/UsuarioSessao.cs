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
    
    public partial class UsuarioSessao
    {
        public long idsessao { get; set; }
        public Nullable<long> idusuario { get; set; }
        public Nullable<System.DateTime> data { get; set; }
    
        public virtual Usuario Usuario { get; set; }
    }
}