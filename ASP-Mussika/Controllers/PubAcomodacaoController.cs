using ASP_Mussika.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class PubAcomodacaoController : Controller
    {
        // GET: PubAcomodacao
        public ActionResult Categorias(int? page)
        {
            List<acomodacao_tipo> model_ = new List<acomodacao_tipo>();
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var eventos = db.acomodacao_tipo.ToList(); ;
                    foreach (var model in eventos)
                    {


                        model_.Add(model);

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
        public ActionResult Acomodacoes(string sortOrder,  string currentFilter, string searchString, int? page, int id_distrito = 0, int id_acomodacao = 0)
        {
            List<AcomodacaoViewModel> listaFinal = new List<AcomodacaoViewModel>();
            try
            {
                ViewBag.CurrentSort = sortOrder;
                ViewBag.NameSortParm = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
                ViewBag.DateSortParm = sortOrder == "Date" ? "date_desc" : "Date";
                ViewBag.id_distrito = id_distrito;
                ViewBag.id_acomodacao = id_acomodacao;
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
                    List<distrito> distritos_ = db.distritoes.ToList();
                    ViewBag.distritos = distritos_;

                    List<acomodacao_tipo> TipoAcomodacao_ = db.acomodacao_tipo.ToList();
                    ViewBag.TipoAcomodacaos = TipoAcomodacao_;

                    List<acomodacao> todas = db.acomodacaos.ToList();
                    if (id_distrito > 0)
                    {
                      todas=  todas.FindAll(a => a.id_distrito == id_distrito).ToList();
                       
                    }
                    if (id_acomodacao > 0)
                    {
                        todas = todas.FindAll(a => a.id_acomodacao_tipo == id_acomodacao).ToList();
                    }
                    if (!string.IsNullOrWhiteSpace(searchString))
                    {
                        todas = db.acomodacaos.Where(a=>a.nome.Trim().ToLower().Contains(searchString.Trim().ToLower())).ToList();
                    }
                    foreach(var model in todas)
                    {
                        AcomodacaoViewModel model1 = new AcomodacaoViewModel()
                        {
                            //descricao = model.descricao.Substring(0, 200)+"...",
                            email = model.email,
                            endereco = model.endereco,
                            foto_capa = model.foto_capa,
                            id_acomodacao_tipo = (int)model.id_acomodacao_tipo,
                            id_distrito = (int)model.id_distrito,
                            mapa = model.mapa,
                            nome = model.nome,
                            telefone = model.telefone,
                            website = model.website,
                            id = model.id,
                            nomeAcomodacaoTipo = model.acomodacao_tipo.tipo,
                            nomeDistrito=model.distrito.nome,
                        };
                        if (model.descricao != null)
                        {
                            if (model.descricao.Length > 200) { model1.descricao = model.descricao.Substring(0, 200); } else { model1.descricao = model.descricao; }
                        }
                        listaFinal.Add(model1);
                    }
                };
            }
            catch (Exception)
            {

                return Redirect("/inicio/principal");
            }
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            return View(listaFinal.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Perfil(long id, int page = 1)
        {
            try
            {
                TempData["page"] = page;
                using (var db = new mussika_bdEntities())
                {
                    var model = db.acomodacaos.Where(a => a.id == id).SingleOrDefault();
                    AcomodacaoViewModel model1 = new AcomodacaoViewModel()
                    {
                        descricao = model.descricao,
                        email = model.email,
                        endereco = model.endereco,
                        foto_capa = model.foto_capa,
                        id_acomodacao_tipo = (int)model.id_acomodacao_tipo,
                        id_distrito = (int)model.id_distrito,
                       
                        nome = model.nome,
                        telefone = model.telefone,
                        website = model.website,
                        id = model.id,
                        nomeAcomodacaoTipo = model.acomodacao_tipo.tipo,
                        nomeDistrito = model.distrito.nome,
                    };
                    if (model.mapa != null)
                    {
                        if (model.mapa.Length < 70)
                        {
                            model1.mapa = Constants.defaultLinkMap;
                        }
                        else
                        {
                            model1.mapa = model.mapa;
                        }

                    }
                    else
                    {
                        model.mapa = Constants.defaultLinkMap;
                    }
                    List<acomodacao_foto> imagens_ = db.acomodacao_foto.Where(f => f.id_acomodacao == id).ToList();
                    ViewBag.imagens = imagens_;
                    decimal classificacao = calcularClassificacao(id);
                    ViewBag.classificacao = classificacao;
                    var classificacoes = db.acomodacao_classificacao.Where(a => a.id_acomodacao == id);
                    ViewBag.nrclas = classificacoes.Count();

                    List<acomodacao_quarto> quartos = quartos = db.acomodacao_quarto.Where(q => q.id_acomodacao == id).ToList();
                    ViewBag.Quartos = quartos;
                    List<acomodacao> acomodacoes_similares_ = db.acomodacaos.Where(a => a.id_acomodacao_tipo == model.id_acomodacao_tipo && a.id_distrito == model.id_distrito).OrderByDescending(b=>b.id).ToList();
                    ViewBag.acomodacoes_similares = acomodacoes_similares_.Take(6);
                    return View(model1);
                }
            }
            catch (Exception)
            {

                Redirect("/inicio/InternalServerError");
            }
            return View();
        }

        private decimal calcularClassificacao(long id)
        {
            try
            {
                using(var db=new mussika_bdEntities())
                {
                    var classificacoes = db.acomodacao_classificacao.Where(a => a.id_acomodacao == id);
                    int nrclas = classificacoes.Count();
                    int soma = 0;
                    foreach(var item in classificacoes)
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
                        var existe = db.acomodacao_classificacao.Where(c => c.id_usuario == model.id_usuario && c.activo == true).SingleOrDefault();
                        if (existe != null)
                        {
                            if (model.estrelas != 0)
                            {
                                existe.classificacao = model.estrelas;
                                db.SaveChanges();
                            }

                            if (!string.IsNullOrEmpty(model.comentario))
                            {
                                acomodacao_comentario novac = new acomodacao_comentario()
                                {
                                    comentario = model.comentario,
                                    id_acomodacao = model.id_acomodacao,
                                    data = DateTime.Now,
                                    id_usuario = model.id_usuario,
                                    valido = true,
                                };
                                db.acomodacao_comentario.Add(novac);
                                db.SaveChanges();
                            }
                        }
                        else
                        {
                            if (model.estrelas != 0)
                            {
                                acomodacao_classificacao nova = new acomodacao_classificacao()
                                {
                                    data_cadastro = DateTime.Now,
                                    activo = true,
                                    classificacao = model.estrelas,
                                    id_acomodacao = model.id_acomodacao,
                                    id_usuario = model.id_usuario,
                                   

                                };
                                db.acomodacao_classificacao.Add(nova);
                                db.SaveChanges();
                            }

                            if (!string.IsNullOrEmpty(model.comentario))
                            {
                                acomodacao_comentario novac = new acomodacao_comentario()
                                {
                                    comentario = model.comentario,
                                    id_acomodacao = model.id_acomodacao,
                                    data = DateTime.Now,
                                    id_usuario = model.id_usuario,
                                    valido = true,
                                };
                                db.acomodacao_comentario.Add(novac);
                                db.SaveChanges();
                            }
                        }

                    }
                    else
                    {
                        if (model.estrelas != 0)
                        {
                            var classExiste = db.acomodacao_classificacao.Where(cla => cla.usuario_email.Trim().ToLower() == model.email.Trim().ToLower()).SingleOrDefault();
                            if (classExiste != null)
                            {
                                classExiste.classificacao = model.estrelas;
                                db.SaveChanges();
                            }
                            else
                            {
                                acomodacao_classificacao nova = new acomodacao_classificacao()
                                {
                                    data_cadastro = DateTime.Now,
                                    activo = true,
                                    classificacao = model.estrelas,
                                    id_acomodacao = model.id_acomodacao,
                                    usuario_nome = model.nomeUsuario,
                                    usuario_email = model.email,
                                    usuario_assunto = model.assunto,
                                    

                                };
                                db.acomodacao_classificacao.Add(nova);
                                db.SaveChanges();
                            }

                        }

                        if (!string.IsNullOrEmpty(model.comentario))
                        {
                            acomodacao_comentario novac = new acomodacao_comentario()
                            {
                                comentario = model.comentario,
                                id_acomodacao = model.id_acomodacao,
                                data = DateTime.Now,
                                nomeUsuario = model.nomeUsuario,
                                email = model.email,
                                valido = true,
                            };
                            db.acomodacao_comentario.Add(novac);
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


        public ActionResult carregarComentarios(int id_acomodacao, int? page)
        {
            List<comentarioViewModel> listaComentarios = new List<comentarioViewModel>();
            try
            {
                page = int.Parse(TempData["page"].ToString());
                using (var db = new mussika_bdEntities())
                {
                    List<acomodacao_comentario> comentarios = db.acomodacao_comentario.Where(c => c.id_acomodacao == id_acomodacao && c.valido == true).OrderByDescending(d => d.data).ToList();
                    ViewBag.nrComentarios = comentarios.Count();
                    foreach (var item in comentarios)
                    {
                        comentarioViewModel c = new comentarioViewModel()
                        {
                            data = (DateTime)item.data,
                            comentario = item.comentario,
                            nomeUsuario = item.nomeUsuario == null ? item.Usuario.nome : item.nomeUsuario,
                        };
                        acomodacao_classificacao clas = null;
                        if (item.id_usuario == null)
                        {
                            clas = db.acomodacao_classificacao.Where(cla => cla.usuario_email.Trim().ToLower() == item.email).SingleOrDefault();

                        }
                        else
                        {
                            clas = db.acomodacao_classificacao.Where(cla => cla.id_usuario == item.id_usuario).SingleOrDefault();
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
                    ViewBag.id_distrito = id_acomodacao;
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
    }
}