using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASP_Mussika.Models;

namespace ASP_Mussika.Controllers
{
    public class EmpresaController : Controller
    {
        // GET: Empresa
        public ActionResult Index()
        {
            using(var db = new mussika_bdEntities())
            {
                var empresa = db.empresas.First();
                if (empresa != null)
                {
                    EmpresaViewModel nova = new EmpresaViewModel()
                    {
                        id=empresa.id,
                        descricao = empresa.descricao,
                        email = empresa.email,
                        endereco = empresa.endereco,
                        telefone = empresa.telefone,
                        website = empresa.website,
                    };
                    return View("Editar",nova);

                }
                return View();
            }
           
        }

        public ActionResult salvar(EmpresaViewModel model)
        {
            try
            {
                using(var db=new mussika_bdEntities())
                {
                    if (model.id == 0)
                    {
                        empresa nova =new empresa() {
                        descricao=model.descricao,
                        email=model.email,
                        endereco=model.endereco,
                        telefone=model.telefone,
                        website=model.website,
                        };
                        db.empresas.Add(nova);
                        db.SaveChanges();
                    }
                    else
                    {
                        var empresa = db.empresas.Where(e => e.id == model.id).SingleOrDefault();
                        empresa.descricao = model.descricao;
                        empresa.email = model.email;
                        empresa.endereco = model.endereco;
                        empresa.telefone = model.telefone;
                        empresa.website = model.website;
                        db.SaveChanges();

                        
                    }
                }
            }
            catch (Exception ex)
            {

                return Content("false");
            }

            return Content("true");
        }
        public ActionResult comopagar()
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

        public ActionResult salvarComoPagar(EmpresaViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {

                    var empresa = db.empresas.Where(e => e.id == model.id).SingleOrDefault();
                    empresa.como_pagar = model.comopagar;
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