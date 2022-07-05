using ASP_Mussika.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class segurancaController : Controller
    {
        // GET: seguranca
        public ActionResult Index()
        {
            EmpresaViewModel nova = new EmpresaViewModel();
            
            using (var db = new mussika_bdEntities())
            {
                var empresa = db.empresas.First();

                if (empresa != null)
                {
                    nova.id = empresa.id;
                    nova.descricao = empresa.descricao;
                    nova.email = empresa.email;
                    nova.endereco = empresa.endereco;
                    nova.telefone = empresa.telefone;
                    nova.website = empresa.website;
                    nova.seguranca = empresa.seguranca;
                    nova.comopagar = empresa.como_pagar;
                }
               
                return View(nova);
            }
            
        }

        public ActionResult salvar(EmpresaViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {

                    var empresa = db.empresas.Where(e => e.id == model.id).SingleOrDefault();
                    empresa.seguranca = model.seguranca;
                    db.SaveChanges();
                    return Content("true");
                }
            }
            catch (Exception)
            {

                return Redirect("false");
            }
        }
    }
}