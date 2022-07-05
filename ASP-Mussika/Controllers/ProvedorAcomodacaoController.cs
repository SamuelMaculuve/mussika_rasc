using ASP_Mussika.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASP_Mussika.Models;

namespace ASP_Mussika.Controllers
{
    public class ProvedorAcomodacaoController : Controller
    {
        // GET: ProvedorAcomodacao
        public ActionResult Index(long id)
        {
            return View();
        }

        public List<AcomodacaoViewModel> AcomodacaoList()
        {
            List<AcomodacaoViewModel> listaAcomodacao = new List<AcomodacaoViewModel>();
            long usuario = long.Parse(Session["idusario"].ToString());
            using (var db = new mussika_bdEntities())
            {
                var acomodacoes = db.acomodacaos.Where(p => p.Inactivo == false && p.id_provedor == usuario).OrderByDescending(P => P.id); ;


                foreach (var model in acomodacoes)
                {
                    AcomodacaoViewModel ProVM = new AcomodacaoViewModel()
                    {
                        id_distrito = (int)model.id_distrito,
                        nome = model.nome,
                        id_acomodacao_tipo = (int)model.id_acomodacao_tipo,
                        email = model.email,
                        descricao = model.descricao,
                        endereco = model.endereco,
                        foto_capa = model.foto_capa,
                        mapa = model.mapa,
                        telefone = model.telefone,
                        website = model.website,
                        Inactivo = (model.Inactivo ?? false),
                        nomeDistrito = model.distrito.nome,
                        id = model.id,
                        nomeAcomodacaoTipo = model.acomodacao_tipo.tipo,
                    };

                    listaAcomodacao.Add(ProVM);
                }
            }
            return listaAcomodacao;


        }

        [HttpPost]
        public ActionResult carregarTabelaAcomodacaoByAjax(int draw, int start, int length)
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
                var produtos = AcomodacaoList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<AcomodacaoViewModel>;
                Func<AcomodacaoViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome" ? c.nome :
                                          sortColumn == "nomeDistrito" ? c.nomeDistrito :
                                          sortColumn == "nomeRestauranteTipo" ? c.nomeAcomodacaoTipo.ToString() :
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

        public ActionResult Reservas()
        {
            using (var db = new mussika_bdEntities())
            {
                long usuario = long.Parse(Session["idusario"].ToString());

                List<acomodacao_quarto> quartos = db.acomodacao_quarto.Where(a => a.acomodacao.id_provedor == usuario).ToList();
                List<acomodacao_reserva> lista_total = new List<acomodacao_reserva>();
                List<acomodacao_reserva> lista_pendentes = new List<acomodacao_reserva>();
                foreach(var items in quartos)
                {
                    List<acomodacao_reserva> reservas_totais = db.acomodacao_reserva.Where(a => a.id_acomodacao_quarto == items.id).ToList();
                    lista_total.AddRange(reservas_totais);
                    List<acomodacao_reserva> reservas_Pendentes = db.acomodacao_reserva.Where(a => a.id_acomodacao_quarto == items.id&&a.confirmado==false&&a.cancelado==false).ToList();
                    lista_pendentes.AddRange(reservas_Pendentes);
                }
                ViewBag.total = lista_total.Count();
                ViewBag.pendentes = lista_pendentes.Count();
            }
            return View();
        }

        public List<reserva_acomodacaoViewModel> ReservasList()
        {
            List<reserva_acomodacaoViewModel> listaUsuarios = new List<reserva_acomodacaoViewModel>();

            using (var db = new mussika_bdEntities())
            {
                long id_provedor = long.Parse(Session["idusario"].ToString());
                var usuarios = db.acomodacao_reserva.Where(a => a.confirmado == false && a.cancelado == false);

                foreach (var model in usuarios)
                {
                    var quarto = db.acomodacao_quarto.Where(a => a.id == model.id_acomodacao_quarto).SingleOrDefault();
                    if (quarto.acomodacao.id_provedor != id_provedor)
                    {
                        continue;
                    }
                    reserva_acomodacaoViewModel ProVM = new reserva_acomodacaoViewModel()
                    {
                        id = model.id,
                        confirmado = model.confirmado ?? false,
                        cancelado = model.cancelado ?? false,
                        data_saida = model.data_saida,
                        data_chegada = model.data_entrada,
                        nome = model.nome_hospede,

                    };
                    listaUsuarios.Add(ProVM);
                }
            }
            return listaUsuarios;


        }

        [HttpPost]
        public ActionResult carregarTabelaReservasByAjax(int draw, int start, int length)
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
                var produtos = ReservasList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<reserva_acomodacaoViewModel>;
                Func<reserva_acomodacaoViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome" ? c.nome :
                                          sortColumn == "data_chegada" ? c.data_chegada :
                                          sortColumn == "data_saida" ? c.data_saida



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