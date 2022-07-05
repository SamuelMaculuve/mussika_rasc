using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class PdfController : Controller
    {
        // GET: Pdf
        public ActionResult Index(string filename)
        {
            //string fullPath = Request.MapPath("~/Repository/obras/"+filename);
            //var myfile = System.IO.File.ReadAllBytes(fullPath);
            //string docBase64 = "data:application/pdf;base64," + Convert.ToBase64String(myfile);

            ViewBag.filename = filename;
            return View();
        }
        public ActionResult Embed(string filename)
        {
            
            ViewBag.filename = filename;
            return View();
        }

        public ActionResult getPdf(string filename)
        {
            string fullPath = Request.MapPath("~/Repository/obras/" + filename);
            var myfile = System.IO.File.ReadAllBytes(fullPath);
            string docBase64 = "data:application/pdf;base64," + Convert.ToBase64String(myfile);
            return Content(docBase64);
        }
        public FileContentResult DownloadContent(string filename)
        {


            string fullPath = Request.MapPath("~/Repository/obras/"+ filename);
            var myfile = System.IO.File.ReadAllBytes(fullPath);
            return new FileContentResult(myfile, "application/pdf");
        }
    }
}