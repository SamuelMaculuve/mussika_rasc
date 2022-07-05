using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class ServicoMussikaController : Controller
    {
        // GET: ServicoMussika
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Academico()
        {
            return View();
        }
        public ActionResult Televisao()
        {
            return View();
        }
        public ActionResult AguaEnergia()
        {
            return View();
        }

    }
}