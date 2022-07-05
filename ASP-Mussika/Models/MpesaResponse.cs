using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika.Models
{
    public class MpesaResponse
    {
        public string output_ResponseCode { get; set; }
        public string output_ResponseDesc { get; set; }
        public string output_TransactionID { get; set; }
        public string output_ConversationID { get; set; }
        public string output_ThirdPartyReference { get; set; }
    }
}