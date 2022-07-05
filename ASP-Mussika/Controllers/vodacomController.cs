using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Xml;
using ASP_Mussika.Models;
using RestSharp;
using System.Threading.Tasks;
using System.Net;

namespace ASP_Mussika.Controllers
{
    public class vodacomController : Controller
    {
        public int RandomNumber(int min, int max)
        {
            Random random = new Random();
            return random.Next(min, max);
        }

        public string RandomString(int size, bool lowerCase)
        {
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            char ch;
            for (int i = 0; i < size; i++)
            {
                ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }
            if (lowerCase)
                return builder.ToString().ToLower();
            return builder.ToString();
        }

        public string RandomStringNumber()
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(RandomString(2, false));
            builder.Append(RandomNumber(10, 99));
            builder.Append(RandomString(2, false));
            return builder.ToString();
        }
        public async Task<ActionResult> Index()
        {
           
            WebClient client = new WebClient();
            string token = client.DownloadString("https://mpesa.mussika.co.mz/index.php");
            
            RestClient restClient = new RestClient("https://api.sandbox.vm.co.mz:18352");
            RestRequest restRequest = new RestRequest("/ipg/v1x/c2bPayment/singleStage/", Method.POST);
            restRequest.AddHeader("Content-Type", "application/json");
            restRequest.AddHeader("Origin", "developer.mpesa.vm.co.mz");
            restRequest.AddHeader("Authorization", $"Bearer {token}");
            string ThirdPartyrefereence = RandomStringNumber();
            string TransactionReference = RandomStringNumber();
            var data = new C2B_MODEL() { input_Amount = "10", input_CustomerMSISDN = "258848631601", input_ServiceProviderCode = "171717", input_ThirdPartyReference = ThirdPartyrefereence, input_TransactionReference = TransactionReference };
            restRequest.AddJsonBody(data);
            
            var response = await restClient.ExecuteAsync<MpesaResponse>(restRequest);
            if (response.IsSuccessful == true)
            {
                MpesaResponse resposta = response.Data;
                if(resposta.output_ResponseCode== "INS-0")
                {
                    return Content("true");
                }
                
            }

            return Content("false");
        }

      
    }
}