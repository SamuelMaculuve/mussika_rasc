using ASP_Mussika.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class PubCinemaController : Controller
    {
        // GET: PubCinema
        public ActionResult Filmes(int? page, string filtro = "", long categoria = 0)
        {
            try
            {
                ViewBag.filtro = filtro;
                ViewBag.categoria = categoria;
                using (var db = new mussika_bdEntities())
                {

                    List<filme> itens = new List<filme>();
                    List<item_filme_categoria> itens_categoria = null;
                  
                    if (!string.IsNullOrEmpty(filtro))
                    {
                        if (categoria != 0)
                        {
                            itens_categoria = db.item_filme_categoria.Where(q => q.id_categoria == categoria && q.inactivo == false && q.filme.titulo_original.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                            List<long> ids = new List<long>();
                            foreach(var item in itens_categoria)
                            {
                                ids.Add((long)item.id_filme);
                            }
                            var filmes_ids = ids.Distinct();
                            foreach(var item in filmes_ids)
                            {
                                var fi_ = db.filmes.Where(f => f.id == item).SingleOrDefault();
                                itens.Add(fi_);
                            }
                        }
                        else
                        {
                            itens = db.filmes.Where(q => q.inactivo == false && q.titulo_original.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                        }


                    }
                    else if (categoria != 0)
                    {
                        itens_categoria = db.item_filme_categoria.Where(q => q.id_categoria == categoria && q.inactivo == false).ToList();
                        List<long> ids = new List<long>();
                        foreach (var item in itens_categoria)
                        {
                            ids.Add((long)item.id_filme);
                        }
                        var filmes_ids = ids.Distinct();
                        foreach (var item in filmes_ids)
                        {
                            var fi_ = db.filmes.Where(f => f.id == item).SingleOrDefault();
                            itens.Add(fi_);
                        }
                    }
                    else
                    {
                        itens = db.filmes.Where(q => q.inactivo == false).OrderByDescending(d=>d.id).ToList();
                    }

                    var categorias = db.filme_categoria.ToList();
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

        public ActionResult AssistirFilme(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var model = db.filmes.Where(l => l.id == id).SingleOrDefault();
                var cat_ = db.item_filme_categoria.Where(f => f.id_filme == id && f.inactivo == false).ToList();
                List<item_categoria_filme_view_Model> listaCategoria = new List<item_categoria_filme_view_Model>();
                foreach (var item in cat_)
                {
                    item_categoria_filme_view_Model it = new item_categoria_filme_view_Model()
                    {
                        id = item.id,
                        nome = item.filme_categoria.descricao,
                    };
                    listaCategoria.Add(it);
                }
                ViewBag.categorias = listaCategoria;



                return View(model);
            }
        }
        public ActionResult DetalhesFilme(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var model = db.filmes.Where(l => l.id == id).SingleOrDefault();
                var cat_= db.item_filme_categoria.Where(f => f.id_filme == id && f.inactivo == false).ToList();
                List<item_categoria_filme_view_Model> listaCategoria = new List<item_categoria_filme_view_Model>();
                foreach(var item in cat_)
                {
                    item_categoria_filme_view_Model it = new item_categoria_filme_view_Model()
                    {
                        id = item.id,
                        nome = item.filme_categoria.descricao,
                    };
                    listaCategoria.Add(it);
                }
                ViewBag.categorias = listaCategoria;



                return View(model);
            }

        }

        public ActionResult Salas(int? page, string filtro = "", int distrito = 0)
        {
            try
            {
                ViewBag.filtro = filtro;
                ViewBag.categoria = distrito;
                using (var db = new mussika_bdEntities())
                {

                    List<cinema> itens = null;
                    //ViewBag.autor = db.cine.Where(p => p.id == id).SingleOrDefault();
                    //ViewBag.id_autor = id;
                    if (!string.IsNullOrEmpty(filtro))
                    {
                        if (distrito != 0)
                        {
                            itens = db.cinemas.Where(q => q.id_distrito == distrito && q.inactivo == false && q.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                        }
                        else
                        {
                            itens = db.cinemas.Where(q => q.inactivo == false && q.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                        }


                    }
                    else if (distrito != 0)
                    {
                        itens = db.cinemas.Where(q => q.id_distrito == distrito && q.inactivo == false).ToList();
                    }
                    else
                    {
                        itens = db.cinemas.Where(q =>q.inactivo == false).ToList();
                    }

                    var distritos = db.distritoes.ToList();
                    ViewBag.categorias = distritos;

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

        public ActionResult DetalhesSala(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var model = db.cinemas.Where(l => l.id == id).SingleOrDefault();
                ViewBag.distrito = model.distrito.nome;
                DateTime hoje = DateTime.Now.Date;
                var cat_ = db.cinema_sessao.Where(f => f.id_cinema == id && f.inactivo == false && DbFunctions.TruncateTime(f.data) != hoje).OrderBy(d=>d.data).ToList().Take(10);
                List<cinemaSessaoViewModel> listaCategoria = new List<cinemaSessaoViewModel>();
                foreach (var item in cat_)
                {
                    cinemaSessaoViewModel it = new cinemaSessaoViewModel()
                    {
                        id = item.id,
                        nome_cinema = item.cinema.nome,
                        nome_filme = item.filme.titulo_original,
                        dataConvetido = item.data.Value.ToString("dd-MM-yyyy"),
                        id_cinema=item.id_cinema??0,
                        id_filme=item.id_filme??0,
                        hora=item.hora,
                    };
                    listaCategoria.Add(it);
                }

                var cat_hoje = db.cinema_sessao.Where(f => f.id_cinema == id && f.inactivo == false && DbFunctions.TruncateTime(f.data) != hoje).OrderBy(d => d.data).ToList().Take(10);
                List<cinemaSessaoViewModel> listaSessaoHoje = new List<cinemaSessaoViewModel>();
                foreach (var item in cat_)
                {
                    cinemaSessaoViewModel it = new cinemaSessaoViewModel()
                    {
                        id = item.id,
                        nome_cinema = item.cinema.nome,
                        nome_filme = item.filme.titulo_original,
                        dataConvetido = item.data.Value.ToString("dd-MM-yyyy"),
                        id_cinema = item.id_cinema ?? 0,
                        id_filme = item.id_filme ?? 0,
                        hora = item.hora,
                    };
                    listaCategoria.Add(it);
                }
                ViewBag.sessaoHoje = listaSessaoHoje;
                ViewBag.categorias = listaCategoria;



                return View(model);
            }

        }

        public ActionResult DetalheSessao(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var item = db.cinema_sessao.Where(f => f.id == id).SingleOrDefault();
               
                    cinemaSessaoViewModel it = new cinemaSessaoViewModel()
                    {
                        id = item.id,
                        nome_cinema = item.cinema.nome,
                        nome_filme = item.filme.titulo_original,
                        dataConvetido = item.data.Value.ToString("dd-MM-yyyy"),
                        id_cinema = item.id_cinema ?? 0,
                        id_filme = item.id_filme ?? 0,
                        hora = item.hora,
                        preco=item.preco??0,
                        descricao=item.descricao,
                    };
                    
                var cinema = db.cinemas.Where(c => c.id == item.id_cinema).SingleOrDefault();
                var filme = db.filmes.Where(f => f.id == item.id_filme).SingleOrDefault();
                ViewBag.cinema = cinema;
                ViewBag.distrito = cinema.distrito.nome;
                ViewBag.fime = filme;

                return View(it);
            }

        }
    }
}