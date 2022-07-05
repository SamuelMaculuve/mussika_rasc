
using ASP_Mussika.Models;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Mvc;
using PagedList;
using System.Threading.Tasks;
using System.IO;
using System.Net;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace ASP_Mussika.Controllers
{
    public class inicioController : Controller
    {
        // GET: Inicio
        public ActionResult actualizarSession()
        {
            return Content("ok");
        }
        public ActionResult AssistirLive()
        {
            return View();
        }
        public ActionResult principal(string mobile = "false")
        {

            Session["mobile"] = mobile;
            try
            {
                using (var db = new mussika_bdEntities())
                {

                    var distritos_ = db.distritoes.ToList();
                    ViewBag.distritoss = distritos_;

                    counterCategoriasViewModel co = new counterCategoriasViewModel()
                    {
                        acomodacoes = db.acomodacaos.Count(),
                        artigos = db.artigoes.Count(),
                        restaurantes = db.restaurantes.Count(),
                        taxis = db.taxis.Count(),
                        artecultura = db.obra_arte.Count(),
                        eventos = db.eventoes.Count(),
                        musicas = db.musicas.Count(),
                        turismo = db.turismoes.Count(),

                    };
                    int farmacia = db.farmacias.Count();
                    int hospital = db.hospitals.Count();
                    int clinicas = db.clinicas.Count();
                    co.saude = farmacia + hospital + clinicas;
                    ViewBag.counterCategoriasViewModel = co;


                    List<maisVisitadosViewModel> lista = new List<maisVisitadosViewModel>();
                    var acomodacao = db.acomodacaos.Take(3);
                    var restaurante = db.restaurantes.Take(3);
                    foreach (var item in acomodacao)
                    {
                        maisVisitadosViewModel mais_ = new maisVisitadosViewModel()
                        {
                            endereco = item.endereco,
                            e_Acomodacao = true,
                            linkhref = "/PubAcomodacao/Perfil?id=" + item.id,
                            e_Restaurante = false,
                            id_acomodacao = item.id,
                            Nome = item.nome,
                            telefone = item.telefone,
                            id_Restaurante = 0,
                            tipo = item.acomodacao_tipo.tipo,
                            foto = item.foto_capa

                        };
                        lista.Add(mais_);
                    }
                    foreach (var item in restaurante)
                    {
                        maisVisitadosViewModel mais_ = new maisVisitadosViewModel()
                        {
                            endereco = item.endereco,
                            e_Acomodacao = false,
                            linkhref = "/PubRestaurante/Perfil?id=" + item.id,
                            e_Restaurante = true,
                            id_acomodacao = 0,
                            Nome = item.nome,
                            telefone = item.telefone,
                            id_Restaurante = item.id,
                            tipo = item.restaurante_tipo.tipo,
                            foto = item.foto_capa

                        };

                        lista.Add(mais_);
                    }
                    ViewBag.maisVisitados = lista;
                }
            }
            catch (Exception ex)
            {
                return Redirect("InternalServerError");
                //throw ex;  

            }
            return View();
        }
        public ActionResult PlayMussika(int? page)
        {
            List<CompraViewModel> listaItens = new List<CompraViewModel>();
            try
            {
                long id = long.Parse(Session["idusario"].ToString());
                using (var db = new mussika_bdEntities())
                {
                    var itens = db.compras.Where(c => c.id_usuario == id && c.oque_e.Trim().ToLower().Contains("musica")).OrderByDescending(c => c.data_cadastro).ToList();
                    var filmes = db.compras.Where(c => c.id_usuario == id && c.oque_e.Trim().ToLower().Contains("filme")).OrderByDescending(c => c.data_cadastro).ToList();

                    foreach (var item in itens)
                    {
                        if (item.oque_e == "musicaAlbum") { continue; }
                        string foto = "";
                        string linkMedia = "";
                        string linkAudio = "";
                        string titulo = "";
                        string subtitulo = "";
                        switch (item.oque_e)
                        {
                            case "musica":
                                var foto_ = db.musicas.Where(m => m.id == item.id_produto).SingleOrDefault();
                                if (foto_ == null)
                                {
                                    continue;
                                }
                                foto = Constants.webUrl + "/Repository/images/musica/" + foto_.caminho_capa1;
                                linkAudio = foto_.caminho_ficheiro;
                                linkMedia = foto_.link;
                                titulo = foto_.artista_obra.nome;
                                subtitulo = foto_.titulo;
                                break;
                            case "filme":
                                var foto_filme = db.filmes.Where(m => m.id == item.id_produto).SingleOrDefault();
                                foto = Constants.webUrl + "/Repository/images/cinema/" + foto_filme.foto_capa;
                                linkMedia = foto_filme.link_trailer;
                                titulo = foto_filme.titulo_original;
                                subtitulo = "Filme";
                                break;

                        }
                        CompraViewModel compra = new CompraViewModel()
                        {
                            confirmado = item.confirmado ?? false,
                            foto_capa = foto,
                            linkVideo = linkMedia,
                            linkAudio = linkAudio,
                            data_cadastro = item.data_cadastro,
                            descricao = item.descricao,
                            id_compra = item.id_compra,
                            id_produto = item.id_produto,
                            id_usuario = item.id_usuario,
                            inactivo = item.inactivo,
                            modo_pagamento = item.modo_pagamento,
                            oque_e = item.oque_e,
                            valor = item.valor,
                            subtitulo = subtitulo,
                            titulo = titulo,
                        };


                        listaItens.Add(compra);
                    }
                    foreach (var item in filmes)
                    {
                        string foto = "";
                        string linkMedia = "";
                        string linkAudio = "";
                        string titulo = "";
                        string subtitulo = "";
                        switch (item.oque_e)
                        {
                            case "musica":
                                var foto_ = db.musicas.Where(m => m.id == item.id_produto).SingleOrDefault();
                                if (foto_ == null)
                                {
                                    continue;
                                }
                                foto = Constants.webUrl + "/Repository/images/musica/" + foto_.caminho_capa1;
                                linkAudio = foto_.caminho_ficheiro;
                                linkMedia = foto_.link;
                                titulo = foto_.artista_obra.nome;
                                subtitulo = foto_.titulo;
                                break;
                            case "filme":
                                var foto_filme = db.filmes.Where(m => m.id == item.id_produto).SingleOrDefault();
                                foto = Constants.webUrl + "/Repository/images/cinema/" + foto_filme.foto_capa;
                                linkMedia = foto_filme.link_trailer;
                                titulo = foto_filme.titulo_original;
                                subtitulo = "Filme";
                                break;

                        }
                        CompraViewModel compra = new CompraViewModel()
                        {
                            confirmado = item.confirmado ?? false,
                            foto_capa = foto,
                            linkVideo = linkMedia,
                            linkAudio = linkAudio,
                            data_cadastro = item.data_cadastro,
                            descricao = item.descricao,
                            id_compra = item.id_compra,
                            id_produto = item.id_produto,
                            id_usuario = item.id_usuario,
                            inactivo = item.inactivo,
                            modo_pagamento = item.modo_pagamento,
                            oque_e = item.oque_e,
                            valor = item.valor,
                            subtitulo = subtitulo,
                            titulo = titulo,
                        };


                        listaItens.Add(compra);
                    }

                };
            }
            catch (Exception ex)
            {

                return View("InternalServerError");
            }
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(listaItens.ToPagedList(pageNumber, pageSize));

        }
        public ActionResult Biblioteca(int? page)
        {
            List<CompraViewModel> listaItens = new List<CompraViewModel>();
            try
            {
                long id = long.Parse(Session["idusario"].ToString());
                using (var db = new mussika_bdEntities())
                {
                    var itens = db.compras.Where(c => c.id_usuario == id && c.oque_e.Trim().ToLower().Contains("arteCultura")).OrderByDescending(c => c.data_cadastro).ToList();

                    foreach (var item in itens)
                    {
                        var e_literatura = db.obra_arte.Where(o => o.id == item.id_produto).SingleOrDefault();
                        if (e_literatura == null)
                        {
                            continue;
                        }

                        CompraViewModel compra = new CompraViewModel()
                        {
                            confirmado = item.confirmado ?? false,
                            foto_capa = Constants.webUrl + "/Repository/images/ArteCultura/" + e_literatura.caminho_imagem,
                            linkVideo = e_literatura.caminho_pdf,
                            data_cadastro = item.data_cadastro,
                            descricao = item.descricao,
                            id_compra = item.id_compra,
                            id_produto = item.id_produto,
                            id_usuario = item.id_usuario,
                            inactivo = item.inactivo,
                            modo_pagamento = item.modo_pagamento,
                            oque_e = item.oque_e,
                            valor = item.valor,
                            subtitulo = e_literatura.titulo,
                            titulo = e_literatura.autor,
                        };
                        listaItens.Add(compra);
                    }

                };
            }
            catch (Exception ex)
            {

                return View("InternalServerError");
            }
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(listaItens.ToPagedList(pageNumber, pageSize));

        }


        public ActionResult mussikaPlay(long id)
        {
            ViewBag.id = id;
            using (var db = new mussika_bdEntities())
            {
                var compra = db.compras.Where(c => c.id_compra == id).SingleOrDefault();
                if (compra.oque_e == "musica")
                {
                    return LeitorAudio(id);
                }
                return Redirect("~/PubMusica/AssistirVideo?idVideo=" + compra.id_produto);
            }

        }
        public ActionResult LeitorAudio(long id)
        {
            ViewBag.id = id;
            return View("LeitorAudio");
        }
        public ActionResult getVideos(long id)
        {
            List<CompraViewModel> listaItens = new List<CompraViewModel>();
            try
            {
                long id_usu = long.Parse(Session["idusario"].ToString());

                using (var db = new mussika_bdEntities())
                {
                    var MediaAtocar = db.compras.Where(c => c.id_compra == id).SingleOrDefault();
                    var itens = db.compras.Where(c => c.id_usuario == id_usu && c.oque_e.Trim().ToLower().Contains("musica")).OrderByDescending(c => c.data_cadastro).ToList();
                    var filmes = db.compras.Where(c => c.id_usuario == id_usu && c.oque_e.Trim().ToLower().Contains("filme")).OrderByDescending(c => c.data_cadastro).ToList();

                    if (MediaAtocar.oque_e.Contains("musica"))
                    {
                        var musica = db.musicas.Where(m => m.id == MediaAtocar.id_produto).SingleOrDefault();
                        CompraViewModel media = new CompraViewModel()
                        {
                            confirmado = MediaAtocar.confirmado ?? false,
                            foto_capa = Constants.webUrl + "/Repository/images/musica/" + musica.caminho_capa1,
                            linkVideo = musica.link,
                            linkAudio = Constants.webUrl + "/Repository/Audio/" + musica.caminho_ficheiro,
                            data_cadastro = MediaAtocar.data_cadastro,
                            descricao = MediaAtocar.descricao,
                            id_compra = MediaAtocar.id_compra,
                            id_produto = MediaAtocar.id_produto,
                            id_usuario = MediaAtocar.id_usuario,
                            inactivo = MediaAtocar.inactivo,
                            modo_pagamento = MediaAtocar.modo_pagamento,
                            oque_e = MediaAtocar.oque_e,
                            valor = MediaAtocar.valor,
                            subtitulo = musica.titulo,
                            titulo = musica.artista,
                        };

                        ViewBag.media = media;
                        listaItens.Add(media);
                    }
                    else
                    {
                        var musica = db.filmes.Where(m => m.id == MediaAtocar.id_produto).SingleOrDefault();
                        CompraViewModel media = new CompraViewModel()
                        {
                            confirmado = MediaAtocar.confirmado ?? false,
                            foto_capa = Constants.webUrl + "/Repository/images/musica/" + musica.foto_capa,
                            linkVideo = musica.link_trailer,
                            linkAudio = "",
                            data_cadastro = MediaAtocar.data_cadastro,
                            descricao = MediaAtocar.descricao,
                            id_compra = MediaAtocar.id_compra,
                            id_produto = MediaAtocar.id_produto,
                            id_usuario = MediaAtocar.id_usuario,
                            inactivo = MediaAtocar.inactivo,
                            modo_pagamento = MediaAtocar.modo_pagamento,
                            oque_e = MediaAtocar.oque_e,
                            valor = MediaAtocar.valor,
                            subtitulo = musica.titulo_original,
                            titulo = "Filme - ",
                        };

                        ViewBag.media = media;
                        listaItens.Add(media);
                    }

                    foreach (var item in itens)
                    {
                        if (item.id_compra == id) { continue; }
                        if (item.oque_e == "musicaAlbum") { continue; }
                        string foto = "";
                        string linkMedia = "";
                        string linkAudio = "";
                        string titulo = "";
                        string subtitulo = "";
                        switch (item.oque_e)
                        {
                            case "musica":
                                var foto_ = db.musicas.Where(m => m.id == item.id_produto).SingleOrDefault();
                                foto = Constants.webUrl + "/Repository/images/musica/" + foto_.caminho_capa1;
                                linkAudio = Constants.webUrl + "/Repository/Audio/" + foto_.caminho_ficheiro;
                                linkMedia = foto_.link;
                                titulo = foto_.artista;
                                subtitulo = foto_.titulo;
                                break;
                            case "filme":
                                var foto_filme = db.filmes.Where(m => m.id == item.id_produto).SingleOrDefault();
                                foto = Constants.webUrl + "/Repository/images/cinema/" + foto_filme.foto_capa;
                                linkMedia = foto_filme.link_trailer;
                                titulo = foto_filme.titulo_original;
                                subtitulo = "Filme";
                                break;

                        }
                        CompraViewModel compra = new CompraViewModel()
                        {
                            confirmado = item.confirmado ?? false,
                            foto_capa = foto,
                            linkVideo = linkMedia,
                            linkAudio = linkAudio,
                            data_cadastro = item.data_cadastro,
                            descricao = item.descricao,
                            id_compra = item.id_compra,
                            id_produto = item.id_produto,
                            id_usuario = item.id_usuario,
                            inactivo = item.inactivo,
                            modo_pagamento = item.modo_pagamento,
                            oque_e = item.oque_e,
                            valor = item.valor,
                            subtitulo = subtitulo,
                            titulo = titulo,
                        };


                        listaItens.Add(compra);
                    }
                    foreach (var item in filmes)
                    {
                        if (item.id_compra == id) { continue; }
                        string foto = "";
                        string linkMedia = "";
                        string linkAudio = "";
                        string titulo = "";
                        string subtitulo = "";
                        switch (item.oque_e)
                        {
                            case "musica":
                                var foto_ = db.musicas.Where(m => m.id == item.id_produto).SingleOrDefault();
                                foto = Constants.webUrl + "/Repository/images/musica/" + foto_.caminho_capa1;
                                linkAudio = foto_.caminho_ficheiro;
                                linkMedia = foto_.link;
                                titulo = foto_.artista;
                                subtitulo = foto_.titulo;
                                break;
                            case "filme":
                                var foto_filme = db.filmes.Where(m => m.id == item.id_produto).SingleOrDefault();
                                foto = Constants.webUrl + "/Repository/images/cinema/" + foto_filme.foto_capa;
                                linkMedia = foto_filme.link_trailer;
                                titulo = foto_filme.titulo_original;
                                subtitulo = "Filme";
                                break;

                        }
                        CompraViewModel compra = new CompraViewModel()
                        {
                            confirmado = item.confirmado ?? false,
                            foto_capa = foto,
                            linkVideo = linkMedia,
                            linkAudio = linkAudio,
                            data_cadastro = item.data_cadastro,
                            descricao = item.descricao,
                            id_compra = item.id_compra,
                            id_produto = item.id_produto,
                            id_usuario = item.id_usuario,
                            inactivo = item.inactivo,
                            modo_pagamento = item.modo_pagamento,
                            oque_e = item.oque_e,
                            valor = item.valor,
                            subtitulo = subtitulo,
                            titulo = titulo,
                        };


                        listaItens.Add(compra);
                    }

                    if (MediaAtocar.oque_e == "musica")
                    {
                        listaItens = listaItens.FindAll(c => c.oque_e == "musica");
                        return Json(listaItens, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        listaItens = listaItens.FindAll(c => c.oque_e == "filme" || c.oque_e == "musicaVideo");
                        return Json(listaItens, JsonRequestBehavior.AllowGet);
                    }
                };
            }
            catch (Exception ex)
            {

                return View("InternalServerError");
            }
        }
        public ActionResult getAudios(long id)
        {
            List<CompraViewModel> listaItens = new List<CompraViewModel>();
            try
            {
                long id_usu = long.Parse(Session["idusario"].ToString());

                using (var db = new mussika_bdEntities())
                {
                    var MediaAtocar = db.compras.Where(c => c.id_compra == id).SingleOrDefault();
                    var itens = db.compras.Where(c => c.id_usuario == id_usu && c.oque_e.Trim().ToLower().Contains("musica")).OrderByDescending(c => c.data_cadastro).ToList();
                    var filmes = db.compras.Where(c => c.id_usuario == id_usu && c.oque_e.Trim().ToLower().Contains("filme")).OrderByDescending(c => c.data_cadastro).ToList();

                    if (MediaAtocar.oque_e.Contains("musica"))
                    {
                        var musica = db.musicas.Where(m => m.id == MediaAtocar.id_produto).SingleOrDefault();
                        CompraViewModel media = new CompraViewModel()
                        {
                            confirmado = MediaAtocar.confirmado ?? false,
                            foto_capa = Constants.webUrl + "/Repository/images/musica/" + musica.caminho_capa1,
                            linkVideo = musica.link,
                            linkAudio = Constants.webUrl + "/Repository/Audio/" + musica.caminho_ficheiro,
                            data_cadastro = MediaAtocar.data_cadastro,
                            descricao = MediaAtocar.descricao,
                            id_compra = MediaAtocar.id_compra,
                            id_produto = MediaAtocar.id_produto,
                            id_usuario = MediaAtocar.id_usuario,
                            inactivo = MediaAtocar.inactivo,
                            modo_pagamento = MediaAtocar.modo_pagamento,
                            oque_e = MediaAtocar.oque_e,
                            valor = MediaAtocar.valor,
                            subtitulo = musica.titulo,
                            titulo = musica.artista_obra.nome,
                        };

                        ViewBag.media = media;
                        listaItens.Add(media);
                    }
                    else
                    {
                        var musica = db.filmes.Where(m => m.id == MediaAtocar.id_produto).SingleOrDefault();
                        CompraViewModel media = new CompraViewModel()
                        {
                            confirmado = MediaAtocar.confirmado ?? false,
                            foto_capa = Constants.webUrl + "/Repository/images/musica/" + musica.foto_capa,
                            linkVideo = musica.link_trailer,
                            linkAudio = "",
                            data_cadastro = MediaAtocar.data_cadastro,
                            descricao = MediaAtocar.descricao,
                            id_compra = MediaAtocar.id_compra,
                            id_produto = MediaAtocar.id_produto,
                            id_usuario = MediaAtocar.id_usuario,
                            inactivo = MediaAtocar.inactivo,
                            modo_pagamento = MediaAtocar.modo_pagamento,
                            oque_e = MediaAtocar.oque_e,
                            valor = MediaAtocar.valor,
                            subtitulo = musica.titulo_original,
                            titulo = "Filme - ",
                        };

                        ViewBag.media = media;
                        listaItens.Add(media);
                    }

                    foreach (var item in itens)
                    {
                        if (item.id_compra == id) { continue; }
                        if (item.oque_e == "musicaAlbum") { continue; }
                        string foto = "";
                        string linkMedia = "";
                        string linkAudio = "";
                        string titulo = "";
                        string subtitulo = "";
                        switch (item.oque_e)
                        {
                            case "musica":
                                var foto_ = db.musicas.Where(m => m.id == item.id_produto).SingleOrDefault();
                                foto = Constants.webUrl + "/Repository/images/musica/" + foto_.caminho_capa1;
                                linkAudio = Constants.webUrl + "/Repository/Audio/" + foto_.caminho_ficheiro;
                                linkMedia = foto_.link;
                                titulo = foto_.artista_obra.nome;
                                subtitulo = foto_.titulo;
                                break;
                            case "filme":
                                var foto_filme = db.filmes.Where(m => m.id == item.id_produto).SingleOrDefault();
                                foto = Constants.webUrl + "/Repository/images/cinema/" + foto_filme.foto_capa;
                                linkMedia = foto_filme.link_trailer;
                                titulo = foto_filme.titulo_original;
                                subtitulo = "Filme";
                                break;

                        }
                        CompraViewModel compra = new CompraViewModel()
                        {
                            confirmado = item.confirmado ?? false,
                            foto_capa = foto,
                            linkVideo = linkMedia,
                            linkAudio = linkAudio,
                            data_cadastro = item.data_cadastro,
                            descricao = item.descricao,
                            id_compra = item.id_compra,
                            id_produto = item.id_produto,
                            id_usuario = item.id_usuario,
                            inactivo = item.inactivo,
                            modo_pagamento = item.modo_pagamento,
                            oque_e = item.oque_e,
                            valor = item.valor,
                            subtitulo = subtitulo,
                            titulo = titulo,
                        };


                        listaItens.Add(compra);
                    }
                    foreach (var item in filmes)
                    {
                        if (item.id_compra == id) { continue; }
                        string foto = "";
                        string linkMedia = "";
                        string linkAudio = "";
                        string titulo = "";
                        string subtitulo = "";
                        switch (item.oque_e)
                        {
                            case "musica":
                                var foto_ = db.musicas.Where(m => m.id == item.id_produto).SingleOrDefault();
                                foto = Constants.webUrl + "/Repository/images/musica/" + foto_.caminho_capa1;
                                linkAudio = foto_.caminho_ficheiro;
                                linkMedia = foto_.link;
                                titulo = foto_.artista_obra.nome;
                                subtitulo = foto_.titulo;
                                break;
                            case "filme":
                                var foto_filme = db.filmes.Where(m => m.id == item.id_produto).SingleOrDefault();
                                foto = Constants.webUrl + "/Repository/images/cinema/" + foto_filme.foto_capa;
                                linkMedia = foto_filme.link_trailer;
                                titulo = foto_filme.titulo_original;
                                subtitulo = "Filme";
                                break;

                        }
                        CompraViewModel compra = new CompraViewModel()
                        {
                            confirmado = item.confirmado ?? false,
                            foto_capa = foto,
                            linkVideo = linkMedia,
                            linkAudio = linkAudio,
                            data_cadastro = item.data_cadastro,
                            descricao = item.descricao,
                            id_compra = item.id_compra,
                            id_produto = item.id_produto,
                            id_usuario = item.id_usuario,
                            inactivo = item.inactivo,
                            modo_pagamento = item.modo_pagamento,
                            oque_e = item.oque_e,
                            valor = item.valor,
                            subtitulo = subtitulo,
                            titulo = titulo,
                        };


                        listaItens.Add(compra);
                    }

                    if (MediaAtocar.oque_e == "musica")
                    {
                        listaItens = listaItens.FindAll(c => c.oque_e == "musica");
                        return Json(listaItens, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        listaItens = listaItens.FindAll(c => c.oque_e == "filme" && c.oque_e == "musicaVideo");
                        return Json(listaItens, JsonRequestBehavior.AllowGet);
                    }
                };
            }
            catch (Exception ex)
            {

                return View("InternalServerError");
            }
        }
        public ActionResult perfil(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var usuario = db.Usuarios.Where(u => u.idusario == id).SingleOrDefault();
                    UsuarioViewModel usu = new UsuarioViewModel()
                    {
                        foto_capa = usuario.foto_capa,
                        idusario = usuario.idusario,
                        telefone = usuario.telefone,
                        nome = usuario.nome,
                        usuario1 = usuario.usuario1,
                    };

                    return View(usu);
                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        public ActionResult salvarPerfil(UsuarioViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var usuario = db.Usuarios.Where(u => u.idusario == model.idusario).SingleOrDefault();
                    usuario.telefone = model.telefone;
                    usuario.nome = model.nome;
                    db.SaveChanges();
                    Session["nome"] = usuario.nome;
                    return Content("true");
                }
            }
            catch (Exception)
            {

                return Content("false");
            }
        }

        [HttpPost]
        public async Task<ActionResult> UploadFoto(long id)
        {
            long id_usuario = 0;
            try
            {
                foreach (string file in Request.Files)
                {
                    var fileupload = Request.Files[file];
                    if (fileupload != null && fileupload.ContentLength > 0)
                    {
                        using (var db = new mussika_bdEntities())
                        {
                            string fileName = Path.GetFileName(fileupload.FileName);
                            int fileSize = fileupload.ContentLength;
                            int Size = fileSize / 1000000;

                            var usuario = db.Usuarios.Where(m => m.idusario == id).SingleOrDefault();
                            string novo_nome = "usuario" + usuario.idusario + DateTime.Now.ToString("ddMMyyyyHHmm") + fileName;
                            RemoverfotoUsuario(usuario.foto_capa, usuario.idusario);
                            usuario.foto_capa = novo_nome;

                            if (reziseImage(fileupload, novo_nome))
                            {
                                db.SaveChanges();
                                //Session.Abandon();
                                //return Redirect("/inicio/principal");
                                Session["imagem"] = "../Repository/images/usuario/" + usuario.foto_capa;
                                return Json("File uploaded successfully");
                            }


                        }
                    }
                }
            }
            catch (Exception)
            {
                Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return Json("Upload failed");
            }

            return Json("File uploaded successfully");
        }

        public bool reziseImage(HttpPostedFileBase fileupload, string novoNome)
        {
            HttpPostedFileBase fileupload1 = fileupload;
            var originalDirectory = new DirectoryInfo(string.Format("{0}Repository\\images", Server.MapPath(@"\")));
            string pathString2 = System.IO.Path.Combine(originalDirectory.ToString(), "usuario");
            string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "tempImage");
            //var fileName1 = Path.GetFileName(fileupload1.FileName);
            var path = string.Format("{0}\\{1}", pathString, novoNome);

            fileupload1.SaveAs(path);

            System.Drawing.Image image = System.Drawing.Image.FromFile(path);

            int newwidthimg = image.Width;

            float AspectRatio = (float)image.Size.Width / (float)image.Size.Height;

            int newHeight = image.Height;

            //int maxHeight = 500;
            //int maxWidth = 500;

            //newHeight = (newHeight * maxWidth) / newwidthimg;
            //newwidthimg = maxWidth;
            //if (newHeight > maxHeight)
            //{
            //    newwidthimg = (newwidthimg * maxHeight) / newHeight;
            //    newHeight = maxHeight;
            //}

            Bitmap bitMAP1 = new Bitmap(newwidthimg, newHeight);

            //Graphics imgGraph = Graphics.FromImage(bitMAP1);

            var thumbnailGraph = Graphics.FromImage(bitMAP1);
            thumbnailGraph.CompositingQuality = CompositingQuality.HighQuality;
            //bitMAP1.imgQuality = CompositingQuality.HighQuality;
            thumbnailGraph.SmoothingMode = SmoothingMode.HighQuality;
            //bitMAP1.SmoothingMode = SmoothingMode.HighQuality;
            thumbnailGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            thumbnailGraph.PixelOffsetMode = PixelOffsetMode.HighQuality;
            //bitMAP1.InterpolationMode = InterpolationMode.HighQualityBicubic;

            var imageRectangle = new Rectangle(0, 0, newwidthimg, newHeight);

            thumbnailGraph.DrawImage(image, imageRectangle);
            //bitMAP1.DrawImage(image, imageRectangle);

            bitMAP1.Save(Server.MapPath("~/Repository/images/usuario/" + novoNome));

            bitMAP1.Dispose();

            thumbnailGraph.Dispose();

            image.Dispose();


            string fullPath = Request.MapPath("~/Repository/images/tempImage/" + novoNome);
            if (System.IO.File.Exists(fullPath))

            {

                System.IO.File.Delete(fullPath);
                return true;

            }
            else
            {
                return false;
            }
        }

        public ActionResult RemoverfotoUsuario(string filename, long id)
        {
            try
            {
                if (!string.IsNullOrEmpty(filename))
                {
                    if (filename.Trim().ToLower() != "")
                    {


                        string fullPath = Request.MapPath("~/Repository/images/usuario/" + filename);
                        if (System.IO.File.Exists(fullPath))
                        {
                            if (alterarCaminhoUsuario(id))
                            {
                                System.IO.File.Delete(fullPath);
                            }

                        }

                    }

                }
                else
                {
                    return Content("true");
                }


            }
            catch (Exception)
            {

                return Content("false");
            }


            return Content("true");
        }

        private bool alterarCaminhoUsuario(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var qua = db.Usuarios.Where(f => f.idusario == id).SingleOrDefault();
                    qua.foto_capa = "noimage.jpg";
                    db.SaveChanges();
                }
                return true;
            }
            catch (Exception)
            {

                return false;
            }

        }
        public ActionResult Pesquisar(int? page, string filtro, int distrito = 0, string categoria = "")
        {
            List<pesquisaViewModel> resultados = new List<pesquisaViewModel>();
            try
            {
                ViewBag.filtro = filtro;
                ViewBag.distrito = distrito;
                ViewBag.categoria = categoria;

                using (var db = new mussika_bdEntities())
                {
                    //////SHOP MUSSIKA////////////////////////////
                    if (categoria == "shopmussika")
                    {
                        if (distrito == 0)
                        {
                            var result = db.artigoes.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                            var result_loja = db.lojas.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                            var result_loja_produto = db.loja_produto.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                            foreach (var item in result)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.descricao.Length > 200 ? item.descricao.Substring(0, 200) : item.descricao,
                                    endereco = Constants.webUrl + "/PubShopMussika/Perfil?id=" + item.id,
                                    nome = item.nome,
                                    foto = "../Repository/images/Artigos/" + item.foto_capa,
                                };
                                resultados.Add(novo);
                            }
                            foreach (var item in result_loja)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.descricao.Length > 200 ? item.descricao.Substring(0, 200) : item.descricao,
                                    endereco = Constants.webUrl + "/lojas/Detalhes_loja?id=" + item.id,
                                    nome = item.nome,
                                    foto = "../Repository/images/lojas/" + item.foto_capa,
                                };
                                resultados.Add(novo);
                            }
                            foreach (var item in result_loja_produto)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.descricao.Length > 200 ? item.descricao.Substring(0, 200) : item.descricao,
                                    endereco = Constants.webUrl + "/PubShopMussika/DetalhesProduto?id=" + item.id,
                                    nome = item.nome,
                                    foto = "../Repository/images/lojas/" + item.foto_capa,
                                };
                                resultados.Add(novo);
                            }
                        }
                        else
                        {
                            var result = db.artigoes.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower()) && r.id_distrito == distrito);

                            foreach (var item in result)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.descricao.Length > 200 ? item.descricao.Substring(0, 200) : item.descricao,
                                    endereco = Constants.webUrl + "/PubShopMussika/Perfil?id=" + item.id,
                                    nome = item.nome,
                                    foto = "../Repository/images/Artigos/" + item.foto_capa,
                                };
                                resultados.Add(novo);
                            }
                        }


                    }
                    //////MUSICA////////////////////////////
                    if (categoria == "musica")
                    {
                        var result = db.musicas.Where(r => r.artista.Trim().ToLower().Contains(filtro.Trim().ToLower()) && r.inactiva == false);
                        var result_album = db.musica_album.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower()) && r.inactivo == false);
                        foreach (var item in result)
                        {
                            pesquisaViewModel novo = new pesquisaViewModel()
                            {
                                descricao = "Titulo - " + item.titulo,
                                foto = "../Repository/images/musica/" + item.caminho_capa1,
                                endereco = Constants.webUrl + "/PubMusica/Musica?id=" + item.id,
                                nome = item.artista,
                            };
                            resultados.Add(novo);
                        }
                        foreach (var item in result_album)
                        {
                            pesquisaViewModel novo = new pesquisaViewModel()
                            {
                                descricao = "Album",
                                foto = "../Repository/images/musica/" + item.foto_capa,
                                endereco = Constants.webUrl + "/PubMusica/AlbumDetalhe?id=" + item.id,
                                nome = item.nome,
                            };
                            resultados.Add(novo);
                        }

                    }
                    //////ACOMODACAO////////////////////////////
                    if (categoria == "acomodacao")
                    {
                        if (distrito == 0)
                        {
                            var result = db.acomodacaos.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                            foreach (var item in result)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.descricao.Length > 200 ? item.descricao.Substring(0, 200) : item.descricao,
                                    endereco = Constants.webUrl + "/PubAcomodacao/Perfil?id=" + item.id,
                                    nome = item.nome,
                                    foto = "../Repository/images/Acomodacoes/" + item.foto_capa,
                                };
                                resultados.Add(novo);
                            }
                        }
                        else
                        {
                            var result = db.acomodacaos.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower()) && r.id_distrito == distrito);

                            foreach (var item in result)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.descricao.Length > 200 ? item.descricao.Substring(0, 200) : item.descricao,
                                    endereco = Constants.webUrl + "/PubAcomodacao/Perfil?id=" + item.id,
                                    nome = item.nome,
                                    foto = "../Repository/images/Acomodacoes/" + item.foto_capa,
                                };
                                resultados.Add(novo);
                            }
                        }


                    }
                    //////TAXI////////////////////////////
                    if (categoria == "taxi")
                    {
                        if (distrito == 0)
                        {
                            var result = db.taxis.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                            foreach (var item in result)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.telefone.Length > 200 ? item.telefone.Substring(0, 200) : item.distrito.nome,
                                    endereco = "#",
                                    nome = item.nome,
                                    foto = "../Repository/images/diversos/taxi.jpg",
                                };
                                resultados.Add(novo);
                            }
                        }
                        else
                        {
                            var result = db.taxis.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower()) && r.id_distrito == distrito);

                            foreach (var item in result)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.telefone.Length > 200 ? item.telefone.Substring(0, 200) : item.distrito.nome,
                                    endereco = "#",
                                    nome = item.nome,
                                    foto = "../Repository/images/diversos/taxi.jpg",
                                };
                                resultados.Add(novo);
                            }
                        }


                    }
                    //////EVENTO////////////////////////////
                    if (categoria == "eventos")
                    {
                        if (distrito == 0)
                        {
                            var result = db.eventoes.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                            foreach (var item in result)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.descricao.Length > 200 ? item.descricao.Substring(0, 200) : item.descricao,
                                    endereco = Constants.webUrl + "/Eventos/Detalhes?id=" + item.id,
                                    nome = item.nome,
                                    foto = "../Repository/images/eventos/" + item.foto_capa,
                                };
                                resultados.Add(novo);
                            }
                        }
                        else
                        {
                            var result = db.eventoes.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower()) && r.id_distrito == distrito);

                            foreach (var item in result)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.descricao.Length > 200 ? item.descricao.Substring(0, 200) : item.descricao,
                                    endereco = Constants.webUrl + "/Eventos/Detalhes?id=" + item.id,
                                    nome = item.nome,
                                    foto = "../Repository/images/eventos/" + item.foto_capa,
                                };
                                resultados.Add(novo);
                            }
                        }


                    }
                    //////TURISMO////////////////////////////
                    if (categoria == "turismo")
                    {
                        if (distrito == 0)
                        {
                            var result = db.turismoes.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                            foreach (var item in result)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.descricao.Length > 200 ? item.descricao.Substring(0, 200) : item.descricao,
                                    endereco = Constants.webUrl + "/Turismo/Detalhes?id=" + item.id,
                                    nome = item.nome,
                                    foto = "../Repository/images/turismo/" + item.foto_capa,
                                };
                                resultados.Add(novo);
                            }
                        }
                        else
                        {
                            var result = db.turismoes.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower()) && r.id_distrito == distrito);

                            foreach (var item in result)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.descricao.Length > 200 ? item.descricao.Substring(0, 200) : item.descricao,
                                    endereco = Constants.webUrl + "/Turismo/Detalhes?id=" + item.id,
                                    nome = item.nome,
                                    foto = "../Repository/images/turismo/" + item.foto_capa,
                                };
                                resultados.Add(novo);
                            }
                        }


                    }
                    //////RESTTAURANTES////////////////////////////
                    if (categoria == "restaurantes")
                    {
                        if (distrito == 0)
                        {
                            var result = db.restaurantes.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                            foreach (var item in result)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.descricao.Length > 200 ? item.descricao.Substring(0, 200) : item.descricao,
                                    endereco = Constants.webUrl + "/PubRestaurante/Perfil?id=" + item.id,
                                    nome = item.nome,
                                    foto = "../Repository/images/Restaurantes/" + item.foto_capa,
                                };
                                resultados.Add(novo);
                            }
                        }
                        else
                        {
                            var result = db.restaurantes.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower()) && r.id_distrito == distrito);

                            foreach (var item in result)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.descricao.Length > 200 ? item.descricao.Substring(0, 200) : item.descricao,
                                    endereco = Constants.webUrl + "/PubRestaurante/Perfil?id=" + item.id,
                                    nome = item.nome,
                                    foto = "../Repository/images/Restaurantes/" + item.foto_capa,
                                };
                                resultados.Add(novo);
                            }
                        }


                    }
                    //////SAUDE////////////////////////////
                    if (categoria == "saude")
                    {
                        if (distrito == 0)
                        {
                            var hospitais = db.hospitals.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                            foreach (var item in hospitais)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.descricao.Length > 200 ? item.descricao.Substring(0, 200) : item.descricao,
                                    endereco = Constants.webUrl + "/PubSaude/Hospital?id=" + item.id,
                                    nome = item.nome,
                                    foto = "../Repository/images/hospitais/" + item.foto_capa,
                                };
                                resultados.Add(novo);
                            }
                            var clinicas = db.clinicas.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                            foreach (var item in clinicas)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.descricao.Length > 200 ? item.descricao.Substring(0, 200) : item.descricao,
                                    endereco = Constants.webUrl + "/PubSaude/Clinica?id=" + item.id,
                                    nome = item.nome,
                                    foto = "../Repository/images/clinicas/" + item.foto_capa,
                                };
                                resultados.Add(novo);
                            }
                            var result = db.farmacias.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                            var result_farmacia_produto = db.farmacia_produto.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                            foreach (var item in result)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.descricao.Length > 200 ? item.descricao.Substring(0, 200) : item.descricao,
                                    endereco = Constants.webUrl + "/PubSaude/Farmacia?id=" + item.id,
                                    nome = item.nome,
                                    foto = "../Repository/images/farmacias/" + item.foto_capa,
                                };
                                resultados.Add(novo);
                            }
                            foreach (var item in result_farmacia_produto)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.descricao.Length > 200 ? item.descricao.Substring(0, 200) : item.descricao,
                                    endereco = Constants.webUrl + "/PubSaude/DetalhesProduto?id=" + item.id,
                                    nome = item.nome,
                                    foto = "../Repository/images/farmacias/" + item.foto_capa,
                                };
                                resultados.Add(novo);
                            }
                        }
                        else
                        {
                            var hospitais = db.hospitals.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower()) && r.id_distrito == distrito);

                            foreach (var item in hospitais)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.descricao.Length > 200 ? item.descricao.Substring(0, 200) : item.descricao,
                                    endereco = Constants.webUrl + "/PubSaude/Hospital?id=" + item.id,
                                    nome = item.nome,
                                    foto = "../Repository/images/hospitais/" + item.foto_capa,
                                };
                                resultados.Add(novo);
                            }
                            var clinicas = db.clinicas.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower()) && r.id_distrito == distrito);
                            foreach (var item in clinicas)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.descricao.Length > 200 ? item.descricao.Substring(0, 200) : item.descricao,
                                    endereco = Constants.webUrl + "/PubSaude/Clinica?id=" + item.id,
                                    nome = item.nome,
                                    foto = "../Repository/images/clinicas/" + item.foto_capa,
                                };
                                resultados.Add(novo);
                            }
                            var result = db.farmacias.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower()) && r.id_distrito == distrito);
                            var result_farmacia_produto = db.farmacia_produto.Where(r => r.nome.Trim().ToLower().Contains(filtro.Trim().ToLower()));
                            foreach (var item in result)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.descricao.Length > 200 ? item.descricao.Substring(0, 200) : item.descricao,
                                    endereco = Constants.webUrl + "/PubSaude/Farmacia?id=" + item.id,
                                    nome = item.nome,
                                    foto = "../Repository/images/farmacias/" + item.foto_capa,
                                };
                                resultados.Add(novo);

                            }
                            foreach (var item in result_farmacia_produto)
                            {
                                pesquisaViewModel novo = new pesquisaViewModel()
                                {
                                    descricao = item.descricao.Length > 200 ? item.descricao.Substring(0, 200) : item.descricao,
                                    endereco = Constants.webUrl + "/PubSaude/DetalhesProduto?id=" + item.id,
                                    nome = item.nome,
                                    foto = "../Repository/images/farmacias/" + item.foto_capa,
                                };
                                resultados.Add(novo);
                            }
                        }


                    }
                    //////ARTE CULTURA////////////////////////////
                    if (categoria == "artecultura")
                    {
                        var result = db.obra_arte.Where(r => r.titulo.Trim().ToLower().Contains(filtro.Trim().ToLower()) && r.artista_obra.e_musico == false);
                        foreach (var item in result)
                        {
                            pesquisaViewModel novo = new pesquisaViewModel()
                            {
                                descricao = item.proprietario,
                                foto = "../Repository/images/ArteCultura/" + item.artista_obra.fotografia,
                                endereco = Constants.webUrl + "/arte_cultura/Perfil?id=" + item.id,
                                nome = item.titulo,
                            };
                            resultados.Add(novo);
                        }

                    }

                }
            }
            catch (Exception ex)
            {

                return Redirect("Error/InternalServerError");
            }
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(resultados.ToPagedList(pageNumber, pageSize));
        }


        public ActionResult restaurantes(string sortOrder, string currentFilter, string searchString, int? page, int id_distrito = 0)
        {
            List<RestViewModel> listaRestaurantes = new List<RestViewModel>();
            try
            {
                ViewBag.CurrentSort = sortOrder;
                ViewBag.NameSortParm = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
                ViewBag.DateSortParm = sortOrder == "Date" ? "date_desc" : "Date";

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
                    List<restaurante> restaurantes = db.restaurantes.ToList();
                    if (id_distrito != 0)
                    {

                        restaurantes = db.restaurantes.Where(r => r.id_distrito == id_distrito).ToList();
                    }

                    if (!string.IsNullOrWhiteSpace(searchString))
                    {
                        restaurantes = restaurantes.FindAll(s => s.nome.Trim().ToLower().Contains(searchString.Trim().ToLower())).ToList();
                    }

                    foreach (var model in restaurantes)
                    {
                        RestViewModel ProVM = new RestViewModel()
                        {
                            id_distrito = (int)model.id_distrito,
                            nome = model.nome,
                            id_restaurante_tipo = (int)model.id_restaurante_tipo,
                            email = model.email,
                            //descricao = model.descricao.Substring(0, 200) + "...",
                            endereco = model.endereco,
                            foto_capa = model.foto_capa,
                            mapa = model.mapa,
                            telefone = model.telefone,
                            website = model.website,
                            activo = true,
                            nomeDistrito = model.distrito.nome,
                            id = model.id,
                            nomeRestauranteTipo = model.restaurante_tipo.tipo,
                        };
                        if (model.descricao != null)
                        {
                            if (model.descricao.Length > 200) { ProVM.descricao = model.descricao.Substring(0, 200); } else { ProVM.descricao = model.descricao; }
                        }
                        listaRestaurantes.Add(ProVM);
                    }
                    List<distrito> distritos_ = db.distritoes.ToList();
                    ViewBag.distritos = distritos_;

                    int pageSize = 3;
                    int pageNumber = (page ?? 1);
                    return View(listaRestaurantes.ToPagedList(pageNumber, pageSize));

                }
            }
            catch (Exception)
            {


            }
            return View(listaRestaurantes);
        }

        public ActionResult pageNotFound()
        {
            return View();
        }
        public ActionResult InternalServerError()
        {
            return View();
        }

        public ActionResult Distritos(string sortOrder, string currentFilter, string searchString, int? page)
        {
            List<DistritoViewModel> listaDistritos = new List<DistritoViewModel>();
            try
            {
                ViewBag.CurrentSort = sortOrder;
                ViewBag.NameSortParm = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
                ViewBag.DateSortParm = sortOrder == "Date" ? "date_desc" : "Date";

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
                    List<distrito> distritos = db.distritoes.ToList();

                    foreach (var model in distritos)
                    {
                        DistritoViewModel ProVM = new DistritoViewModel()
                        {
                            activar_galeria = (bool)model.activar_galeria,
                            area = model.area,
                            codigo = model.codigo,
                            descricao = model.descricao,
                            foto_capa = model.foto_capa,
                            latitude = model.latitude,
                            linkmapa = model.linkmapa,
                            longitude = model.longitude,
                            nome = model.nome.ToUpper(),
                            populacao = model.populacao,
                            visitas = (long)model.visitas,
                            id = model.id,
                        };
                        listaDistritos.Add(ProVM);
                    }
                    int pageSize = 10;
                    int pageNumber = (page ?? 1);
                    return View(listaDistritos.ToPagedList(pageNumber, pageSize));
                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }

        public ActionResult empresa()
        {
            using (var db = new mussika_bdEntities())
            {
                var empresa = db.empresas.First();
                if (empresa != null)
                {
                    EmpresaViewModel nova = new EmpresaViewModel()
                    {
                        id = empresa.id,
                        descricao = empresa.descricao,
                        email = empresa.email,
                        endereco = empresa.endereco,
                        telefone = empresa.telefone,
                        website = empresa.website,
                    };
                    return View("Info", nova);

                }
                return View();
            }
        }
        public ActionResult produtos()
        {
            List<publicidadeViewModel> lista = new List<publicidadeViewModel>();
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var pacotes = db.pacote_subscricao.Where(p => p.activo == true);
                    foreach (var item in pacotes)
                    {
                        publicidadeViewModel pub = new publicidadeViewModel()
                        {
                            nome = item.nome,
                            id = item.id,
                            preco_por_mes = (decimal)item.preco_por_mes,
                        };
                        var beneficios = db.item_pacote_subscricao.Where(p => p.id_pacote_subscricao == item.id);

                        List<beneficio_pacote> beneficios_ = new List<beneficio_pacote>();
                        foreach (var ben in beneficios)
                        {
                            beneficio_pacote ben_ = new beneficio_pacote()
                            {
                                item_nome = ben.item_nome,
                                id_item = ben.id,
                            };
                            beneficios_.Add(ben_);
                        }
                        pub.beneficiosPacote = beneficios_;
                        lista.Add(pub);
                    }

                }
            }
            catch (Exception)
            {

                return Redirect("Error/InternalServerError");
            }
            return View(lista);
        }

        public ActionResult pagar_subscricao(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {

                    var pacote = db.pacote_subscricao.Where(p => p.id == id).SingleOrDefault();
                    return View(pacote);
                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        public ActionResult salvar_pagamento_subscricao(pagamento_subscricao model)
        {
            try
            {
                long id_provedor = long.Parse(Session["idusario"].ToString());

                using (var db = new mussika_bdEntities())
                {
                    pagamento_subscricao nova = new pagamento_subscricao()
                    {
                        celular = model.celular,
                        confirmado = false,
                        email = model.email,
                        endereco = model.endereco,
                        id_usuario = id_provedor,
                        informacao_adicional = model.informacao_adicional,
                        nome_entidade = model.nome_entidade,
                        tipo_actividade = model.tipo_actividade,
                        id_pacote_subscricao = model.id_pacote_subscricao,
                        data_cadastro = DateTime.Now,
                        validade = DateTime.Now.AddDays(30),

                    };
                    var record=db.pagamento_subscricao.Add(nova);
                    db.SaveChanges();

                    return Redirect("~/Pagamento/paymentGateway?oque=subscricao&id_produto="+record.id_pacote_subscricao);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }


        public ActionResult seguranca()
        {
            EmpresaViewModel nova = new EmpresaViewModel();

            using (var db = new mussika_bdEntities())
            {
                var empresa = db.empresas.First();

                if (empresa != null)
                {
                    nova.id = empresa.id;
                    nova.descricao = empresa.descricao;
                    nova.email = empresa.email;
                    nova.endereco = empresa.endereco;
                    nova.telefone = empresa.telefone;
                    nova.website = empresa.website;
                    nova.seguranca = empresa.seguranca;
                }

                return View(nova);
            }
        }

        public ActionResult como_pagar()
        {
            EmpresaViewModel nova = new EmpresaViewModel();

            using (var db = new mussika_bdEntities())
            {
                var empresa = db.empresas.First();

                if (empresa != null)
                {
                    nova.id = empresa.id;
                    nova.descricao = empresa.descricao;
                    nova.email = empresa.email;
                    nova.endereco = empresa.endereco;
                    nova.telefone = empresa.telefone;
                    nova.website = empresa.website;
                    nova.seguranca = empresa.seguranca;
                    nova.comopagar = empresa.como_pagar;
                }

                return View(nova);
            }
        }

        public ActionResult ajuda()
        {
            return View();
        }
        //public ActionResult acomodacoes()
        //{
        //    return View();
        //}

        public ActionResult bens_servicos()
        {

            List<servico_categoria> categorias = new List<servico_categoria>();
            List<distrito> distritos = new List<distrito>();

            try
            {

                using (var uow = new mussika_bdEntities())
                {
                    categorias = uow.servico_categoria.ToList();
                    distritos = uow.distritoes.ToList();
                }


            }
            catch (Exception) { }

            ViewBag.categorias = categorias;
            ViewBag.distritos = distritos;

            return View();
        }

        public ActionResult bens_servicos_partial(int id_distrito = 0, int id_categoria = 0, string indice = "0", string perpage = "6")
        {
            int indc = int.Parse(indice);
            int pp = int.Parse(perpage);


            List<servico> lista_servicos = new List<servico>();
            List<servicoViewModel> model = new List<servicoViewModel>();

            try
            {
                using (var uow = new mussika_bdEntities())
                {

                    lista_servicos = uow.servicoes.ToList();
                    if (id_distrito > 0) { lista_servicos = lista_servicos.Where(x => x.id_distrito == id_distrito).ToList(); }
                    if (id_categoria > 0) { lista_servicos = lista_servicos.Where(x => x.id_servico_categoria == id_categoria).ToList(); }

                    foreach (servico s in lista_servicos)
                    {
                        servicoViewModel sd = new servicoViewModel();
                        sd.id = s.id;
                        sd.nome = s.nome;
                        sd.endereco = s.endereco;
                        sd.telefone = s.telefone;
                        sd.email = s.email;
                        sd.id_servico_categoria = (int)s.id_servico_categoria;
                        sd.nomeCategoria = s.servico_categoria.nome;
                        model.Add(sd);
                    }
                }

            }
            catch (Exception) { }

            ViewBag.current_page = indice;
            ViewBag.records_perpage = pp;
            ViewBag.lista_distritos = model;

            return PartialView("~/Views/Inicio/Partials/bens_servicos_partial.cshtml", model.Skip(indc).Take(pp).ToList());
        }

        public ActionResult servico_taxi()
        {
            return View();
        }


    }
}

