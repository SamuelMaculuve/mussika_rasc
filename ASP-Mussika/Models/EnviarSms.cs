using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Net;
using System.Web;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

namespace ASP_Mussika.Models
{
    public static class EnviarSms
    {
        public static void enviarsms(string code, string number)
        {
            try
            {
                
                    String message_ = HttpUtility.UrlEncode("Seu código de verificação do MUSSIKA:"+Environment.NewLine + code);

                const string accountSid = "AC02e20e632da656631605885a1fd60213";
                const string authToken = "886b8af7155e22717e8d320106a19971";

                TwilioClient.Init(accountSid, authToken);

                var message = MessageResource.Create(
                    body: "Seu codigo de verificação do MUSSIKA é: " + code,
                    from: new Twilio.Types.PhoneNumber("+13345184504"),
                    to: new Twilio.Types.PhoneNumber("258842338251")
                );

                Console.WriteLine(message.Sid);

                //    using (var wb = new WebClient())
                //    {
                //        byte[] response = wb.UploadValues("http://api.txtlocal.com/send/", new NameValueCollection()
                //{
                //{"username" , "isumbane@mozsistemas.co.mz"},
                //{"hash" , "d7b53517560f1ab34f918babd3e8aa787bb540d17e82acab737e34b0d39297b0"},
                //{"numbers" , number},
                //{"message" , message},
                //{"sender" , "MUSSIKA"}
                //});
                //        string result = System.Text.Encoding.UTF8.GetString(response);

                //    }


            }
			catch (Exception ex)
			{

               
			}
        }
    }
}