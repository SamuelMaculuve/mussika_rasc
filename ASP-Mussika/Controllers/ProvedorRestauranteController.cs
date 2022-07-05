using ASP_Mussika.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class ProvedorRestauranteController : Controller
    {
        // GET: ProvedorRestaurante
        public ActionResult Index(long id)
        {
            return View();
        }

        public List<RestViewModel> produtoList()
        {
            List<RestViewModel> listaProduto = new List<RestViewModel>();
            long usuario = long.Parse(Session["idusario"].ToString());
            using (var db = new mussika_bdEntities())
            {
                var produtos = db.restaurantes.Where(p => p.activo == true && p.id_provedor== usuario).OrderByDescending(P => P.id);


                foreach (var model in produtos)
                {
                    RestViewModel ProVM = new RestViewModel()
                    {
                        id_distrito = (int)model.id_distrito,
                        nome = model.nome,
                        id_restaurante_tipo = (int)model.id_restaurante_tipo,
                        email = model.email,
                        descricao = model.descricao,
                        endereco = model.endereco,
                        foto_capa = model.foto_capa,
                        mapa = model.mapa,
                        telefone = model.telefone,
                        website = model.website,
                        activo = true,
                        nomeDistrito = model.distrito.nome,
                        id = model.id,
                        nomeRestauranteTipo = model.restaurante_tipo.tipo,
                    };
                    listaProduto.Add(ProVM);
                }
            }
            return listaProduto;


        }

        [HttpPost]
        public ActionResult carregarTabelaRestaurantesByAjax(int draw, int start, int length)
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
                var produtos = produtoList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<RestViewModel>;
                Func<RestViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome" ? c.nome :
                                          sortColumn == "nomeDistrito" ? c.nomeDistrito :
                                          sortColumn == "nomeRestauranteTipo" ? c.nomeRestauranteTipo.ToString() :
                                          sortColumn == "email" ? c.email.ToString() :

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