using ASP_Mussika.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class ProvedorArteCulturaController : Controller
    {
        // GET: ProvedorArteCultura
        public ActionResult Index(long id)
        {
            return View();
        }

        public List<AutorArteViewModel> AutorList()
        {
            List<AutorArteViewModel> listaAutores = new List<AutorArteViewModel>();

            using (var db = new mussika_bdEntities())
            {
                long usuario = long.Parse(Session["idusario"].ToString());
                var obras = db.obra_arte.Where(o => o.id_provedor == usuario);
                var autores = db.artista_obra.Where(a=>a.id_provedor==usuario);
                //foreach(var item in obras)
                //{
                //    var record = db.artista_obra.Where(a => a.id == item.id_artista_obra).SingleOrDefault();
                //    if (!autores.Contains(record))
                //    {
                //        autores.Add(record);
                //    }
                    
                //}

                
                foreach (var model in autores)
                {
                    AutorArteViewModel ProVM = new AutorArteViewModel()
                    {
                        id_distrito = (int)model.id_distrito,
                        nome = model.nome,
                        id = model.id,
                        NomeDistrito = model.distrito.nome,
                        fotografia = model.fotografia,
                        telefone = model.telefone,
                    };
                    listaAutores.Add(ProVM);
                }
            }
            return listaAutores;


        }

        [HttpPost]
        public ActionResult carregarTabelaAutoresByAjax(int draw, int start, int length)
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
                var produtos = AutorList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<AutorArteViewModel>;
                Func<AutorArteViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome" ? c.nome :
                                          sortColumn == "NomeDistrito" ? c.NomeDistrito :
                                          sortColumn == "telefone" ? c.telefone.ToString()


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
    }
}