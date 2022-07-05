using ASP_Mussika.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class ProvedorTurismoController : Controller
    {
        // GET: ProvedorTurismo
        public ActionResult Index()
        {
            return View();
        }

        public List<TurismoViewModel> turismoList()
        {
            List<TurismoViewModel> listaArtigos = new List<TurismoViewModel>();

            using (var db = new mussika_bdEntities())
            {
                long usuario = long.Parse(Session["idusario"].ToString());
                var artigos = db.turismoes.Where(e => e.id_provedor == usuario).OrderByDescending(P => P.id); ;


                foreach (var model in artigos)
                {
                    TurismoViewModel ProVM = new TurismoViewModel()
                    {
                        id = model.id,
                        data_cadastro = DateTime.Now,
                        descricao = model.descricao,
                        foto_capa = "noimage.png",
                        id_distrito = (int)model.id_distrito,
                        inactivo = (bool)model.inactivo,
                        localizacao = model.localizacao,
                        nome = model.nome,
                        nome_distrito = model.distrito.nome,

                    };
                    listaArtigos.Add(ProVM);
                }
            }
            return listaArtigos;


        }

        [HttpPost]
        public ActionResult carregarTabelaTurismoByAjax(int draw, int start, int length)
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
                var produtos = turismoList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<TurismoViewModel>;
                Func<TurismoViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome" ? c.nome :
                                           sortColumn == "local" ? c.localizacao :
                                          sortColumn == "nome_distrito" ? c.nome_distrito



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