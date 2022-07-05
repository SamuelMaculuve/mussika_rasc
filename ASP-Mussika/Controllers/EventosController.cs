using ASP_Mussika.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class EventosController : Controller
    {
        // GET: Eventos
        public ActionResult categorias()
        {
            return View();
        }
        public ActionResult CriarSolicitacao()
        {
            return View();
        }

        public ActionResult submeterEvento(EventoViewModel model)
        {
            try
            {
                MailMessage message = new MailMessage();
                SmtpClient smtp = new SmtpClient("wsrv1.mozdomains.com");
                message.From = new MailAddress("confirmacao@mussika.co.mz");
                message.To.Add(new MailAddress("info@mussika.co.mz"));
                message.Subject = "[MUSSIKA] – SOLICITAÇÃO DE CADASTRO DE EVENTO";
                message.IsBodyHtml = true; //to make message body as html  
                message.Body = "<p>Prezada Equipe Mussika,</p> <p>Por meio deste Email venho Solicitar o cadastro de um evento com os seguintes dados abaixos:" +
                    "<br/>" +
                    "</p>Nome do Evento: " + model.nome + " </p><br/>" +
                    "</p>Nome do Responsável: " + model.Responsavel + " </p><br/>" +
                    "</p>Tipo Evento: " + model.nome_categoria + " </p><br/>" +
                    "</p>Email: " + model.email + " </p><br/>" +
                    "</p>Celular: " + model.celular + " </p><br/>" +
                    "</p>Orador/Moderador: " + model.moderador + " </p>v" +
                    "</p>Endreço: " + model.local + " </p><br/>" +
                    "</p>Provincia: " + "Zambezia" + " </p><br/>" +
                    "</p>Distrito: " + model.nome_distrito + " </p><br/>" +
                    "</p>Tema do Evento: " + model.nome + " </p><br/>" +
                    "</p>Duração: " + "-" + " </p><br/>" +
                    "</p>Preço Bilhete Normal: " + model.preco_bilhete + " </p><br/>" +
                    "</p>Bilhete VIP: " + model.preco_bilhete + " </p><br/>" +
                    "</p>Descrição: " + model.descricao + " </p><br/>" +
                    "<br/>" +
                    "</p>Sem mais a dizer, Atenciosamente, melhores Cumprimentos</p>";


                smtp.EnableSsl = false;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("confirmacao@mussika.co.mz", "mussika123456789");
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(message);
            }
            catch (Exception)
            {

                return Content("false");
            }
            return Content("true");
        }
        public ActionResult academicos()
        {
            return View();
        }
        public ActionResult Index(int? page,string categoria="")
        {
            List<EventoViewModel> model_ = new List<EventoViewModel>();
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var categoria_ = db.evento_categoria.Where(c => c.descricao.Trim().ToLower() == categoria.Trim().ToLower()).SingleOrDefault();
                   var eventos = db.eventoes.Where(e=>e.id_categoria==categoria_.id).OrderByDescending(e=>e.data_cadastro);
                    foreach (var model in eventos)
                    {
                        EventoViewModel ProVM = new EventoViewModel()
                        {
                            id = model.id,
                            adiado = model.adiado??false,
                            data_cadastro = DateTime.Now,
                            data_evento = model.data_evento??DateTime.MinValue,
                            data_evento_convertido = model.data_evento!=null? model.data_evento.Value.ToString("MM-dd-yyyy"):DateTime.MinValue.ToString("MM-dd-yyyy"),
                            descricao = model.descricao,
                            foto_capa = model.foto_capa,
                            id_distrito =model.id_distrito??0,
                            inactivo = model.inactivo??false,
                            local = model.local,
                            nome = model.nome,
                            realizado = model.realizado??false,
                            nome_distrito = model.distrito.nome,
                            preco_bilhete=model.preco_bilhete??0,
                            
                        };
                        ProVM.comentarios = db.evento_comentario.Where(e => e.id_evento == model.id).Count();
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
            int pageSize = 5;
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
                    var model = db.eventoes.Where(e => e.id == id).SingleOrDefault();
                    EventoViewModel ProVM = new EventoViewModel()
                    {
                        id = model.id,
                        adiado = (bool)model.adiado,
                        data_cadastro = DateTime.Now,
                        //data_evento = (DateTime)model.data_evento,
                        data_evento_convertido = DateTime.Now.ToString("MM-dd-yyyy"),
                        descricao = model.descricao,
                        foto_capa = model.foto_capa,
                        id_distrito = model.id_distrito??0,
                        inactivo = model.inactivo??false,
                        local = model.local,
                        nome = model.nome,
                        realizado = model.realizado??false,
                        nome_distrito = model.distrito.nome,
                        preco_bilhete=model.preco_bilhete??0,
                        preco_bilhete_vip=model.preco_bilhete_vip??0,
                        moderador=model.moderador,
                        nr_participantes=model.nr_participantes??0,
                        orador=model.orador,
                        part_assistente=model.part_assistente,
                        nome_categoria=model.evento_categoria.descricao,
                    };
                    ProVM.comentarios = db.evento_comentario.Where(e => e.id_evento == model.id).Count();
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
                            evento_comentario novac = new evento_comentario()
                                {
                                    comentario = model.comentario,
                                    id_evento = model.id_evento,
                                    data_cadastro = DateTime.Now,
                                    id_usuario = model.id_usuario,
                                    valido = true,
                                };
                                db.evento_comentario.Add(novac);
                                db.SaveChanges();
                            }
                        

                    }
                    else
                    {
                       

                        if (!string.IsNullOrEmpty(model.comentario))
                        {
                            evento_comentario novac = new evento_comentario()
                            {
                                comentario = model.comentario,
                                id_evento = model.id_evento,
                                data_cadastro = DateTime.Now,
                                nomeUsuario = model.nomeUsuario,
                                email = model.email,
                                valido = true,
                            };
                            db.evento_comentario.Add(novac);
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
                    List<evento_comentario> comentarios = db.evento_comentario.Where(c => c.id_evento == id && c.valido == true).OrderByDescending(d => d.data_cadastro).ToList();
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
            return PartialView("_EventoComentario", listaComentarios.ToPagedList(pageNumber, pageSize));
        }

    }
}