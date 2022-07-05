using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASP_Mussika.Models;
using PagedList;

namespace ASP_Mussika.Controllers
{
    public class CarrinhoCompraController : Controller
    {
        // GET: CarrinhoCompra
        public ActionResult Index(long id_usuario, int? page)
        {
            List<CarinhoCompraViewModel> listaItens = new List<CarinhoCompraViewModel>();
            try
            {
                using(var db=new mussika_bdEntities())
                {
                    var itens = db.carrinho_compra.Where(c => c.id_usuario == id_usuario && c.activo == true).OrderByDescending(d => d.data_cadastro);
                    foreach(var item in itens)
                    {
                        CarinhoCompraViewModel compra = new CarinhoCompraViewModel()
                        {
                            id = item.id,
                            data_cadastro = (DateTime)item.data_cadastro,
                            activo = item.activo??false,
                            descricao = item.descricao.Length < 200 ? item.descricao : item.descricao.Substring(0, 200),
                            e_acomodacao= item.e_acomodacao ?? false,
                            e_artigo= item.e_artigo ?? false,
                            e_Obra=item.e_obra ?? false,
                            e_Musica=item.e_musica ?? false,
                            e_farmacia_produto = item.e_farmacia_produto ?? false,
                            e_Produto_loja=item.e_loja_produto ?? false,
                            e_restaurante= item.e_restaurante ?? false,
                            e_taxi= item.e_taxi ?? false,
                            id_loja_produto = item.id_loja_produto==null?0:(long)item.id_loja_produto,
                            id_farmacia_produto = item.id_farmacia_produto==null?0:(long)item.id_farmacia_produto,
                            id_Musica=item.id_musica==null?0:(long)item.id_musica,
                            id_acomodacao=item.id_acomodacao==null?0:(long)item.id_acomodacao,
                            id_artigo=item.id_artigo == null ? 0 : (long)item.id_artigo,
                            id_obra=item.id_obra == null ? 0 : (long)item.id_obra,
                            id_quarto=item.id_quarto == null ? 0 : (long)item.id_quarto,
                            id_restaurante=item.id_restaurante == null ? 0 : (long)item.id_restaurante,
                            id_taxi=item.id_taxi == null ? 0 : (long)item.id_taxi,
                            id_usuario=item.id_usuario == null ? 0 : (long)item.id_usuario,
                        };

                        if (item.e_acomodacao == true)
                        {
                            compra.preco = (decimal)item.acomodacao_quarto.custo_diaria;
                            compra.bairro = item.acomodacao.endereco;
                            compra.nome = item.acomodacao.nome;
                            compra.distrito = item.acomodacao.distrito.nome;
                            compra.foto = item.acomodacao.foto_capa;
                        }
                        if (item.e_artigo == true)
                        {
                            compra.preco = (decimal)item.artigo.preco_venda;
                            compra.bairro = item.artigo.bairro;
                            compra.nome = item.artigo.nome;
                            compra.distrito = item.artigo.distrito.nome;
                            compra.foto = item.artigo.foto_capa;
                        }
                        if (item.e_obra == true)
                        {
                            compra.preco = 1200;
                            compra.bairro = "Avenida Marginal";
                            compra.nome = item.obra_arte.titulo;
                            compra.distrito = item.obra_arte.artista_obra.distrito.nome;
                            compra.foto = item.obra_arte.caminho_imagem;
                        }
                        if (item.e_musica == true)
                        {
                            compra.preco = item.musica.preco_venda??0;
                            compra.bairro = item.musica.artista_obra.distrito.nome;
                            compra.nome = item.musica.artista+" - "+item.musica.titulo;
                            compra.distrito = item.musica.artista_obra.distrito.nome;
                            compra.foto = item.musica.caminho_capa1;
                            compra.descricao = "Música";
                        }
                        if (item.e_loja_produto == true)
                        {
                            compra.preco = item.loja_produto.preco_venda ?? 0;
                            compra.bairro = item.loja_produto.loja.bairro;
                            compra.nome = item.loja_produto.nome;
                            compra.distrito = item.loja_produto.loja.distrito.nome;
                            compra.foto = item.loja_produto.foto_capa;
                            compra.descricao = "Produto Loja";
                        }
                        if (item.e_farmacia_produto == true)
                        {
                            compra.preco = item.farmacia_produto.preco_venda ?? 0;
                            compra.bairro = item.farmacia_produto.farmacia.bairro;
                            compra.nome = item.farmacia_produto.nome;
                            compra.distrito = item.farmacia_produto.farmacia.distrito.nome;
                            compra.foto = item.farmacia_produto.foto_capa;
                            compra.descricao = "Produto Farmacia";
                        }
                        if (item.e_Filme == true)
                        {
                            compra.preco = item.filme.preco??0;
                            compra.bairro = item.filme.nacionalidade;
                            compra.nome = item.filme.titulo_original;
                            compra.distrito = item.filme.nacionalidade;
                            compra.foto = item.filme.foto_capa;
                            compra.descricao = "Filme";
                        }
                        if (item.e_evento == true)
                        {
                            compra.preco = item.evento.preco_bilhete ?? 0;
                            compra.bairro = item.evento.local;
                            compra.nome = item.evento.nome;
                            compra.distrito = item.evento.distrito.nome;
                            compra.foto = item.evento.foto_capa;
                            compra.descricao = "Ingressos de Eventos";
                        }
                        if (item.e_taxi == true)
                        {

                        }
                        if (item.e_acomodacao == true)
                        {

                        }
                        listaItens.Add(compra);
                    }
                };
            }
            catch (Exception ex)
            {

                return Redirect("/Error/InternalServerError");
            }
            int pageSize = 5;
            int pageNumber = (page ?? 1);
            return View(listaItens.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult adicionarItemCarrinho(CarinhoCompraViewModel model)
        {

            try
            {
                using(var db= new ASP_Mussika.Models.mussika_bdEntities())
                {
                    var artigo = db.artigoes.Where(a => a.id == model.id_artigo).SingleOrDefault();
                    var carinho = db.carrinho_compra.Where(a => a.id_artigo == model.id_artigo && a.id_usuario == model.id_usuario && a.activo == true).SingleOrDefault();
                    if (carinho != null)
                    {

                    }
                    else
                    {
                        carrinho_compra nova = new carrinho_compra()
                        {
                            activo=true,
                            e_artigo=true,
                            e_acomodacao=false,
                            e_restaurante=false,
                            e_obra=false,
                            e_musica=false,
                            e_taxi=false,
                            id_artigo=model.id_artigo,
                            id_usuario=model.id_usuario,
                            data_cadastro=DateTime.Now,
                            descricao=artigo.descricao,
                            
                        };

                        db.carrinho_compra.Add(nova);
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                //throw ex;
                return Content("false");
            }
            return Content("true");
        }
        public ActionResult adicionarObraNoCarrinho(CarinhoCompraViewModel model)
        {

            try
            {
                using (var db = new ASP_Mussika.Models.mussika_bdEntities())
                {
                    var artigo = db.obra_arte.Where(a => a.id == model.id_obra).SingleOrDefault();
                    var carinho = db.carrinho_compra.Where(a => a.id_obra == model.id_obra && a.id_usuario == model.id_usuario && a.activo == true).SingleOrDefault();
                    if (carinho != null)
                    {

                    }
                    else
                    {
                        carrinho_compra nova = new carrinho_compra()
                        {
                            activo = true,
                            e_artigo = false,
                            e_obra = true,
                            e_musica=false,
                            e_acomodacao = false,
                            e_restaurante = false,
                            e_taxi = false,
                            id_obra = model.id_obra,
                            id_usuario = model.id_usuario,
                            data_cadastro = DateTime.Now,
                            descricao = artigo.informacao_tecnica,

                        };

                        db.carrinho_compra.Add(nova);
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                //throw ex;
                return Content("false");
            }
            return Content("true");
        }

        public ActionResult adicionarMusicaNoCarrinho(CarinhoCompraViewModel model)
        {

            try
            {
                using (var db = new ASP_Mussika.Models.mussika_bdEntities())
                {
                    var artigo = db.musicas.Where(a => a.id == model.id_Musica).SingleOrDefault();
                    var carinho = db.carrinho_compra.Where(a => a.id_musica == model.id_Musica && a.id_usuario == model.id_usuario && a.activo == true).SingleOrDefault();
                    if (carinho != null)
                    {

                    }
                    else
                    {
                        carrinho_compra nova = new carrinho_compra()
                        {
                            activo = true,
                            e_artigo = false,
                            e_obra = false,
                            e_musica = true,
                            e_acomodacao = false,
                            e_restaurante = false,
                            e_taxi = false,
                           
                            id_musica = model.id_Musica,
                            id_usuario = model.id_usuario,
                            data_cadastro = DateTime.Now,
                            descricao = "Música",

                        };

                        db.carrinho_compra.Add(nova);
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                //throw ex;
                return Content("false");
            }
            return Content("true");
        }

        public ActionResult adicionarLojaNoCarrinho(CarinhoCompraViewModel model)
        {

            try
            {
                using (var db = new ASP_Mussika.Models.mussika_bdEntities())
                {
                    var artigo = db.loja_produto.Where(a => a.id == model.id_loja_produto).SingleOrDefault();
                    var carinho = db.carrinho_compra.Where(a => a.id_musica == model.id_loja_produto && a.id_usuario == model.id_usuario && a.activo == true).SingleOrDefault();
                    if (carinho != null)
                    {

                    }
                    else
                    {
                        carrinho_compra nova = new carrinho_compra()
                        {
                            activo = true,
                            e_artigo = false,
                            e_obra = false,
                            e_musica = false,
                            e_acomodacao = false,
                            e_restaurante = false,
                            e_taxi = false,
                            e_farmacia_produto=false,
                            e_loja_produto=true,
                            
                            //id_farmacia_produto=model.id_farmacia_produto,
                            id_loja_produto=model.id_loja_produto,
                            //id_musica = model.id_Musica,
                            id_usuario = model.id_usuario,
                            data_cadastro = DateTime.Now,
                            descricao = "Produto Loja",

                        };

                        db.carrinho_compra.Add(nova);
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                //throw ex;
                return Content("false");
            }
            return Content("true");
        }

        public ActionResult adicionarFarmaciaNoCarrinho(CarinhoCompraViewModel model)
        {

            try
            {
                using (var db = new ASP_Mussika.Models.mussika_bdEntities())
                {
                    var artigo = db.farmacia_produto.Where(a => a.id == model.id_farmacia_produto).SingleOrDefault();
                    var carinho = db.carrinho_compra.Where(a => a.id_farmacia_produto == model.id_farmacia_produto && a.id_usuario == model.id_usuario && a.activo == true).SingleOrDefault();
                    if (carinho != null)
                    {

                    }
                    else
                    {
                        carrinho_compra nova = new carrinho_compra()
                        {
                            activo = true,
                            e_artigo = false,
                            e_obra = false,
                            e_musica = false,
                            e_acomodacao = false,
                            e_restaurante = false,
                            e_taxi = false,
                            e_farmacia_produto = true,
                            e_loja_produto = false,
                            

                            id_farmacia_produto = model.id_farmacia_produto,
                            //id_loja_produto=model.id_loja_produto,
                            //id_musica = model.id_Musica,
                            id_usuario = model.id_usuario,
                            data_cadastro = DateTime.Now,
                            descricao = "Loja Produto",

                        };

                        db.carrinho_compra.Add(nova);
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                //throw ex;
                return Content("false");
            }
            return Content("true");
        }

        public ActionResult adicionarFilmeNoCarrinho(CarinhoCompraViewModel model)
        {

            try
            {
                using (var db = new ASP_Mussika.Models.mussika_bdEntities())
                {
                    var artigo = db.filmes.Where(a => a.id == model.id_filme).SingleOrDefault();
                    var carinho = db.carrinho_compra.Where(a => a.id_filme == model.id_filme && a.id_usuario == model.id_usuario && a.activo == true).SingleOrDefault();
                    if (carinho != null)
                    {

                    }
                    else
                    {
                        carrinho_compra nova = new carrinho_compra()
                        {
                            activo = true,
                            e_artigo = false,
                            e_obra = false,
                            e_musica = false,
                            e_acomodacao = false,
                            e_restaurante = false,
                            e_taxi = false,
                            e_farmacia_produto = false,
                            e_Filme = true,
                            e_loja_produto = false,


                            id_filme = model.id_filme,
                          
                            id_usuario = model.id_usuario,
                            data_cadastro = DateTime.Now,
                            descricao = "Filme",

                        };

                        db.carrinho_compra.Add(nova);
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                //throw ex;
                return Content("false");
            }
            return Content("true");
        }

        public ActionResult adicionarEventoNoCarrinho(CarinhoCompraViewModel model)
        {

            try
            {
                using (var db = new ASP_Mussika.Models.mussika_bdEntities())
                {
                    var artigo = db.filmes.Where(a => a.id == model.id_filme).SingleOrDefault();
                    var carinho = db.carrinho_compra.Where(a => a.id_filme == model.id_filme && a.id_usuario == model.id_usuario && a.activo == true).SingleOrDefault();
                    if (carinho != null)
                    {

                    }
                    else
                    {
                        carrinho_compra nova = new carrinho_compra()
                        {
                            activo = true,
                            e_artigo = false,
                            e_obra = false,
                            e_musica = false,
                            e_acomodacao = false,
                            e_restaurante = false,
                            e_taxi = false,
                            e_farmacia_produto = false,
                            e_Filme = false,
                            e_loja_produto = false,
                            e_evento=true,


                            id_evento = model.id_evento,

                            id_usuario = model.id_usuario,
                            data_cadastro = DateTime.Now,
                            descricao = "Bilhete de Evento",

                        };

                        db.carrinho_compra.Add(nova);
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                //throw ex;
                return Content("false");
            }
            return Content("true");
        }

        public ActionResult factura_recibo()
        {
            return View();
        }
    }
}