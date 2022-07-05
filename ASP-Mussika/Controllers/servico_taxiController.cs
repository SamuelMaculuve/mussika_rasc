
using ASP_Mussika.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class servico_taxiController : Controller
    {
        // GET: servico_taxi
        public ActionResult listar()
        {

            List<taxi> taxis = new List<taxi>();
            List<distrito> distritos = new List<distrito>();

            try
            {

                using (var uow = new mussika_bdEntities())
                {
                    taxis = uow.taxis.ToList();
                    distritos = uow.distritoes.ToList();
                }


            }
            catch (Exception) { }

            ViewBag.taxis = taxis;
            ViewBag.distritos = distritos;

            return View();
        }

        public ActionResult listar_partial(int id_distrito = 0, int categoria=0, string indice = "0", string perpage = "6")
        {
            int indc = int.Parse(indice);
            int pp = int.Parse(perpage);


            List<taxi> lista_taxis = new List<taxi>();
            List<TaxiViewModel> model = new List<TaxiViewModel>();

            try
            {
                using (var uow = new mussika_bdEntities())
                {

                    lista_taxis = uow.taxis.ToList();
                    if (id_distrito > 0) { lista_taxis = lista_taxis.Where(x => x.id_distrito == id_distrito).ToList(); }
                    if (categoria > 0) { lista_taxis = lista_taxis.FindAll(t => t.id_categoria == categoria).ToList(); }
                    foreach (taxi s in lista_taxis)
                    {
                        TaxiViewModel sd = new TaxiViewModel();
                        sd.id = s.id;
                        sd.nome = s.nome;
                        sd.praca_fixa = s.praca_fixa;
                        sd.condutor = s.condutor;
                        sd.telefone = s.telefone;
                        sd.id_distrito = (int)s.id_distrito;
                        sd.nomeDistrito = s.distrito.nome;
                        model.Add(sd);
                    }
                }

            }
            catch (Exception) { }

            ViewBag.current_page = indice;
            ViewBag.records_perpage = pp;
            ViewBag.lista_taxis = model;

            return PartialView("~/Views/servico_taxi/partials/listar_taxi_partials.cshtml", model.Skip(indc).Take(pp).ToList());
        }
        
        public ActionResult Index(int? page)
        {
            List<taxi_categoria> model_ = new List<taxi_categoria>();
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var eventos = db.taxi_categoria.ToList();
                    foreach (var model in eventos)
                    {
                        
                       
                        model_.Add(model);

                    }
                }
            }
            catch (Exception ex )
            {

                return Redirect("/Error/InternalServerError");
            }
            int pageSize = 5;
            int pageNumber = (page ?? 1);
            return View(model_.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult solicitar(long id)
        {
            return View();
        }



    }
}