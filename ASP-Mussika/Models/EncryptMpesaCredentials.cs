using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Xml;

namespace ASP_Mussika.Models
{
    public static class EncryptMpesaCredentials
    {
        public static string ToMpesaSecurityCredential()
        {
            string publicKey = "MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAmptSWqV7cGUUJJhUBxsMLonux24u+FoTlrb+4Kgc6092JIszmI1QUoMohaDDXSVueXx6IXwYGsjjWY32HGXj1iQhkALXfObJ4DqXn5h6E8y5/xQYNAyd5bpN5Z8r892B6toGzZQVB7qtebH4apDjmvTi5FGZVjVYxalyyQkj4uQbbRQjgCkubSi45Xl4CGtLqZztsKssWz3mcKncgTnq3DHGYYEYiKq0xIj100LGbnvNz20Sgqmw/cH+Bua4GJsWYLEqf/h/yiMgiBbxFxsnwZl0im5vXDlwKPw+QnO2fscDhxZFAwV06bgG0oEoWm9FnjMsfvwm0rUNYFlZ+TOtCEhmhtFp+Tsx9jPCuOd5h2emGdSKD8A6jtwhNa7oQ8RtLEEqwAn44orENa1ibOkxMiiiFpmmJkwgZPOG/zMCjXIrrhDWTDUOZaPx/lEQoInJoE2i43VN/HTGCCw8dKQAwg0jsEXau5ixD0GUothqvuX3B9taoeoFAIvUPEq35YulprMM7ThdKodSHvhnwKG82dCsodRwY428kg2xM/UjiTENog4B6zzZfPhMxFlOSFX4MnrqkAS+8Jamhy1GgoHkEMrsT5+/ofjCx0HjKbT5NuA2V/lmzgJLl3jIERadLzuTYnKGWxVJcGLkWXlEPYLbiaKzbJb2sYxt+Kt5OxQqC1MCAwEAAQ==";

            var re = ChunksUpto(publicKey, 60);
            string apiKey = "5x0wc4l2c8ho0tk965zcj91s6ue8pn3z";
            string strFinal=@"";
            foreach(var item in re)
            {
                strFinal.Insert(strFinal.Length,item+Environment.NewLine);
            }
            string certPulicKey = ((RSA)new X509Certificate2(Convert.FromBase64String(certKey)).PublicKey.Key).ToXmlString2(false);
            byte[] bytes = Encoding.UTF8.GetBytes(apiKey);
            using (RSACryptoServiceProvider rsa = new RSACryptoServiceProvider())
            {
                try
                {
                    rsa.FromXmlString2(certPulicKey);
                    return Convert.ToBase64String(rsa.Encrypt(bytes, false));
                }
                finally
                {
                    rsa.PersistKeyInCsp = false;
                }
            }
        }
        static IEnumerable<string> ChunksUpto(string str, int maxChunkSize)
        {
            for (int i = 0; i < str.Length; i += maxChunkSize)
                yield return str.Substring(i, Math.Min(maxChunkSize, str.Length - i));
        }
        private static void FromXmlString2(this RSACryptoServiceProvider rsa, string xmlString)
        {
            EncryptMpesaCredentials.FromXmlStringImpl(rsa, xmlString);
        }

        private static void FromXmlStringImpl(RSACryptoServiceProvider rsa, string xmlString)
        {
            RSAParameters parameters = new RSAParameters();
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.LoadXml(xmlString);
            if (!xmlDocument.DocumentElement.Name.Equals("RSAKeyValue"))
            {
                throw new InvalidOperationException("Invalid XML RSA key.");
            }

            foreach (XmlNode childNode in xmlDocument.DocumentElement.ChildNodes)
            {
                switch (childNode.Name)
                {
                    case "D":
                        parameters.D = Convert.FromBase64String(childNode.InnerText);
                        continue;
                    case "DP":
                        parameters.DP = Convert.FromBase64String(childNode.InnerText);
                        continue;
                    case "DQ":
                        parameters.DQ = Convert.FromBase64String(childNode.InnerText);
                        continue;
                    case "Exponent":
                        parameters.Exponent = Convert.FromBase64String(childNode.InnerText);
                        continue;
                    case "InverseQ":
                        parameters.InverseQ = Convert.FromBase64String(childNode.InnerText);
                        continue;
                    case "Modulus":
                        parameters.Modulus = Convert.FromBase64String(childNode.InnerText);
                        continue;
                    case "P":
                        parameters.P = Convert.FromBase64String(childNode.InnerText);
                        continue;
                    case "Q":
                        parameters.Q = Convert.FromBase64String(childNode.InnerText);
                        continue;
                    default:
                        throw new InvalidOperationException("Unknown node name: " + childNode.Name);
                }
            }
            rsa.ImportParameters(parameters);
        }

        private static string ToXmlString2(this RSA rsa, bool includePrivateParameters = false)
        {
            RSAParameters rsaParameters = rsa.ExportParameters(includePrivateParameters);
            if (!includePrivateParameters)
            {
                return string.Format("<RSAKeyValue><Modulus>{0}</Modulus><Exponent>{1}</Exponent></RSAKeyValue>", (object)Convert.ToBase64String(rsaParameters.Modulus), (object)Convert.ToBase64String(rsaParameters.Exponent));
            }

            return string.Format("<RSAKeyValue><Modulus>{0}</Modulus><Exponent>{1}</Exponent><P>{2}</P><Q>{3}</Q><DP>{4}</DP><DQ>{5}</DQ><InverseQ>{6}</InverseQ><D>{7}</D></RSAKeyValue>", (object)Convert.ToBase64String(rsaParameters.Modulus), (object)Convert.ToBase64String(rsaParameters.Exponent), (object)Convert.ToBase64String(rsaParameters.P), (object)Convert.ToBase64String(rsaParameters.Q), (object)Convert.ToBase64String(rsaParameters.DP), (object)Convert.ToBase64String(rsaParameters.DQ), (object)Convert.ToBase64String(rsaParameters.InverseQ), (object)Convert.ToBase64String(rsaParameters.D));
        }



        private const string certKey = @"MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAmptSWqV7cGUUJJhU
BxsMLonux24u+FoTlrb+4Kgc6092JIszmI1QUoMohaDDXSVueXx6IXwYGsjj
WY32HGXj1iQhkALXfObJ4DqXn5h6E8y5/xQYNAyd5bpN5Z8r892B6toGzZQV
B7qtebH4apDjmvTi5FGZVjVYxalyyQkj4uQbbRQjgCkubSi45Xl4CGtLqZzt
sKssWz3mcKncgTnq3DHGYYEYiKq0xIj100LGbnvNz20Sgqmw/cH+Bua4GJsW
YLEqf/h/yiMgiBbxFxsnwZl0im5vXDlwKPw+QnO2fscDhxZFAwV06bgG0oEo
Wm9FnjMsfvwm0rUNYFlZ+TOtCEhmhtFp+Tsx9jPCuOd5h2emGdSKD8A6jtwh
Na7oQ8RtLEEqwAn44orENa1ibOkxMiiiFpmmJkwgZPOG/zMCjXIrrhDWTDUO
ZaPx/lEQoInJoE2i43VN/HTGCCw8dKQAwg0jsEXau5ixD0GUothqvuX3B9ta
oeoFAIvUPEq35YulprMM7ThdKodSHvhnwKG82dCsodRwY428kg2xM/UjiTEN
og4B6zzZfPhMxFlOSFX4MnrqkAS+8Jamhy1GgoHkEMrsT5+/ofjCx0HjKbT5
NuA2V/lmzgJLl3jIERadLzuTYnKGWxVJcGLkWXlEPYLbiaKzbJb2sYxt+Kt5
OxQqC1MCAwEAAQ==";

    }
}