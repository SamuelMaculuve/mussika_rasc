using ASP_Mussika.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class TurismoController : Controller
    {
        // GET: Turismo

        public ActionResult categorias(int?page)
        {
            List<turismo_categoria> model_ = new List<turismo_categoria>();
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var eventos = db.turismo_categoria.ToList();
                    foreach (var model in eventos)
                    {


                        model_.Add(model);

                    }
                }
            }
            catch (Exception ex)
            {

                return Redirect("/Error/InternalServerError");
            }
            int pageSize = 5;
            int pageNumber = (page ?? 1);
            return View(model_.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Index(int? page,int categoria=0)
        {
            List<TurismoViewModel> model_ = new List<TurismoViewModel>();
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var eventos = db.turismoes.Where(t=>t.inactivo==false && t.id_categoria==categoria).OrderByDescending(e => e.data_cadastro);
                    foreach (var model in eventos)
                    {
                        TurismoViewModel ProVM = new TurismoViewModel()
                        {
                            id = model.id,
                           
                            data_cadastro = DateTime.Now,
                            descricao = model.descricao,
                            foto_capa = model.foto_capa,
                            id_distrito = (int)model.id_distrito,
                            inactivo = (bool)model.inactivo,
                            localizacao = model.localizacao,
                            nome = model.nome,
                            nome_distrito = model.distrito.nome,
                        };
                        ProVM.comentarios = db.turismo_comentario.Where(e => e.id_turismo == model.id).Count();
                        if (model.descricao != null)
                        {
                            if (model.descricao.Length > 500) { ProVM.descricao = model.descricao.Substring(0, 500); } else { ProVM.descricao = model.descricao; }
                        }
                        model_.Add(ProVM);

                    }
                }
            }
            catch (Exception)
            {

                return Redirect("/Error/InternalServerError");
            }
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(model_.ToPagedList(pageNumber, pageSize));

        }
        public ActionResult Detalhes(long id, int page = 1)
        {
            try
            {
                TempData["page"] = page;
                using (var db = new mussika_bdEntities())
                {
                    var model = db.turismoes.Where(e => e.id == id ).SingleOrDefault();
                    TurismoViewModel ProVM = new TurismoViewModel()
                    {
                        id = model.id,
                       
                        data_cadastro = DateTime.Now,
                        
                        descricao = model.descricao,
                        foto_capa = model.foto_capa,
                        id_distrito = (int)model.id_distrito,
                        inactivo = (bool)model.inactivo,
                        localizacao = model.localizacao,
                        nome = model.nome,                       
                        nome_distrito = model.distrito.nome,
                    };
                    ProVM.comentarios = db.turismo_comentario.Where(e => e.id_turismo == model.id).Count();
                    return View(ProVM);
                }
            }
            catch (Exception)
            {

                return Redirect("/Error/InternalServerError");
            }
        }

        public ActionResult Comentar(comentarioViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    if (model.id_usuario != 0)
                    {
                        if (!string.IsNullOrEmpty(model.comentario))
                        {
                            turismo_comentario novac = new turismo_comentario()
                            {
                                comentario = model.comentario,
                                id_turismo = model.id_turismo,
                                data_cadastro = DateTime.Now,
                                id_usuario = model.id_usuario,
                                valido = true,
                            };
                            db.turismo_comentario.Add(novac);
                            db.SaveChanges();
                        }


                    }
                    else
                    {


                        if (!string.IsNullOrEmpty(model.comentario))
                        {
                            turismo_comentario novac = new turismo_comentario()
                            {
                                comentario = model.comentario,
                                id_turismo = model.id_turismo,
                                data_cadastro = DateTime.Now,
                                nomeUsuario = model.nomeUsuario,
                                email = model.email,
                                valido = true,
                            };
                            db.turismo_comentario.Add(novac);
                            db.SaveChanges();
                        }
                    }


                }
            }
            catch (Exception ex)
            {

                return Content("false");
            }
            return Redirect(Request.UrlReferrer.ToString());

        }

        public ActionResult carregarComentarios(int id, int? page)
        {
            List<comentarioViewModel> listaComentarios = new List<comentarioViewModel>();
            try
            {
                page = int.Parse(TempData["page"].ToString());
                using (var db = new mussika_bdEntities())
                {
                    List<turismo_comentario> comentarios = db.turismo_comentario.Where(c => c.id_turismo == id && c.valido == true).OrderByDescending(d => d.data_cadastro).ToList();
                    ViewBag.nrComentarios = comentarios.Count();
                    foreach (var item in comentarios)
                    {
                        comentarioViewModel c = new comentarioViewModel()
                        {
                            data = (DateTime)item.data_cadastro,
                            comentario = item.comentario,
                            nomeUsuario = item.nomeUsuario == null ? item.Usuario.nome : item.nomeUsuario,
                        };



                        listaComentarios.Add(c);

                    }
                    ViewBag.id_distrito = id;
                }
            }
            catch (Exception ex)
            {

                return Redirect("/Error/InternalServerError");
            }
            int pageSize = 5;
            int pageNumber = (page ?? 1);
            return PartialView("_TurismoComentario", listaComentarios.ToPagedList(pageNumber, pageSize));
        }
    }
}