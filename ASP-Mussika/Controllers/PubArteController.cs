using ASP_Mussika.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class PubArteController : Controller
    {
        // GET: PubArte
        public ActionResult Index(int? page)
        {
            List<categoria_obra_arte> model_ = new List<categoria_obra_arte>();
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var eventos = db.categoria_obra_arte.ToList(); ;
                    foreach (var model in eventos)
                    {


                        model_.Add(model);

                    }
                }
            }
            catch (Exception)
            {

                return Redirect("/Error/InternalServerError");
            }
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(model_.ToPagedList(pageNumber, pageSize));
        }
    }
}