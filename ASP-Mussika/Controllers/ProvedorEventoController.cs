using ASP_Mussika.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class ProvedorEventoController : Controller
    {
        // GET: ProvedorEvento
        public ActionResult Index()
        {
            return View();
        }
        public List<EventoViewModel> EventoList()
        {
            List<EventoViewModel> listaArtigos = new List<EventoViewModel>();

            using (var db = new mussika_bdEntities())
            {
                long usuario = long.Parse(Session["idusario"].ToString());
                var artigos = db.eventoes.Where(e=>e.id_provedor==usuario).OrderByDescending(P => P.id ); ;


                foreach (var model in artigos)
                {
                    EventoViewModel ProVM = new EventoViewModel()
                    {
                        id = model.id,
                        adiado = (bool)model.adiado,
                        data_cadastro = DateTime.Now,
                        //data_evento = (DateTime)model.data_evento,
                        data_evento_convertido = DateTime.Now.Date.ToString("MM-dd-yyyy"),
                        descricao = model.descricao,
                        foto_capa = "noimage.png",
                        id_distrito = (int)model.id_distrito,
                        inactivo = (bool)model.inactivo,
                        local = model.local,
                        nome = model.nome,
                        realizado = (bool)model.realizado,
                        nome_distrito = model.distrito.nome,
                    };
                    listaArtigos.Add(ProVM);
                }
            }
            return listaArtigos;


        }

        [HttpPost]
        public ActionResult carregarTabelaEventosByAjax(int draw, int start, int length)
        {
            // Search Value  
            string search = Request.Form.GetValues("search[value]").FirstOrDefault();
            // Sort columns value  
            var sortColumn = Request.Form.GetValues("columns[" + Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault();
            var sortColumnDir = Request.Form.GetValues("order[0][dir]").FirstOrDefault();
            if (Request.IsAjaxRequest())
            {
                int pageSize = length != null ? Convert.ToInt32(length) : 0;
                int skip = start != null ? Convert.ToInt32(start) : 0;
                int recordsTotal = 0;
                int recordFilteredTotal = 0;
                // Get Employee Records.   
                var produtos = EventoList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<EventoViewModel>;
                Func<EventoViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome" ? c.nome :
                                           sortColumn == "local" ? c.local :
                                          sortColumn == "nome_distrito" ? c.nome_distrito :
                                          sortColumn == "data_evento" ? c.data_evento_convertido


                                          : c.nome);
                if (sortColumnDir == "asc")
                    filteredData = filteredData.OrderBy(orderingFunction);
                else
                    filteredData = filteredData.OrderByDescending(orderingFunction);
                // 4. Filtering  
                filteredData = filteredData.Skip(skip).Take(pageSize).ToList();
                // 5. Get the filtered record count  
                recordFilteredTotal = filteredData.Count();
                return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordFilteredTotal, data = filteredData }, JsonRequestBehavior.AllowGet);
            }
            return View();
        }

        public ActionResult Bilhetes()
        {
            return View();

        }

        public List<BilheteViewModel> BilhetesList()
        {
            List<BilheteViewModel> listaArtigos = new List<BilheteViewModel>();

            using (var db = new mussika_bdEntities())
            {
                long usuario = long.Parse(Session["idusario"].ToString());
                var artigos = db.eventoes.Where(e => e.id_provedor == usuario&&e.realizado==false).OrderByDescending(P => P.id); ;


                foreach (var model in artigos)
                {
                    List<evento_bilhete> bilhetes = db.evento_bilhete.Where(a => a.id_evento == model.id).ToList();
                    foreach(var item in bilhetes)
                    {
                        BilheteViewModel ProVM = new BilheteViewModel()
                        {
                            id = model.id,
                            nome_evento = item.evento.nome,
                            token = item.token,
                            vip = item.vip,
                            nome_usuario = model.Usuario.nome,

                        };
                        if (item.vip == true) { ProVM.tipo = "V.I.P"; } else { ProVM.tipo = "NORMAL"; }
                        listaArtigos.Add(ProVM);
                    }
                   
                }
            }
            return listaArtigos;


        }

        [HttpPost]
        public ActionResult carregarTabelaEventosBilheteByAjax(int draw, int start, int length)
        {
            // Search Value  
            string search = Request.Form.GetValues("search[value]").FirstOrDefault();
            // Sort columns value  
            var sortColumn = Request.Form.GetValues("columns[" + Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault();
            var sortColumnDir = Request.Form.GetValues("order[0][dir]").FirstOrDefault();
            if (Request.IsAjaxRequest())
            {
                int pageSize = length != null ? Convert.ToInt32(length) : 0;
                int skip = start != null ? Convert.ToInt32(start) : 0;
                int recordsTotal = 0;
                int recordFilteredTotal = 0;
                // Get Employee Records.   
                var produtos = BilhetesList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.token.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<BilheteViewModel>;
                Func<BilheteViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome_evento" ? c.nome_evento :
                                           sortColumn == "token" ? c.token :
                                          sortColumn == "nome_usuario" ? c.nome_usuario 
                                          : c.nome_evento);
                if (sortColumnDir == "asc")
                    filteredData = filteredData.OrderBy(orderingFunction);
                else
                    filteredData = filteredData.OrderByDescending(orderingFunction);
                // 4. Filtering  
                filteredData = filteredData.Skip(skip).Take(pageSize).ToList();
                // 5. Get the filtered record count  
                recordFilteredTotal = filteredData.Count();
                return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordFilteredTotal, data = filteredData }, JsonRequestBehavior.AllowGet);
            }
            return View();
        }
    }
}