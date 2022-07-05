using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Mussika
{
    public class PaypalConfiguration
    {
        //Variables for storing the clientID and clientSecret key
        public readonly static string ClientId;
        public readonly static string ClientSecret;

        //Constructor
        static PaypalConfiguration()
        {
            var config = GetConfig();
            ClientId = "AeKNqxnMHW4IL-LgkE7RJVlt1Fy5ZD8ABAE0Jf_uyCLgrmImWm5CfJJ0T4fPG_sH6hBeQyA4qBZtOHpw";
            ClientSecret = "EIM0lsIA45YON37prOsY7oK-R7LDRjyxUfInk6d2bXts-IaLsT19diN3z3HqAATQ1EU_yCU_keidAanr";
        }

        // getting properties from the web.config
        public static Dictionary<string, string> GetConfig()
        {
            return PayPal.Api.ConfigManager.Instance.GetProperties();
        }

        private static string GetAccessToken()
        {
            // getting accesstocken from paypal                
            string accessToken = new OAuthTokenCredential
        (ClientId, ClientSecret, GetConfig()).GetAccessToken();

            return accessToken;
        }

        public static APIContext GetAPIContext()
        {
            // return apicontext object by invoking it with the accesstoken
            APIContext apiContext = new APIContext(GetAccessToken());
            apiContext.Config = GetConfig();
            return apiContext;
        }


    }
}