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
    
    public partial class obra_arte_imagem
    {
        public long id { get; set; }
        public Nullable<long> id_obra_arte { get; set; }
        public string caminho_imagem { get; set; }
    
        public virtual obra_arte obra_arte { get; set; }
    }
}
