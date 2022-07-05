using ASP_Mussika.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Metadata.Edm;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class ProvedorController : Controller
    {
        // GET: Provedor
        public ActionResult DashBoard()
        {
            using (var db = new ASP_Mussika.Models.mussika_bdEntities())
            {
                long id = long.Parse(Session["idusario"].ToString());
                usuario_provedor servicos = db.usuario_provedor.Where(u => u.id_usuario == id).SingleOrDefault();
                Session["acomodacao"] = servicos.acomodacao ?? false;
                Session["musica"] = servicos.musica ?? false;
                Session["bazar"] = servicos.bazar ?? false;
                Session["loja"] = servicos.loja ?? false;
                Session["taxi"] = servicos.taxi ?? false;
                Session["restaurante"] = servicos.restaurante ?? false;
                Session["arte_cultura"] = servicos.arte_cultura ?? false;
                Session["evento"] = servicos.evento ?? false;
                Session["turismo"] = servicos.turismo ?? false;
                Session["farmacia"] = servicos.farmacia ?? false;
                Session["clinica"] = servicos.clinica ?? false;
                Session["transportadora"] = servicos.transportadora ?? false;
                Session["pagamento_servico"] = servicos.pagamento_servico ?? false;
            }
            return View();
        }

        public ActionResult DetalhesCompra(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var compra = db.compras.Where(c => c.id_compra == id).SingleOrDefault();
                ViewBag.usuario = compra.Usuario;
                decimal comissao = 0;
                decimal ganho = 0;
                if (compra.oque_e.Contains("musica"))
                {
                    comissao = (decimal)compra.valor * (decimal)0.3;
                    ganho = (decimal)compra.valor - (decimal)comissao;
                }
                else
                {
                    comissao = (decimal)compra.valor * (decimal)0.08;
                    ganho = (decimal)compra.valor - (decimal)comissao;
                }
                ViewBag.comissao = string.Format("{0:N} MT", comissao);
                ViewBag.ganho = string.Format("{0:N} MT", ganho);
                return View(compra);
            }

        }
        public ActionResult vendas(int? page)
        {
            List<CompraViewModel> listaCompras = new List<CompraViewModel>();
            List<compra> Compras = new List<compra>();


            try
            {
                using (var db = new mussika_bdEntities())
                {
                    long id_usuario = long.Parse(Session["idusario"].ToString());
                    usuario_provedor transporta = db.usuario_provedor.Where(a => a.id_usuario == id_usuario).SingleOrDefault();
                   
                    int quant_vendas_transportes = 0;

                    decimal tota_vendas_transporte = 0;
                    decimal tota_vendas_transporte_nao_processado = 0;

                    decimal ganho_receber_transporte = 0;
                    decimal ganho_receber_transporte_nao_processado = 0;

                    decimal comissao_transporte = 0;
                    decimal comissao_transporte_nao_processado = 0;


                    int quant_vendas_transportes_nao_processadas = 0;

                   
                    if (transporta!=null && transporta.transportadora == true)
                    {
                        List<compra> vendas_transportes = db.compras.Where(a => a.oque_e == "transportadora" && a.transportadora.id_provedor == id_usuario).ToList();
                        Compras.AddRange(vendas_transportes);
                        foreach (var item in vendas_transportes)
                        {
                            
                            if (item.provedor_pago == true)
                            {
                                quant_vendas_transportes += 1;
                                tota_vendas_transporte += item.valor ?? 0;
                                var comissao = (decimal)item.valor * (decimal)0.08;
                                ganho_receber_transporte += (decimal)item.valor - (decimal)comissao;
                                comissao_transporte += comissao;

                            }
                            else
                            {
                                quant_vendas_transportes_nao_processadas += 1;
                                tota_vendas_transporte_nao_processado += item.valor ?? 0;
                                var comissao = (decimal)item.valor * (decimal)0.08;
                                ganho_receber_transporte_nao_processado += (decimal)item.valor - (decimal)comissao;
                                comissao_transporte_nao_processado += comissao;
                            }
                            
                        }
                    }
                    ViewBag.total_transporte = tota_vendas_transporte;
                    var vendas = db.compras;
                    foreach (var item in vendas)
                    {
                        
                        switch (item.oque_e)
                        {
                            case "musica":
                                if (checkProvedorMusica(item.id_produto)) { Compras.Add(item); };
                                break;
                            case "musicaVideo":
                                if (checkProvedorMusica(item.id_produto)) { Compras.Add(item); };
                                break;
                            case "musicaAlbum":
                                if (checkProvedorAlbum(item.id_produto)) { Compras.Add(item); };
                                break;
                            case "restauranteMesa":
                                if (checkProvedorRestauranteMesa(item.id_produto)) { Compras.Add(item); };
                                break;
                            case "restaurantePrato":
                                if (checkProvedorRestauranteMesa(item.id_produto)) { Compras.Add(item); };
                                break;
                            case "acomodacao":
                                if (checkProvedorAcomodacao(item.id_produto)) { Compras.Add(item); };
                                break;
                            case "lojaProduto":
                                if (checkProvedorLojaProduto(item.id_produto)) { Compras.Add(item); };
                                break;
                            case "produtoBazar":
                                if (checkProvedorProdutoBazar(item.id_produto)) { Compras.Add(item); };
                                break;
                            case "arteCultura":
                                if (checkProvedorArteCultura(item.id_produto)) { Compras.Add(item); };
                                break;

                        }
                    }
                    ViewBag.numero_vendas = Compras.Count()+ quant_vendas_transportes;
                    ViewBag.numero_vendas_nao_processadas = Compras.Where(c=>c.provedor_pago==false).Count();
                    decimal total_receber = 0;
                    decimal total_receber_nao_processada = 0;

                    decimal total_ganho_provedor = 0;
                    decimal total_ganho_provedor_nao_processada = 0;

                    decimal total_comissao = 0;
                    decimal total_comissao_nao_processada = 0;
                 

                    foreach (var item in Compras)
                    {
                        if (item.tem_entrega == true)
                        {
                           
                            if (item.provedor_pago == true)
                            {
                                total_receber += item.valor??0;
                            }
                            else
                            {
                                total_receber_nao_processada += item.valor??0;
                            }
                        }
                        else {

                            if (item.provedor_pago == true)
                            {
                                total_receber += item.valor ?? 0;
                            }
                            else
                            {
                                total_receber_nao_processada += item.valor ?? 0;
                            }

                           
                        }
                    }
                    ViewBag.total_receber = string.Format("{0:N} MT", total_receber);
                    ViewBag.total_receber_nao_processada = string.Format("{0:N} MT", total_receber_nao_processada);

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
                            provedor_pago=item.provedor_pago??false,
                            id_compra = item.id_compra,
                        };
                        if (item.oque_e.Contains("musica"))
                        {
                            compra_.comissao = (decimal)compra_.valor * (decimal)0.3;
                            compra_.ganho_provedor = (decimal)compra_.valor - (decimal)compra_.comissao;
                        }
                        else
                        {
                            compra_.comissao = (decimal)compra_.valor * (decimal)0.08;
                            compra_.ganho_provedor = (decimal)compra_.valor - (decimal)compra_.comissao;
                        }

                        if (item.provedor_pago == true)
                        {
                            total_comissao += compra_.comissao;
                            total_ganho_provedor += compra_.ganho_provedor;
                        }
                        else
                        {
                            total_comissao_nao_processada += compra_.comissao;
                            total_ganho_provedor_nao_processada += compra_.ganho_provedor;
                        }
                        
                        listaCompras.Add(compra_);
                        ViewBag.total_ganho_provedor = string.Format("{0:N} MT", total_ganho_provedor);
                        ViewBag.total_ganho_provedor_nao_processada = string.Format("{0:N} MT", total_ganho_provedor_nao_processada);
                        ViewBag.total_comissao = string.Format("{0:N} MT", total_comissao);
                        ViewBag.total_comissao_nao_processada = string.Format("{0:N} MT", total_comissao_nao_processada);
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

        private bool checkProvedorArteCultura(long? id_produto)
        {
            bool result = false;
            using (var db = new mussika_bdEntities())
            {
                long id_usuario = long.Parse(Session["idusario"].ToString());

                var produto = db.obra_arte.Where(m => m.id == id_produto).SingleOrDefault();
                if (produto.id_provedor == id_usuario)
                    result = true;
                else
                    result = false;
            }
            return result;
        }

        private bool checkProvedorProdutoBazar(long? id_produto)
        {
            bool result = false;
            using (var db = new mussika_bdEntities())
            {
                long id_usuario = long.Parse(Session["idusario"].ToString());

                var produto = db.artigoes.Where(m => m.id == id_produto).SingleOrDefault();
                if (produto.id_provedorr == id_usuario)
                    result = true;
                else
                    result = false;
            }
            return result;
        }

        private bool checkProvedorLojaProduto(long? id_produto)
        {
            bool result = false;
            using (var db = new mussika_bdEntities())
            {
                long id_usuario = long.Parse(Session["idusario"].ToString());

                var produto = db.lojas.Where(m => m.id == id_produto).SingleOrDefault();
                if (produto.id_provedor == id_usuario)
                    result = true;
                else
                    result = false;
            }
            return result;
        }

        private bool checkProvedorAcomodacao(long? id_produto)
        {
            bool result = false;
            using (var db = new mussika_bdEntities())
            {
                long id_usuario = long.Parse(Session["idusario"].ToString());

                var produto = db.acomodacao_quarto.Where(m => m.id == id_produto).SingleOrDefault();
                if (produto.acomodacao.id_provedor == id_usuario)
                    result = true;
                else
                    result = false;
            }
            return result;
        }

        private bool checkProvedorRestauranteMesa(long? id_produto)
        {
            bool result = false;
            using (var db = new mussika_bdEntities())
            {
                long id_usuario = long.Parse(Session["idusario"].ToString());

                var produto = db.restaurantes.Where(m => m.id == id_produto).SingleOrDefault();
                if (produto.id_provedor == id_usuario)
                    result = true;
                else
                    result = false;
            }
            return result;
        }

        private bool checkProvedorAlbum(long? id_produto)
        {
            bool result = false;
            using (var db = new mussika_bdEntities())
            {
                long id_usuario = long.Parse(Session["idusario"].ToString());

                var musica = db.musica_album.Where(m => m.id == id_produto).SingleOrDefault();
                if (musica.id_provedor == id_usuario)
                    result = true;
                else
                    result = false;
            }
            return result;
        }

        private bool checkProvedorMusica(long? id_produto)
        {
            bool result = false;
            using (var db = new mussika_bdEntities())
            {
                long id_usuario = long.Parse(Session["idusario"].ToString());

                var musica = db.musicas.Where(m => m.id == id_produto).SingleOrDefault();
                if (musica.id_provedor == id_usuario)
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
    }
}