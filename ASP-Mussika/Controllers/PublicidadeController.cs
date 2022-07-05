using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASP_Mussika.Models;
using PagedList;

namespace ASP_Mussika.Controllers
{
    public class PublicidadeController : Controller
    {
        // GET: Publicidade
        public ActionResult Index()
        {
            return View();
        }

        public List<publicidadeViewModel> PacotesList()
        {
            List<publicidadeViewModel> listaPublicidade = new List<publicidadeViewModel>();

            using (var db = new mussika_bdEntities())
            {
                var publicidades = db.pacote_subscricao.Where(t => t.activo == true).OrderByDescending(P => P.id);


                foreach (var model in publicidades)
                {
                    publicidadeViewModel ProVM = new publicidadeViewModel()
                    {

                        id = model.id,
                        nome = model.nome,
                        preco_por_mes = (decimal)model.preco_por_mes,

                    };
                    listaPublicidade.Add(ProVM);
                }
            }
            return listaPublicidade;


        }
        public ActionResult carregarTabelaPacotesByAjax(int draw, int start, int length)
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
                var pacotes = PacotesList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    pacotes = pacotes.Where(u => u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = pacotes.Count();
                // 3. Sorting  
                var filteredData = pacotes as IEnumerable<publicidadeViewModel>;
                Func<publicidadeViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome" ? c.nome :
                                          sortColumn == "preco_por_mes" ? c.preco_por_mes.ToString() : c.nome);


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
        public ActionResult criar()
        {
            return View();
        }

        public ActionResult salvar(publicidadeViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var pacote = db.pacote_subscricao.Where(p => p.nome.Trim().ToLower() == model.nome.Trim().ToLower() && p.activo == true).SingleOrDefault();
                    if (pacote != null)
                    {
                        return Content("existe");
                    }
                    pacote_subscricao novo = new pacote_subscricao()
                    {
                        activo = true,
                        nome = model.nome,
                        preco_por_mes = model.preco_por_mes,
                    };
                    db.pacote_subscricao.Add(novo);
                    db.SaveChanges();
                    return Content(novo.id.ToString());
                }
            }
            catch (Exception)
            {

                return Content("false");
            }
        }

        public ActionResult addItensPacote(int id, int? page)
        {
            using (var db = new mussika_bdEntities())
            {
                List<item_pacote_subscricao> itens = null;
                pacote_subscricao pacote = db.pacote_subscricao.Where(p => p.id == id).SingleOrDefault();
                ViewBag.pacote_subscricao = pacote;
                ViewBag.id_pacote = id;
                itens = db.item_pacote_subscricao.Where(q => q.id_pacote_subscricao == id).ToList();
                int pageSize = 3;
                int pageNumber = (page ?? 1);
                return View(itens.ToPagedList(pageNumber, pageSize));

            }

        }

        public ActionResult CriarVantagem(int id)
        {
            ViewBag.id_pacote = id;
            return View();
        }

        public ActionResult salvarVantagem(publicidadeViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    item_pacote_subscricao nova = new item_pacote_subscricao()
                    {
                        activo=true,
                        id_pacote_subscricao=model.id_pacote_subscricao,
                        item_nome=model.item_nome,
                        
                    };
                    db.item_pacote_subscricao.Add(nova);
                    db.SaveChanges();
                    return Content("true");
                }
            }
            catch (Exception)
            {

                return Content("false");
            }
        }

        public ActionResult EditarBeneficio(int id)
        {
            try
            {
                using(var db=new mussika_bdEntities())
                {
                    var item = db.item_pacote_subscricao.Where(p => p.id == id).SingleOrDefault();
                    ViewBag.nome_item = item.item_nome;
                    ViewBag.id = item.id;
                    ViewBag.id_pacote = item.id;
                    ViewBag.activo = item.activo;
                }
            }
            catch (Exception)
            {

                return Redirect("Error/InternalServerError");
            }
            return View();
        }

        public ActionResult SalvarAlteracoes(publicidadeViewModel model)
        {
            try
            {
                using(var db=new mussika_bdEntities())
                {
                    var item = db.item_pacote_subscricao.Where(p => p.id == model.id_item).SingleOrDefault();
                    item.item_nome = model.item_nome;
                    item.activo = model.activo;

                    db.SaveChanges();
                    return Content(item.id_pacote_subscricao.ToString());
                }
            }
            catch (Exception)
            {

                return Content("false");
            }
        }
        
        public ActionResult editarPacote( int id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var item = db.pacote_subscricao.Where(p => p.id == id).SingleOrDefault();
                    ViewBag.nome = item.nome;
                    ViewBag.preco = item.preco_por_mes;
                    ViewBag.id = item.id;                  
                    ViewBag.activo = item.activo;
                }
            }
            catch (Exception)
            {

                return Redirect("Error/InternalServerError");
            }
            return View();
        }

        public ActionResult salvarAlteracoesPacote(publicidadeViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var item = db.pacote_subscricao.Where(p => p.id == model.id).SingleOrDefault();
                    item.nome = model.nome;
                    item.activo = model.activo;
                    item.preco_por_mes = model.preco_por_mes;

                    db.SaveChanges();
                    return Content(item.id.ToString());
                }
            }
            catch (Exception)
            {

                return Content("false");
            }
        }
    }
}