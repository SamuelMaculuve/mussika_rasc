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
    
    public partial class item_pacote_subscricao
    {
        public int id { get; set; }
        public string item_nome { get; set; }
        public Nullable<bool> activo { get; set; }
        public Nullable<int> id_pacote_subscricao { get; set; }
    
        public virtual pacote_subscricao pacote_subscricao { get; set; }
    }
}
