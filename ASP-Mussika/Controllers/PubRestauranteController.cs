using ASP_Mussika.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class PubRestauranteController : Controller
    {
        // GET: PubRestaurante
        public ActionResult Perfil(long id, int page = 1)
        {
            RestViewModel model;
            try
            {
                TempData["page"] = page;
                using (var db = new mussika_bdEntities())
                {
                    var restaurante = db.restaurantes.Where(r => r.id == id).SingleOrDefault();
                    model = new RestViewModel()
                    {
                        id = restaurante.id,
                        activo = (bool)restaurante.activo,
                        descricao = restaurante.descricao,
                        email = restaurante.email,
                        endereco = restaurante.endereco,
                        foto_capa = restaurante.foto_capa,
                        id_distrito = (int)restaurante.id_distrito,
                        id_restaurante_tipo = (int)restaurante.id_restaurante_tipo,
                        mapa = restaurante.mapa,
                        nome = restaurante.nome,
                        telefone = restaurante.telefone,
                        website = restaurante.website,
                        nomeDistrito=restaurante.distrito.nome,
                        nomeRestauranteTipo=restaurante.restaurante_tipo.tipo,

                    };
                    if (restaurante.mapa != null)
                    {
                        if (restaurante.mapa.Length < 70)
                        {
                            model.mapa = Constants.defaultLinkMap;
                        }
                        else
                        {
                            model.mapa = model.mapa;
                        }

                    }
                    else
                    {
                        model.mapa = Constants.defaultLinkMap;
                    }
                    List<restaurante_foto> imagens_ = db.restaurante_foto.Where(f => f.id_restaurante == id).ToList();
                    ViewBag.imagens = imagens_;

                    decimal classificacao = calcularClassificacao(id);
                    ViewBag.classificacao = classificacao;
                    var classificacoes = db.restaurante_classificacao.Where(a => a.id_restaurante == id);
                    ViewBag.nrclas = classificacoes.Count();

                    List<restaurante> restaurante_similares_ = db.restaurantes.Where(a => a.id_restaurante_tipo == model.id_restaurante_tipo && a.id_distrito == model.id_distrito).OrderByDescending(b => b.id).ToList();
                    ViewBag.Restaurantes_similares = restaurante_similares_.Take(6);

                };
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
            return View(model);
        }

        private decimal calcularClassificacao(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var classificacoes = db.acomodacao_classificacao.Where(a => a.id_acomodacao == id);
                    int nrclas = classificacoes.Count();
                    int soma = 0;
                    foreach (var item in classificacoes)
                    {
                        soma += (int)item.classificacao;
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

        public ActionResult classificar(comentarioViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    if (model.id_usuario != 0)
                    {
                        var existe = db.restaurante_classificacao.Where(c => c.id_usuario == model.id_usuario).SingleOrDefault();
                        if (existe != null)
                        {
                            if (model.estrelas != 0)
                            {
                                existe.classificacao = model.estrelas;
                                db.SaveChanges();
                            }

                            if (!string.IsNullOrEmpty(model.comentario))
                            {
                                restaurante_comentario novac = new restaurante_comentario()
                                {
                                    comentario = model.comentario,
                                    id_restaurante = model.id_restaurante,
                                    data = DateTime.Now,
                                    id_usuario = model.id_usuario,
                                    valido = true,
                                };
                                db.restaurante_comentario.Add(novac);
                                db.SaveChanges();
                            }
                        }
                        else
                        {
                            if (model.estrelas != 0)
                            {
                                restaurante_classificacao nova = new restaurante_classificacao()
                                {
                                    data_cadastro = DateTime.Now,
                                   
                                    classificacao = model.estrelas,
                                    id_restaurante = model.id_restaurante,
                                    id_usuario = model.id_usuario,


                                };
                                db.restaurante_classificacao.Add(nova);
                                db.SaveChanges();
                            }

                            if (!string.IsNullOrEmpty(model.comentario))
                            {
                                restaurante_comentario novac = new restaurante_comentario()
                                {
                                    comentario = model.comentario,
                                    id_restaurante = model.id_restaurante,
                                    data = DateTime.Now,
                                    id_usuario = model.id_usuario,
                                    valido = true,
                                };
                                db.restaurante_comentario.Add(novac);
                                db.SaveChanges();
                            }
                        }

                    }
                    else
                    {
                        if (model.estrelas != 0)
                        {
                            var classExiste = db.restaurante_classificacao.Where(cla => cla.usuario_email.Trim().ToLower() == model.email.Trim().ToLower()).SingleOrDefault();
                            if (classExiste != null)
                            {
                                classExiste.classificacao = model.estrelas;
                                db.SaveChanges();
                            }
                            else
                            {
                                restaurante_classificacao nova = new restaurante_classificacao()
                                {
                                    data_cadastro = DateTime.Now,
                                    
                                    classificacao = model.estrelas,
                                    id_restaurante = model.id_restaurante,
                                    usuario_nome = model.nomeUsuario,
                                    usuario_email = model.email,
                                    usuario_assunto = model.assunto,


                                };
                                db.restaurante_classificacao.Add(nova);
                                db.SaveChanges();
                            }

                        }

                        if (!string.IsNullOrEmpty(model.comentario))
                        {
                            restaurante_comentario novac = new restaurante_comentario()
                            {
                                comentario = model.comentario,
                                id_restaurante = model.id_restaurante,
                                data = DateTime.Now,
                                nomeUsuario = model.nomeUsuario,
                                email = model.email,
                                valido = true,
                            };
                            db.restaurante_comentario.Add(novac);
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


        public ActionResult carregarComentarios(int id_restaurante, int? page)
        {
            List<comentarioViewModel> listaComentarios = new List<comentarioViewModel>();
            try
            {
                page = int.Parse(TempData["page"].ToString());
                using (var db = new mussika_bdEntities())
                {
                    List<restaurante_comentario> comentarios = db.restaurante_comentario.Where(c => c.id_restaurante == id_restaurante && c.valido == true).OrderByDescending(d => d.data).ToList();
                    ViewBag.nrComentarios = comentarios.Count();
                    foreach (var item in comentarios)
                    {
                        comentarioViewModel c = new comentarioViewModel()
                        {
                            data = (DateTime)item.data,
                            comentario = item.comentario,
                            nomeUsuario = item.nomeUsuario == null ? item.Usuario.nome : item.nomeUsuario,
                        };
                        restaurante_classificacao clas = null;
                        if (item.id_usuario == null)
                        {
                            clas = db.restaurante_classificacao.Where(cla => cla.usuario_email.Trim().ToLower() == item.email).SingleOrDefault();

                        }
                        else
                        {
                            clas = db.restaurante_classificacao.Where(cla => cla.id_usuario == item.id_usuario).SingleOrDefault();
                        }
                        if (clas != null)
                        {
                            c.estrelas = (int)clas.classificacao;
                        }
                        else
                        {
                            c.estrelas = 0;
                        }


                        listaComentarios.Add(c);

                    }
                    ViewBag.id_distrito = id_restaurante;
                }
            }
            catch (Exception ex)
            {

                return Redirect("/Error/InternalServerError");
            }
            int pageSize = 5;
            int pageNumber = (page ?? 1);
            return PartialView("comentarios", listaComentarios.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult pratos(int? page,int id = 0,string filtro="", long categoria = 0)
        {
            try
            {
                ViewBag.filtro = filtro;
                ViewBag.categoria = categoria;

                using (var db = new mussika_bdEntities())
                {

                    List<restaurante_prato> itens = null;
                    ViewBag.autor = db.restaurantes.Where(p => p.id == id).SingleOrDefault();
                    ViewBag.id_autor = id;
                    if (!string.IsNullOrEmpty(filtro))
                    {
                        if (categoria != 0)
                        {
                            itens = db.restaurante_prato.Where(q => q.id_resturante == id && q.inactivo == false && q.id__prato_categoria == categoria && q.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                        }
                        else
                        {
                            itens = db.restaurante_prato.Where(q => q.id_resturante == id && q.inactivo == false && q.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                        }





                    }
                    else if (categoria != 0)
                    {
                        itens = db.restaurante_prato.Where(q => q.id_resturante == id && q.inactivo == false && q.id__prato_categoria == categoria).ToList();
                    }

                    else
                    {
                        itens = db.restaurante_prato.Where(q => q.id_resturante == id && q.inactivo == false).ToList();
                    }
                    var categorias = db.restaurante_prato_categoria.ToList();
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

        public ActionResult DetalhesPrato(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var model = db.restaurante_prato.Where(l => l.id == id).SingleOrDefault();
                ViewBag.loja = model.restaurante.nome;
                ViewBag.distrito = model.restaurante.distrito.nome;
                ViewBag.bairro = model.restaurante.endereco;

                return View(model);
            }

        }
    }
}