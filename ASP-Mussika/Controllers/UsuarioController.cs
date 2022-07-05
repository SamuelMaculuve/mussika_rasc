using ASP_Mussika.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class UsuarioController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            try
            {
                if (Session["tipo"].ToString() == "3")
                {

                    base.OnActionExecuting(filterContext);
                }

                else
                {
                    filterContext.Result = new RedirectResult("~/inicio/principal");
                }
            }
            catch (Exception)
            {

                filterContext.Result = new RedirectResult("~/inicio/principal");
            }


        }
        public const string MatchEmailPattern =
          @"^(([\w-]+\.)+[\w-]+|([a-zA-Z]{1}|[\w-]{2,}))@"
   + @"((([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.([0-1]?
				[0-9]{1,2}|25[0-5]|2[0-4][0-9])\."
   + @"([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.([0-1]?
				[0-9]{1,2}|25[0-5]|2[0-4][0-9])){1}|"
   + @"([a-zA-Z0-9]+[\w-]+\.)+[a-zA-Z]{1}[a-zA-Z0-9-]{1,23})$";
        // GET: Login
        public static bool IsEmail(string email)
        {
            if (email != null) return Regex.IsMatch(email, MatchEmailPattern);
            else return false;
        }
        // GET: Usuario
        public ActionResult Index()
        {
            return View();
        }

        public List<UsuarioViewModel> UsuariosList()
        {
            List<UsuarioViewModel> listaUsuarios = new List<UsuarioViewModel>();

            using (var db = new mussika_bdEntities())
            {
                var usuarios = db.Usuarios.OrderByDescending(P => P.idusario);


                foreach (var model in usuarios)
                {
                    UsuarioViewModel ProVM = new UsuarioViewModel()
                    {
                        idusario = model.idusario,
                        nome = model.nome ?? "",
                        activo = model.activo ?? false,
                        autenticado = model.autenticado ?? false,
                        cod_autenticao = model.cod_autenticao,
                        datacadastro = model.datacadastro ?? DateTime.MinValue,
                        usuario1 = model.usuario1,
                        id_usuario_tipo = model.id_usuario_tipo ?? 0,
                        tipoUsuario = model.usuario_tipo != null ? model.usuario_tipo.tipo : "",
                    };
                    listaUsuarios.Add(ProVM);
                }
            }
            return listaUsuarios;


        }

        [HttpPost]
        public ActionResult carregarTabelaUsuariosByAjax(int draw, int start, int length)
        {
            // Search Value  
            string search = Request.Form.GetValues("search[value]").FirstOrDefault();
            // Sort columns value  
            var sortColumn = Request.Form.GetValues("columns[" + Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault();
            var sortColumnDir = Request.Form.GetValues("order[0][dir]").FirstOrDefault();
            if (Request.IsAjaxRequest())
            {
                int pageSize = length != null ? Convert.ToInt32(length) : 0;
                int skip = start != null ? Convert.ToInt32(start) : 0;
                int recordsTotal = 0;
                int recordFilteredTotal = 0;
                // Get Employee Records.   
                var produtos = UsuariosList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.usuario1.ToUpper().Contains(search.ToUpper()) || u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<UsuarioViewModel>;
                Func<UsuarioViewModel, string> orderingFunction = (c => sortColumn == "idusario" ? c.idusario.ToString() :
                                          sortColumn == "nome" ? c.nome :
                                          sortColumn == "usuario1" ? c.usuario1 :
                                          sortColumn == "tipoUsuario" ? c.tipoUsuario.ToString()



                                          : c.nome);
                if (sortColumnDir == "asc")
                    filteredData = filteredData.OrderBy(orderingFunction);
                else
                    filteredData = filteredData.OrderByDescending(orderingFunction);
                // 4. Filtering  
                filteredData = filteredData.Skip(skip).Take(pageSize).ToList();
                // 5. Get the filtered record count  
                recordFilteredTotal = filteredData.Count();
                return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordFilteredTotal, data = filteredData }, JsonRequestBehavior.AllowGet);
            }
            return View();
        }

        public ActionResult criarUsuario(UsuarioViewModel model)
        {
            using (var db = new mussika_bdEntities())
            {
                List<usuario_tipo> tiposUsuarios_ = db.usuario_tipo.ToList();
                ViewBag.tiposUsuarios = new SelectList(tiposUsuarios_, "id", "tipo");

            };

            return View();
        }

        public ActionResult Salvar(UsuarioViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    if (!IsEmail(model.usuario1)) { return Content("emailinvalido"); }
                    var usu = db.Usuarios.Where(u => u.usuario1.Trim().ToLower() == model.usuario1.Trim().ToLower()).SingleOrDefault();
                    if (usu != null)
                    {
                        return Content("existe");
                    }


                    Usuario novo = new Usuario()
                    {
                        activo = true,
                        autenticado = true,
                        datacadastro = DateTime.Now,
                        id_usuario_tipo = model.id_usuario_tipo,
                        nome = model.nome,
                        senha = "123456789",
                        usuario1 = model.usuario1,
                    };
                    db.Usuarios.Add(novo);
                    db.SaveChanges();
                    return Content("true");
                };
            }
            catch (Exception)
            {

                return Content("false");
            }
        }

        //public ActionResult EditarUsuario(long id)
        //{
        //    using (var db = new mussika_bdEntities())
        //    {
        //        List<usuario_tipo> tiposUsuarios_ = db.usuario_tipo.ToList();
        //        ViewBag.tiposUsuarios = new SelectList(tiposUsuarios_, "id", "tipo");

        //        var usu = db.Usuarios.Where(u => u.idusario == id).SingleOrDefault();
        //        UsuarioViewModel model = new UsuarioViewModel()
        //        {
        //            idusario = usu.idusario,
        //            id_usuario_tipo = (int)usu.id_usuario_tipo,
        //            nome = usu.nome,
        //            usuario1 = usu.usuario1,
        //        };
        //        return View(model);
        //    };


        //}

        public ActionResult ProvedoresPendentes()
        {
            return View();
        }

        public List<UsuarioViewModel> ProvedoresPendentesList()
        {
            List<UsuarioViewModel> listaUsuarios = new List<UsuarioViewModel>();

            using (var db = new mussika_bdEntities())
            {
                var usuarios = db.Usuarios.Where(p => p.e_provedor == true && p.autenticado == false);


                foreach (var model in usuarios)
                {
                    UsuarioViewModel ProVM = new UsuarioViewModel()
                    {
                        idusario = model.idusario,
                        nome = model.nome.ToUpper(),
                        activo = (bool)model.activo,
                        autenticado = (bool)model.autenticado,
                        cod_autenticao = model.cod_autenticao,
                        datacadastro = (DateTime)model.datacadastro,
                        usuario1 = model.usuario1,
                        id_usuario_tipo = (int)(model.id_usuario_tipo ?? 0),
                        tipoUsuario = model.usuario_tipo != null ? model.usuario_tipo.tipo.ToUpper() : "",
                    };
                    listaUsuarios.Add(ProVM);
                }
            }
            return listaUsuarios;


        }

        [HttpPost]
        public ActionResult carregarProvedoresPendentesByAjax(int draw, int start, int length)
        {
            // Search Value  
            string search = Request.Form.GetValues("search[value]").FirstOrDefault();
            // Sort columns value  
            var sortColumn = Request.Form.GetValues("columns[" + Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault();
            var sortColumnDir = Request.Form.GetValues("order[0][dir]").FirstOrDefault();
            if (Request.IsAjaxRequest())
            {
                int pageSize = length != null ? Convert.ToInt32(length) : 0;
                int skip = start != null ? Convert.ToInt32(start) : 0;
                int recordsTotal = 0;
                int recordFilteredTotal = 0;
                // Get Employee Records.   
                var produtos = ProvedoresPendentesList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.usuario1.ToUpper().Contains(search.ToUpper()) || u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<UsuarioViewModel>;
                Func<UsuarioViewModel, string> orderingFunction = (c => sortColumn == "nome" ? c.nome.ToString() :
                                          sortColumn == "usuario1" ? c.usuario1.ToString() :
                                          sortColumn == "tipoUsuario" ? c.tipoUsuario.ToString() :
                                          sortColumn == "idusario" ? c.idusario.ToString()



                                          : c.nome);
                if (sortColumnDir == "asc")
                    filteredData = filteredData.OrderBy(orderingFunction);
                else
                    filteredData = filteredData.OrderByDescending(orderingFunction);
                // 4. Filtering  
                filteredData = filteredData.Skip(skip).Take(pageSize).ToList();
                // 5. Get the filtered record count  
                recordFilteredTotal = filteredData.Count();
                return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordFilteredTotal, data = filteredData }, JsonRequestBehavior.AllowGet);
            }
            return View();
        }

        public ActionResult VerificarServicos(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                try
                {
                    var servicos = db.usuario_provedor.Where(u => u.id_usuario == id).SingleOrDefault();
                    if (servicos != null)
                    {
                        ViewBag.acomodacao = servicos.acomodacao.ToString().ToLower() ?? "false";
                        ViewBag.musica = servicos.musica.ToString().ToLower() ?? "false";
                        ViewBag.bazar = servicos.bazar.ToString().ToLower() ?? "false";
                        ViewBag.loja = servicos.loja.ToString().ToLower() ?? "false";
                        ViewBag.taxi = servicos.taxi.ToString().ToLower() ?? "false";
                        ViewBag.restaurante = servicos.restaurante.ToString().ToLower() ?? "false";
                        ViewBag.arte_cultura = servicos.arte_cultura.ToString().ToLower() ?? "false";
                        ViewBag.evento = servicos.evento.ToString().ToLower() ?? "false";
                        ViewBag.turismo = servicos.turismo.ToString().ToLower() ?? "false";
                        ViewBag.farmacia = servicos.farmacia.ToString().ToLower() ?? "false";
                        ViewBag.clinica = servicos.clinica.ToString().ToLower() ?? "false";
                        ViewBag.transportadora = servicos.transportadora.ToString().ToLower() ?? "false";
                        ViewBag.pagamento_servico = servicos.pagamento_servico.ToString().ToLower() ?? "false";
                        ViewBag.referencia = servicos.referencia;
                        ViewBag.id_usuario = servicos.id_usuario;
                    }

                    return View();



                }
                catch (Exception ex)
                {

                    throw;
                }

            }
        }

        public ActionResult ActivarConta(ProvedorServicoViewModel model)
        {
            using (var db = new mussika_bdEntities())
            {
                usuario_provedor servicos = db.usuario_provedor.Where(u => u.id_usuario == model.usuario).SingleOrDefault();
                servicos.farmacia = model.farmacia;
                servicos.musica = model.musica;
                servicos.acomodacao = model.acomodacao;
                servicos.bazar = model.bazar;
                servicos.arte_cultura = model.arte_cultura;
                servicos.clinica = model.clinica;
                servicos.evento = model.evento;
                servicos.loja = model.loja;
                servicos.pagamento_servico = model.pagamento_servico;
                servicos.restaurante = model.restaurante;
                servicos.taxi = model.taxi;
                servicos.turismo = model.turismo;
                servicos.transportadora = model.transportadora;
                servicos.referencia = model.referencia;
                db.SaveChanges();

                var usuario = db.Usuarios.Where(u => u.idusario == model.usuario).SingleOrDefault();
                usuario.autenticado = true;
                usuario.activo = true;
                db.SaveChanges();
                string email = usuario.usuario1;
                enviarEmailActivacaoProvedor(email);
            }
            return Content("true");
        }

        public void enviarEmailActivacaoProvedor(string email)
        {
            MailMessage message = new MailMessage();
            SmtpClient smtp = new SmtpClient("wsrv1.mozdomains.com");
            message.From = new MailAddress("confirmacao@mussika.co.mz");
            message.To.Add(new MailAddress(email));
            message.Subject = "[MUSSIKA] – ACTIVAÇÃO DE CONTA PROVEDOR";
            message.IsBodyHtml = true; //to make message body as html  
            message.Body = "<p> Bem vindo a bordo Caro utilizador," +
                "A sua Conta de Provedor foi activada com sucesso.</p>" +
                   "visite: <a href='https://www.mussika.co.mz/'><i ></i> www.Mussika.co.mz</a>";
            //smtp.Port = 587;
            //smtp.Host = "smtp.gmail.com"; //for gmail host  
            smtp.EnableSsl = false;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("confirmacao@mussika.co.mz", "mussika123456789");
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Send(message);
        }

        public ActionResult mudarParaProvedor(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var usuario = db.Usuarios.Where(u => u.idusario == id).SingleOrDefault();
                usuario.e_provedor = true;
                usuario.id_usuario_tipo = 4;
                usuario.autenticado = true;
                usuario.activo = true;
                db.SaveChanges();

                usuario_provedor novo = new usuario_provedor()
                {
                    acomodacao = false,
                    arte_cultura = false,
                    bazar = false,
                    clinica = false,
                    evento = false,
                    farmacia = false,
                    id_usuario = usuario.idusario,
                    loja = false,
                    musica = false,
                    pagamento_servico = false,
                    restaurante = false,
                    taxi = false,
                    transportadora = false,
                    turismo = false,

                };
                db.usuario_provedor.Add(novo);
                db.SaveChanges();
                return Redirect("~/Usuario/VerificarServicos?id=" + id);
            };
        }
    }
}