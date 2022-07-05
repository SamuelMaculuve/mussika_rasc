using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASP_Mussika.Models;
using PagedList;

namespace ASP_Mussika.Controllers
{
    public class PubShopMussikaController : Controller
    {
        // GET: PubShopMussika

       
        public ActionResult Loja_Shop()
        {
            using(var db=new mussika_bdEntities())
            {
                ViewBag.lojas = db.lojas.Count();
                ViewBag.shopmussika = db.artigoes.Count();
            }
            return View();
        }
        public ActionResult Index(string currentFilter, string searchString, int? page, int categoria = 0, int distrito = 0)
        {
            List<ArtigoViewModel> listafinal = new List<ArtigoViewModel>();
            try
            {


                if (searchString != null)
                {
                    page = 1;
                }
                else
                {
                    searchString = currentFilter;
                }

                ViewBag.CurrentFilter = searchString;

                using (var db = new mussika_bdEntities())
                {
                    var artigos = db.artigoes.ToList();


                    if (categoria != 0)
                    {
                        artigos = artigos.FindAll(a => a.id_categoria_artigo == categoria).ToList();
                    }
                    if (distrito != 0)
                    {
                        artigos = artigos.FindAll(a => a.id_distrito == distrito).ToList();
                    }

                    if (!String.IsNullOrEmpty(searchString))
                    {
                        artigos = db.artigoes.Where(a => a.nome.Trim().ToLower().Contains(searchString.Trim().ToLower())).ToList();

                    }

                    foreach (var item in artigos)
                    {
                        ArtigoViewModel artigo = new ArtigoViewModel()
                        {
                            id_distrito = (item.id_distrito ?? 0),
                            atracao_internacional = (item.atracao_internacional ?? false),
                            bairro = item.bairro,
                            clicks = (item.clicks ?? 0),
                            //descricao=item.descricao.Length>200?item.descricao.Substring(0, 200) + "...":item.descricao,
                            e_servico = (item.e_servico ?? false),
                            id = item.id,
                            foto_capa = item.foto_capa,
                            genero = item.genero,
                            id_categoria_artigo = (item.id_categoria_artigo ?? 0),
                            marca_registada = (item.marca_registada ?? false),
                            nome = item.nome,
                            nomeCategoria = item.categoria_artigo.descricao,
                            nomeDistrito = item.distrito.nome,
                            //observacoes= item.observacoes.Length > 200 ? item.observacoes.Substring(0, 200) + "..." : item.observacoes,
                            portofolio = item.portofolio,
                            preco_max = (item.preco_max ?? 0),
                            preco_min = (item.preco_min ?? 0),
                            preco_venda = (item.preco_venda ?? 0),
                        };

                        if (item.descricao != null)
                        {
                            if (item.descricao.Length > 200) { artigo.descricao = item.descricao.Substring(0, 200); } else { artigo.descricao = item.descricao; }
                        }
                        if (item.observacoes != null)
                        {
                            if (item.observacoes.Length > 200) { artigo.observacoes = item.observacoes.Substring(0, 200); } else { artigo.observacoes = item.observacoes; }

                        }
                        listafinal.Add(artigo);
                    }

                    List<distrito> distritos_ = db.distritoes.ToList();
                    ViewBag.distritos = distritos_;

                    List<categoria_artigo> categorias_ = db.categoria_artigo.ToList();
                    ViewBag.categorias = categorias_;
                }
            }
            catch (Exception ex)
            {

                return Redirect("/inicio/InternalServerError");
            }
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            return View(listafinal.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Perfil(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var item = db.artigoes.Where(a => a.id == id).SingleOrDefault();
                    ArtigoViewModel artigo = new ArtigoViewModel()
                    {
                        id_distrito = (item.id_distrito ?? 0),
                        atracao_internacional = (item.atracao_internacional ?? false),
                        bairro = item.bairro,
                        clicks = (item.clicks ?? 0),
                        descricao = item.descricao,
                        e_servico = (item.e_servico ?? false),
                        id = item.id,
                        foto_capa = item.foto_capa,
                        genero = item.genero,
                        id_categoria_artigo = (item.id_categoria_artigo ?? 0),
                        marca_registada = (item.marca_registada ?? false),
                        nome = item.nome,
                        nomeCategoria = item.categoria_artigo.descricao,
                        nomeDistrito = item.distrito.nome,
                        observacoes = item.observacoes,
                        portofolio = item.portofolio,
                        preco_max = (item.preco_max ?? 0),
                        preco_min = (item.preco_min ?? 0),
                        preco_venda = (item.preco_venda ?? 0),

                    };
                    List<artigo_imagem> imagens_ = db.artigo_imagem.Where(f => f.id_artigo == id).ToList();
                    ViewBag.imagens = imagens_;

                    ViewBag.artigos_similares = db.artigoes.Where(a => a.id_categoria_artigo == item.id_categoria_artigo && a.id_distrito == a.id_distrito).ToList();
                    return View(artigo);

                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }

        public ActionResult comprar(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var item = db.artigoes.Where(a => a.id == id).SingleOrDefault();
                    ArtigoViewModel artigo = new ArtigoViewModel()
                    {
                        id_distrito = (item.id_distrito ?? 0),
                        atracao_internacional = (item.atracao_internacional ?? false),
                        bairro = item.bairro,
                        clicks = (item.clicks ?? 0),
                        descricao = item.descricao,
                        e_servico = (item.e_servico ?? false),
                        id = item.id,
                        foto_capa = item.foto_capa,
                        genero = item.genero,
                        id_categoria_artigo = (item.id_categoria_artigo ?? 0),
                        marca_registada = (item.marca_registada ?? false),
                        nome = item.nome,
                        nomeCategoria = item.categoria_artigo.descricao,
                        nomeDistrito = item.distrito.nome,
                        observacoes = item.observacoes,
                        portofolio = item.portofolio,
                        preco_max = (item.preco_max ?? 0),
                        preco_min = (item.preco_min ?? 0),
                        preco_venda = (item.preco_venda ?? 0),

                    };

                    if (artigo.atracao_internacional == true) { artigo.e_atracao = "Sim"; } else { artigo.e_atracao = "Não"; }

                    return View(artigo);

                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }

        public ActionResult Lojas(int? page, int distrito = 0, string filtro="")
        {
            List<LojaViewModel> listaMusica = new List<LojaViewModel>();
            try
            {


                using (var db = new mussika_bdEntities())
                {
                    ViewBag.filtro = filtro;
                    ViewBag.distrito = distrito;
                    ViewBag.distritos = db.distritoes.ToList();
                    List<loja> distritos = null;
                    if (distrito != 0)
                    {
                        if (string.IsNullOrEmpty(filtro))
                        {
                            distritos = db.lojas.Where(o => o.id_distrito == distrito).ToList();
                        }
                        else
                        {
                            distritos = db.lojas.Where(o => o.id_distrito == distrito && o.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                        }
                        
                    }
                    else
                    {
                        if (string.IsNullOrEmpty(filtro))
                        {
                            distritos = db.lojas.Where(o => o.inactivo == false).ToList();
                        }
                        else
                        {
                            distritos = db.lojas.Where(o =>  o.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                        }
                        
                    }

                    ViewBag.id_distrito = distrito;
                   
                    foreach (var model in distritos)
                    {
                        LojaViewModel model_ = new LojaViewModel()
                        {

                            data_cadastro = model.data_cadastro,
                            id=model.id,
                            descricao = model.descricao,
                            foto_capa = model.foto_capa,
                            id_distrito = model.id_distrito,
                            id_tipo_loja = model.id_tipo_loja,                            
                            email = model.email,
                            telefone = model.telefone,
                            bairro = model.bairro,
                            nome = model.nome,

                        };
                        listaMusica.Add(model_);
                    }
                    int pageSize = 10;
                    int pageNumber = (page ?? 1);
                    return View(listaMusica.ToPagedList(pageNumber, pageSize));
                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }

        public ActionResult Detalhes_loja(long id)
        {
            using(var db=new mussika_bdEntities())
            {
                var model = db.lojas.Where(l => l.id == id).SingleOrDefault();
                LojaViewModel model_ = new LojaViewModel()
                {
                    id=model.id,
                    
                    data_cadastro = model.data_cadastro,
                    descricao = model.descricao,
                    foto_capa = model.foto_capa,
                    id_distrito = model.id_distrito,
                    id_tipo_loja = model.id_tipo_loja,
                    email = model.email,
                    telefone = model.telefone,
                    bairro = model.bairro,
                    nome = model.nome,
                    nome_distrito=model.distrito.nome,
                    tipo_loja=model.loja_tipo.descricao,

                };
                return View(model_);
            }
           
        }

        public ActionResult Produtos(long id, int? page, string filtro="",int categoria=0)
        {
            try
            {
                ViewBag.filtro = filtro;
                ViewBag.categoria = categoria;
                using (var db = new mussika_bdEntities())
                {
                    
                    List<loja_produto> itens = null;
                    ViewBag.autor = db.lojas.Where(p => p.id == id).SingleOrDefault();
                    ViewBag.id_autor = id;
                    if (!string.IsNullOrEmpty(filtro))
                    {
                        if(categoria != 0){
                            itens = db.loja_produto.Where(q => q.id_loja == id && q.inactivo == false && q.categoria==categoria && q.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                        }
                        else
                        {
                            itens = db.loja_produto.Where(q => q.id_loja == id && q.inactivo == false && q.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                        }
                        
                       
                    }
                    else if(categoria != 0){
                        itens = db.loja_produto.Where(q => q.id_loja == id && q.inactivo == false && q.categoria == categoria).ToList();
                    }
                    else
                    {
                        itens = db.loja_produto.Where(q => q.id_loja == id && q.inactivo == false).ToList();
                    }

                    var categorias = db.produto_categoria.ToList();
                    ViewBag.categorias = categorias;

                    int pageSize = 10;
                    int pageNumber = (page ?? 1);
                    return View(itens.ToPagedList(pageNumber, pageSize));

                }
            }
            catch (Exception)
            {

                return Redirect("/Error/InternalServerError");
            }

        }

        public ActionResult DetalhesProduto(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var model = db.loja_produto.Where(l => l.id == id).SingleOrDefault();
                ViewBag.loja = model.loja.nome;
                ViewBag.distrito = model.loja.distrito.nome;
                ViewBag.bairro = model.loja.bairro;
               
                return View(model);
            }

        }
        
    }
}