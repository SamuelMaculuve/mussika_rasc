using ASP_Mussika.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace ASP_Mussika.Controllers
{
    public class PubDistritoController : Controller
    {
        // GET: PubDistrito
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult perfil(int id, int page=1)
        {
            try
            {
                TempData["page"] = page;
                using (var db = new mussika_bdEntities())
                {

                    List<distrito_foto> imagens_ = db.distrito_foto.Where(d => d.id_distrito == id).ToList();
                    if (imagens_.Count > 0)
                    {
                        ViewBag.imagens = imagens_;
                    }


                    distrito distrito_ = db.distritoes.Where(d => d.id == id).SingleOrDefault();

                    DistritoViewModel model = new DistritoViewModel()
                    {
                        id = distrito_.id,
                        activar_galeria = (bool)distrito_.activar_galeria,
                        area = distrito_.area,
                        descricao = distrito_.descricao,
                        foto_capa = distrito_.foto_capa,
                        latitude = distrito_.latitude,
                        //linkmapa = distrito_.linkmapa.Length < 70 ? Constants.defaultLinkMap : distrito_.linkmapa,
                        longitude = distrito_.longitude,
                        nome = distrito_.nome,
                        populacao = distrito_.populacao,
                        visitas = (long)(distrito_.visitas ?? 0),
                    };
                   
                    if (distrito_.linkmapa != null)
                    {
                        if (distrito_.linkmapa.Length < 70)
                        {
                            model.linkmapa = Constants.defaultLinkMap;
                        }
                        else
                        {
                            model.linkmapa = distrito_.linkmapa;
                        }

                    }
                    else
                    {
                        model.linkmapa = Constants.defaultLinkMap;
                    }
                    decimal classificacao = calcularClassificacao(id);
                    ViewBag.classificacao = classificacao;
                    var classificacoes = db.distrito_classificacao.Where(a => a.id_distrito == id);
                    ViewBag.nrclas = classificacoes.Count();

                    return View(model);




                }
            }
            catch (Exception ex)
            {

                return Redirect("/inicio/InternalServerError");
            }

        }

        public ActionResult classificar(comentarioViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    if (model.id_usuario != 0)
                    {
                        var existe = db.distrito_classificacao.Where(c => c.id_usuario == model.id_usuario && c.activo == true).SingleOrDefault();
                        if (existe != null)
                        {
                            if (model.estrelas != 0)
                            {
                                existe.estrelas = model.estrelas;
                                db.SaveChanges();
                            }

                            if (!string.IsNullOrEmpty(model.comentario))
                            {
                                distrito_comentario novac = new distrito_comentario()
                                {
                                    comentario = model.comentario,
                                    id_distrito = model.id_distrito,
                                    data = DateTime.Now,
                                    id_usuario = model.id_usuario,
                                    valido = true,
                                };
                                db.distrito_comentario.Add(novac);
                                db.SaveChanges();
                            }
                        }
                        else
                        {
                            if (model.estrelas != 0)
                            {
                                distrito_classificacao nova = new distrito_classificacao()
                                {
                                    data_cadastro = DateTime.Now,
                                    activo = true,
                                    estrelas = model.estrelas,
                                    id_distrito = model.id_distrito,
                                    id_usuario = model.id_usuario,
                                    e_like = false,

                                };
                                db.distrito_classificacao.Add(nova);
                                db.SaveChanges();
                            }

                            if (!string.IsNullOrEmpty(model.comentario))
                            {
                                distrito_comentario novac = new distrito_comentario()
                                {
                                    comentario = model.comentario,
                                    id_distrito = model.id_distrito,
                                    data = DateTime.Now,
                                    id_usuario = model.id_usuario,
                                    valido = true,
                                };
                                db.distrito_comentario.Add(novac);
                                db.SaveChanges();
                            }
                        }

                    }
                    else
                    {
                        if (model.estrelas != 0)
                        {
                            var classExiste = db.distrito_classificacao.Where(cla => cla.email.Trim().ToLower() == model.email.Trim().ToLower()).SingleOrDefault();
                            if (classExiste != null)
                            {
                                classExiste.estrelas = model.estrelas;
                                db.SaveChanges();
                            }
                            else
                            {
                                distrito_classificacao nova = new distrito_classificacao()
                                {
                                    data_cadastro = DateTime.Now,
                                    activo = true,
                                    estrelas = model.estrelas,
                                    id_distrito = model.id_distrito,
                                    nomeUsuario = model.nomeUsuario,
                                    email = model.email,
                                    e_like = false,

                                };
                                db.distrito_classificacao.Add(nova);
                                db.SaveChanges();
                            }
                            
                        }

                        if (!string.IsNullOrEmpty(model.comentario))
                        {
                            distrito_comentario novac = new distrito_comentario()
                            {
                                comentario = model.comentario,
                                id_distrito = model.id_distrito,
                                data = DateTime.Now,
                                nomeUsuario = model.nomeUsuario,
                                email = model.email,
                                valido = true,
                            };
                            db.distrito_comentario.Add(novac);
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

        private decimal calcularClassificacao(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var classificacoes = db.distrito_classificacao.Where(a => a.id_distrito == id);
                    int nrclas = classificacoes.Count();
                    int soma = 0;
                    foreach (var item in classificacoes)
                    {
                        soma += (int)item.estrelas;
                    };
                    decimal classificacaoTotal = soma / nrclas;
                    return classificacaoTotal;
                }
            }
            catch (Exception)
            {

                return 0;
            }
        }
        public ActionResult carregarComentarios(int id_distrito, int? page)
        {
            List<comentarioViewModel> listaComentarios = new List<comentarioViewModel>();
            try
            {
                page = int.Parse(TempData["page"].ToString());
                using(var db=new mussika_bdEntities())
                {
                    var comentarios = db.distrito_comentario.Where(c => c.id_distrito == id_distrito && c.valido == true).OrderByDescending(d=>d.data);
                    ViewBag.nrComentarios = comentarios.Count();
                    foreach (var item in comentarios)
                    {
                        comentarioViewModel c = new comentarioViewModel()
                        {
                            data = (DateTime)item.data,
                            comentario=item.comentario,
                            nomeUsuario = item.nomeUsuario == null ? item.Usuario.nome : item.nomeUsuario,
                        };
                        distrito_classificacao clas=null;
                        if (item.id_usuario == null)
                        {
                            clas = db.distrito_classificacao.Where(cla => cla.email.Trim().ToLower() == item.email).SingleOrDefault();

                        }else
                        {
                            clas = db.distrito_classificacao.Where(cla => cla.id_usuario == item.id_usuario).SingleOrDefault();
                        }
                        if (clas != null)
                        {
                            c.estrelas = (int)clas.estrelas;
                        }
                        else
                        {
                            c.estrelas = 0;
                        }

                        listaComentarios.Add(c);

                    }
                    ViewBag.id_distrito = id_distrito;
                }
            }
            catch (Exception)
            {

                return Redirect("/Error/InternalServerError");
            }
            int pageSize = 5;
            int pageNumber = (page ?? 1);
            return PartialView("comentarios", listaComentarios.ToPagedList(pageNumber, pageSize));
        }

    }
}