

using ASP_Mussika.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{

    public class administracaoController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            try
            {
                if (Session["tipo"].ToString() == "3"|| Session["tipo"].ToString() == "5")
                {

                    base.OnActionExecuting(filterContext);
                }

                else
                {
                    filterContext.Result = new RedirectResult("~/inicio/principal");
                }
            }
            catch (Exception)
            {

                filterContext.Result = new RedirectResult("~/inicio/principal");
            }


        }
        public List<subscricao_view_model> SubscricoesList()
        {
            List<subscricao_view_model> listaArtigos = new List<subscricao_view_model>();

            using (var db = new mussika_bdEntities())
            {
                long usuario = long.Parse(Session["idusario"].ToString());
                var artigos = db.pagamento_subscricao.Where(e => e.confirmado == true);


                foreach (var model in artigos)
                {
                    //DateTime add = model.data_cadastro.AddDays(30);
                    //if (add <= DateTime.Now) { continue; }
                    List<evento_bilhete> bilhetes = db.evento_bilhete.Where(a => a.id_evento == model.id).ToList();

                    subscricao_view_model ProVM = new subscricao_view_model()
                    {
                        id = model.id,
                        nome_entidade = model.nome_entidade,
                        validade = model.validade,
                        validade_ = model.validade.Value.ToString("dd-MM-yyyy"),
                        tipo_actividade = model.tipo_actividade,
                        nome_usuario = model.Usuario.usuario1,

                    };

                    listaArtigos.Add(ProVM);


                }
            }
            return listaArtigos;


        }

        [HttpPost]
        public ActionResult carregarTabelaSubscricoesByAjax(int draw, int start, int length)
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
                var produtos = SubscricoesList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.nome_entidade.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<subscricao_view_model>;
                Func<subscricao_view_model, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome_entidade" ? c.nome_entidade :
                                           sortColumn == "validade" ? c.validade_ :
                                          sortColumn == "nome_usuario" ? c.nome_usuario
                                          : c.tipo_actividade);
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
        public ActionResult DetalhesCompra(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var compra = db.compras.Where(c => c.id_compra == id).SingleOrDefault();
                ViewBag.usuario = compra.Usuario;
                return View(compra);
            }

        }
        public ActionResult DashBoard()
        {


            using (var db = new mussika_bdEntities())
            {
                ViewBag.distritos = db.distritoes.Count();
                ViewBag.acomodacoes = db.acomodacaos.Count();
                ViewBag.restaurantes = db.restaurantes.Count();
                ViewBag.artigos = db.artigoes.Count();
                ViewBag.usuarios = db.Usuarios.Count();
                ViewBag.taxis = db.taxis.Count();
            }

            return View();
        }
        public ActionResult Compras(int? page, long id_provedor = 0)
        {
            List<CompraViewModel> listaCompras = new List<CompraViewModel>();
            List<compra> Compras = new List<compra>();


            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var provedores = db.Usuarios.Where(a => a.e_provedor == true && a.autenticado == true).ToList();
                    ViewBag.provedores = provedores;
                    long id_usuario = long.Parse(Session["idusario"].ToString());
                    var vendas = db.compras.OrderByDescending(d => d.id_compra);

                    if (id_provedor == 0)
                    {
                        ViewBag.numero_vendas = vendas.Count();
                        decimal total_receber = 0;
                        foreach (var item in vendas) { total_receber += item.valor ?? 0; }
                        ViewBag.total_receber = string.Format("{0:N} MT", total_receber);

                        foreach (var item in vendas)
                        {
                            string titulo = "";
                            if (item.oque_e == "musica")
                            {
                                using (var dba = new mussika_bdEntities())
                                {
                                    var mus = db.musicas.Where(m => m.id == item.id_produto).SingleOrDefault();
                                    titulo = mus.titulo;
                                }
                            }
                            CompraViewModel compra_ = new CompraViewModel()
                            {
                                descricao = item.descricao + " - " + titulo,
                                valor = item.valor,
                                data_cadastro = item.data_cadastro,
                                modo_pagamento = item.modo_pagamento,
                                confirmado = item.confirmado ?? false,
                                id_compra = item.id_compra,
                                provedor_pago=item.provedor_pago??false,
                            };
                            if (item.descricao != null)
                            {
                                if (item.descricao.Length > 40) { item.descricao = item.descricao.Substring(0, 40) + "..."; } else { item.descricao = item.descricao; }
                            }
                            listaCompras.Add(compra_);
                        }

                    }
                    else
                    {
                        foreach (var item in vendas)
                        {
                            switch (item.oque_e)
                            {
                                case "musica":
                                    if (checkProvedorMusica(item.id_produto, id_provedor)) { Compras.Add(item); };
                                    break;
                                case "musicaVideo":
                                    if (checkProvedorMusica(item.id_produto, id_provedor)) { Compras.Add(item); };
                                    break;
                                case "musicaAlbum":
                                    if (checkProvedorAlbum(item.id_produto, id_provedor)) { Compras.Add(item); };
                                    break;
                                case "restauranteMesa":
                                    if (checkProvedorRestauranteMesa(item.id_produto, id_provedor)) { Compras.Add(item); };
                                    break;
                                case "restaurantePrato":
                                    if (checkProvedorRestauranteMesa(item.id_produto, id_provedor)) { Compras.Add(item); };
                                    break;
                                case "acomodacao":
                                    if (checkProvedorAcomodacao(item.id_produto, id_provedor)) { Compras.Add(item); };
                                    break;
                                case "lojaProduto":
                                    if (checkProvedorLojaProduto(item.id_produto, id_provedor)) { Compras.Add(item); };
                                    break;
                                case "produtoBazar":
                                    if (checkProvedorProdutoBazar(item.id_produto, id_provedor)) { Compras.Add(item); };
                                    break;
                                case "arteCultura":
                                    if (checkProvedorArteCultura(item.id_produto, id_provedor)) { Compras.Add(item); };
                                    break;
                            }
                        }
                        ViewBag.numero_vendas = Compras.Count();
                        decimal total_receber = 0;
                        foreach (var item in Compras) { total_receber += item.valor ?? 0; }
                        ViewBag.total_receber = string.Format("{0:N} MT", total_receber);

                        foreach (var item in Compras)
                        {
                            string titulo = "";
                            if (item.oque_e == "musica")
                            {
                                using (var dba = new mussika_bdEntities())
                                {
                                    var mus = db.musicas.Where(m => m.id == item.id_produto).SingleOrDefault();
                                    titulo = mus.titulo;
                                }
                            }
                            CompraViewModel compra_ = new CompraViewModel()
                            {
                                descricao = item.descricao + " - " + titulo,
                                valor = item.valor,
                                data_cadastro = item.data_cadastro,
                                modo_pagamento = item.modo_pagamento,
                                confirmado = item.confirmado ?? false,
                                provedor_pago = item.provedor_pago ?? false,
                                id_compra = item.id_compra,
                            };
                            listaCompras.Add(compra_);
                        }
                    }


                }
            }
            catch (Exception)
            {

                throw;
            }
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(listaCompras.ToPagedList(pageNumber, pageSize));
        }

        private bool checkProvedorArteCultura(long? id_produto, long id_provedor)
        {
            bool result = false;
            using (var db = new mussika_bdEntities())
            {

                var produto = db.obra_arte.Where(m => m.id == id_produto).SingleOrDefault();
                if (produto.id_provedor == id_provedor)
                    result = true;
                else
                    result = false;
            }
            return result;
        }

        private bool checkProvedorProdutoBazar(long? id_produto, long id_provedor)
        {
            bool result = false;
            using (var db = new mussika_bdEntities())
            {

                var produto = db.artigoes.Where(m => m.id == id_produto).SingleOrDefault();
                if (produto.id_provedorr == id_provedor)
                    result = true;
                else
                    result = false;
            }
            return result;
        }

        private bool checkProvedorLojaProduto(long? id_produto, long id_provedor)
        {
            bool result = false;
            using (var db = new mussika_bdEntities())
            {

                var produto = db.lojas.Where(m => m.id == id_produto).SingleOrDefault();
                if (produto.id_provedor == id_provedor)
                    result = true;
                else
                    result = false;
            }
            return result;
        }

        private bool checkProvedorAcomodacao(long? id_produto, long id_provedor)
        {
            bool result = false;
            using (var db = new mussika_bdEntities())
            {

                var produto = db.acomodacao_quarto.Where(m => m.id == id_produto).SingleOrDefault();
                if (produto.acomodacao.id_provedor == id_provedor)
                    result = true;
                else
                    result = false;
            }
            return result;
        }

        private bool checkProvedorRestauranteMesa(long? id_produto, long id_provedor)
        {
            bool result = false;
            using (var db = new mussika_bdEntities())
            {

                var produto = db.restaurantes.Where(m => m.id == id_produto).SingleOrDefault();
                if (produto.id_provedor == id_provedor)
                    result = true;
                else
                    result = false;
            }
            return result;
        }

        private bool checkProvedorAlbum(long? id_produto, long id_provedor)
        {
            bool result = false;
            using (var db = new mussika_bdEntities())
            {

                var musica = db.musica_album.Where(m => m.id == id_produto).SingleOrDefault();
                if (musica.id_provedor == id_provedor)
                    result = true;
                else
                    result = false;
            }
            return result;
        }

        private bool checkProvedorMusica(long? id_produto, long id_provedor)
        {
            bool result = false;
            using (var db = new mussika_bdEntities())
            {

                var musica = db.musicas.Where(m => m.id == id_produto).SingleOrDefault();
                if (musica.id_provedor == id_provedor)
                    result = true;
                else
                    result = false;
            }
            return result;
        }



        public ActionResult VerCompra(long id)
        {
            string link = "";
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var compra = db.compras.Where(c => c.id_compra == id).SingleOrDefault();
                    switch (compra.oque_e)
                    {
                        case "musica":
                            link = "https://www.mussika.co.mz/PubMusica/Musica?id=" + compra.id_produto;
                            break;
                        case "musicaAlbum":
                            link = "https://www.mussika.co.mz/PubMusica/AlbumDetalhe?id=" + compra.id_produto;
                            break;
                        case "musicaVideo":
                            link = "https://www.mussika.co.mz/PubMusica/video?id=" + compra.id_produto;
                            break;
                        case "acomodacao":
                            link = "https://www.mussika.co.mz/PubAcomodacao/Perfil?id=" + compra.id_produto;
                            break;
                        case "restauranteMesa":
                            link = "https://www.mussika.co.mz/PubRestaurante/Perfil?id=" + compra.id_produto;
                            break;
                        case "restaurantePrato":
                            link = "https://www.mussika.co.mz/PubRestaurante/DetalhesPrato?id=" + compra.id_produto;
                            break;
                        case "produtoBazar":
                            link = "https://www.mussika.co.mz/PubShopMussika/Perfil?id=" + compra.id_produto;
                            break;
                        case "lojaProduto":
                            link = "https://www.mussika.co.mz/PubShopMussika/DetalhesProduto?id=" + compra.id_produto;
                            break;
                        case "arteCultura":
                            link = "https://www.mussika.co.mz/arte_cultura/Perfil?id=" + compra.id_produto;
                            break;
                        case "evento":
                            link = "https://www.mussika.co.mz/Eventos/Detalhes?id=" + compra.id_produto;
                            break;
                        case "farmacia":
                            link = "https://www.mussika.co.mz/PubSaude/DetalhesProduto?id=" + compra.id_produto;
                            break;
                        case "clinica":
                            link = "https://www.mussika.co.mz/PubSaude/Clinica?id=" + compra.id_produto;
                            break;


                    }
                }
            }
            catch (Exception)
            {

                throw;
            }

            return Redirect(link);
        }

        public ActionResult subscricoes()
        {
            return View();
        }
        public ActionResult pagarProvedor(long id)
        {
            try
            {
                using(var db=new mussika_bdEntities())
                {
                    var venda = db.compras.Where(c => c.id_compra == id).SingleOrDefault();

                    decimal comissao_mussika = 0;
                    decimal ganho_provedor = 0;
                   
                    if (venda.oque_e.Contains("musica"))
                    {
                        comissao_mussika = (decimal)venda.valor * (decimal)0.3;
                        ganho_provedor = (decimal)venda.valor - (decimal)comissao_mussika;
                    }
                    else
                    {
                        comissao_mussika = (decimal)venda.valor * (decimal)0.08;
                        ganho_provedor = (decimal)venda.valor - (decimal)comissao_mussika;
                    }
                    venda.total_provedor_pago = ganho_provedor;
                    venda.data_provedor_pago = DateTime.Now;
                    venda.provedor_pago = true;
                    db.SaveChanges();

                };
            }
            catch (Exception)
            {

                return Redirect("~/Error/InternalServerError");
            }
            return Redirect("~/administracao/Compras");
        }
        
    }


}