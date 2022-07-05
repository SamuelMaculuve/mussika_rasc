using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;


namespace ASP_Mussika.Models
{
    public class ClasseGeralPortal
    {

        //get RandomString

        private static IEnumerable<string> RandomStrings(
     string allowedChars,
     int minLength,
     int maxLength,
     int count,
     Random rng)
        {
            char[] chars = new char[maxLength];
            int setLength = allowedChars.Length;

            while (count-- > 0)
            {
                int length = rng.Next(minLength, maxLength + 1);

                for (int i = 0; i < length; ++i)
                {
                    chars[i] = allowedChars[rng.Next(setLength)];
                }

                yield return new string(chars, 0, length);
            }
        }


        public static string sendSMSForOneNumber(string msg, string number)
        {
            String message = HttpUtility.UrlEncode(msg);
            message = msg;
            if (number.Length == 9) { number = "258" + number; }

            using (var wb = new WebClient())
            {
                byte[] response = wb.UploadValues("http://api.txtlocal.com/send/", new NameValueCollection()
                {
                {"username" , "isumbane@mozsistemas.co.mz"},
                {"hash" , "d7b53517560f1ab34f918babd3e8aa787bb540d17e82acab737e34b0d39297b0"},
                {"numbers" , number},
                {"message" , message},
                {"sender" , "PortalNCL"}
                });
                string result = System.Text.Encoding.UTF8.GetString(response);
                return result;
            }
        }


        public static string sendEmailForOneAddress(string email_destino, string assunto, string msg)
        {
            try
            {

                //MailMessage mail = new MailMessage();
                //SmtpClient SmtpServer = new SmtpClient("usrv1.mozdomains.com");

                //mail.From = new MailAddress("suporte@portalnacala.co.mz");
                //mail.To.Add(email_destino);
                //mail.Subject = assunto;
                //mail.Body = msg;
                ////just test
                //Attachment at = new Attachment(@"D:\GOOGLE DRIVE\Portal Nacala\ASP.NET Portal Nacala\ASP.NET Portal Nacala\Repositorio\Imagem\logo_Moz Sistemas.jpg");
                //mail.Attachments.Add(at);
                ////
                //mail.Priority = MailPriority.Normal;
                //mail.IsBodyHtml = true;
                //mail.BodyEncoding = System.Text.Encoding.UTF8;
                //mail.SubjectEncoding = System.Text.Encoding.Default;
                ////SmtpServer.Port = 465;
                //SmtpServer.Credentials = new System.Net.NetworkCredential("suporte@portalnacala.co.mz", "port@ln@c@la18");
                //SmtpServer.EnableSsl = false;
                //SmtpServer.Send(mail);
                //return "Email com código de autenticação enviado, mas pode estar na pasta SPAM.";


                //new mail
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("mail.mozsistemas.co.mz");

                mail.From = new MailAddress("siversa@mozsistemas.co.mz");
                mail.To.Add(email_destino);
                mail.Subject = assunto;
                mail.Body = msg;
                //just test
                Attachment at = new Attachment(@"D:\GOOGLE DRIVE\Portal Nacala\ASP.NET Portal Nacala\ASP.NET Portal Nacala\Repositorio\Imagem\logo_Moz Sistemas.jpg");
                mail.Attachments.Add(at);
                //
                mail.Priority = MailPriority.Normal;
                mail.IsBodyHtml = true;
                mail.BodyEncoding = System.Text.Encoding.UTF8;
                mail.SubjectEncoding = System.Text.Encoding.Default;
                //SmtpServer.Port = 465;
                SmtpServer.Credentials = new System.Net.NetworkCredential("siversa@mozsistemas.co.mz", "99reimarte044#*");
                SmtpServer.EnableSsl = false;
                SmtpServer.Send(mail);
                return "Email com código de autenticação enviado, mas pode estar na pasta SPAM.";



            }
            catch (Exception ex)
            {
                string erro = ex.Message.ToString();
                return "Erro ao enviar e-mail.";
            }
        }

        //upload and compress
        public static bool Compressimage(Stream sourcePath, string targetPath, String filename, float maxHeight = 1200.0f, float maxWidth = 1200.0f)
        {
            try
            {
                using (var image = Image.FromStream(sourcePath))
                {
                    //maxHeight = 1200.0f;
                    //maxWidth = 1200.0f;
                    int newWidth;
                    int newHeight;
                    string extension;
                    Bitmap originalBMP = new Bitmap(sourcePath);
                    int originalWidth = originalBMP.Width;
                    int originalHeight = originalBMP.Height;

                    if (originalWidth > maxWidth || originalHeight > maxHeight)
                    {
                        // To preserve the aspect ratio  
                        float ratioX = (float)maxWidth / (float)originalWidth;
                        float ratioY = (float)maxHeight / (float)originalHeight;
                        float ratio = Math.Min(ratioX, ratioY);
                        newWidth = (int)(originalWidth * ratio);
                        newHeight = (int)(originalHeight * ratio);
                    }
                    else
                    {
                        newWidth = (int)originalWidth;
                        newHeight = (int)originalHeight;

                    }

                    Bitmap bitMAP1 = new Bitmap(originalBMP, newWidth, newHeight);
                    Graphics imgGraph = Graphics.FromImage(bitMAP1);
                    extension = Path.GetExtension(targetPath).ToLower();

                    imgGraph.SmoothingMode = SmoothingMode.AntiAlias;
                    imgGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    imgGraph.DrawImage(originalBMP, 0, 0, newWidth, newHeight);
                    bitMAP1.Save(targetPath, image.RawFormat);
                    bitMAP1.Dispose();
                    imgGraph.Dispose();
                    originalBMP.Dispose();

                }

                return true;
            }
            catch (Exception)
            {
                return false;

            }
        }



        //delete file in the server
        public static void DeleteFile(string path)
        {
            try
            {
                if (System.IO.File.Exists(path)) { System.IO.File.Delete(path); }
            }
            catch (Exception) { }
        }



    }
}