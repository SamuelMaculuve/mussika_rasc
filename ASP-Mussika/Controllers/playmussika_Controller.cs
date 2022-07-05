using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class playmussikaController : Controller
    {
        // GET: playmussika_
        public ActionResult buscar_musicas()
        {
            return View();
        }
    }
}