using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class MobileController : Controller
    {
        // GET: Mobile
        public ActionResult android()
        {
            
            string fullPath = Request.MapPath("~/Repository/android/com.mussikalda.mussika.apk");
            byte[] fileBytes = System.IO.File.ReadAllBytes(fullPath);
            string fileName = "com.mussikalda.mussika.apk";
            return File(fileBytes,"APK", fileName);
        }
    }
}