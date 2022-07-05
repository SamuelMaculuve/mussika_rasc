using ASP_Mussika.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using Facebook;
using Newtonsoft.Json;
using System.Web.Security;
using System.Globalization;




namespace ASP_Mussika.Controllers
{
    public class LoginController : Controller
    {
        string actionName = "";
        string controllerName = "";

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            ActionDescriptor actionDescriptor = filterContext.ActionDescriptor;
            actionName = actionDescriptor.ActionName;
            controllerName = actionDescriptor.ControllerDescriptor.ControllerName;
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
        public ActionResult CriarUsuario(UsuarioViewModel model)
        {
            UsuarioViewModel modelo = new UsuarioViewModel();
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var usu = db.Usuarios.Where(U => U.usuario1.Trim().ToLower() == model.usuario1.Trim().ToLower()).SingleOrDefault();
                    if (usu != null)
                    {
                        return Content("existe");
                    }
                    else
                    {

                        if (!IsEmail(model.usuario1))
                        {
                            return Content("emailincorrecto");
                        }
                        string senhaCriptada = criptografia.Encrypt(model.senha, Constants.secretPass);
                        Usuario novo = new Usuario()
                        {
                            activo = false,
                            autenticado = false,
                            telefone = model.telefone,
                            datacadastro = DateTime.Now,
                            nome = model.nome,
                            senha = senhaCriptada,
                            usuario1 = model.usuario1,
                            id_usuario_tipo = model.provedor == true ? 4 : 1,
                            e_provedor = model.provedor,


                        };
                        db.Usuarios.Add(novo);
                        db.SaveChanges();

                        Random generator = new Random();
                        int r = generator.Next(1, 1000000);
                        string codigo_aut = r.ToString().PadLeft(6, '0');

                        if (novo.e_provedor != true)
                        {
                            if (novo.telefone != null)
                            {
                                EnviarSms.enviarsms(codigo_aut, novo.telefone);
                            }
                            bool enviouEmail = enviarEmailConfirmarCriacao(model, codigo_aut);
                            if (enviouEmail == true)
                            {
                                novo.cod_autenticao = codigo_aut;
                                db.SaveChanges();

                                modelo.usuario1 = novo.usuario1;
                                modelo.idusario = novo.idusario;
                                modelo.nome = novo.nome;
                                modelo.cod_autenticao = novo.cod_autenticao;
                                return Json(modelo, JsonRequestBehavior.AllowGet);
                            }
                        }
                        else
                        {
                            novo.cod_autenticao = codigo_aut;
                            db.SaveChanges();
                            modelo.usuario1 = novo.usuario1;
                            modelo.idusario = novo.idusario;
                            modelo.nome = novo.nome;
                            modelo.provedor = true;
                            modelo.cod_autenticao = novo.cod_autenticao;

                            usuario_provedor prove = new usuario_provedor()
                            {
                                acomodacao = false,
                                arte_cultura = false,
                                bazar = false,
                                clinica = false,
                                evento = false,
                                farmacia = false,
                                musica = false,
                                loja = false,
                                pagamento_servico = false,
                                restaurante = false,
                                taxi = false,
                                turismo = false,
                                transportadora=false,
                                id_usuario = novo.idusario,
                                referencia = "",

                            };
                            db.usuario_provedor.Add(prove);
                            db.SaveChanges();
                            

                            return Json(modelo, JsonRequestBehavior.AllowGet);
                        }



                    }
                }
            }
            catch (Exception)
            {

                return Content("false");
            }
            return View();
        }

        public ActionResult provedor(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var usu = db.Usuarios.Where(u => u.idusario == id).SingleOrDefault();
                ViewBag.id = usu.idusario;
                return View();
            }
        }

        public ActionResult SalvarServicosProvedor(ProvedorServicoViewModel model)
        {
            using(var db=new mussika_bdEntities())
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

                return Content("true");
            }
        }
        public ActionResult provedorCriado()
        {
            return View();
        }
        public bool enviarEmailConfirmarCriacao(UsuarioViewModel model, string codigo_aut = "123456")
        {
            try
            {


                MailMessage message = new MailMessage();
                SmtpClient smtp = new SmtpClient("wsrv1.mozdomains.com");
                message.From = new MailAddress("confirmacao@mussika.co.mz");
                message.To.Add(new MailAddress(model.usuario1));
                message.Subject = "[MUSSIKA] – MENSAGEM DE CONFIRMAÇÃO DE ABERTURA DE CONTA ---- 2020";
                message.IsBodyHtml = true; //to make message body as html  
                message.Body = "<p> Bem vindo a bordo Caro utilizador,</p> <p>Você se registrou com êxito em uma conta do Mussika. Encontre as informações da sua conta abaixo.</p>" +
                    "<p>Nome Completo: " + model.nome + "</p>" +
                    "<p><p>Usuario: " + model.usuario1 + "</p>" +
                    "Você precisa confirmar seu endereço de e-mail para poder continuar." +
                    "<p> Copie o código abaixo e cole no campo CODIGO apresentado na aplicação. </p>" +
                       "<h2>" + codigo_aut + "</h2>";
                //smtp.Port = 587;
                //smtp.Host = "smtp.gmail.com"; //for gmail host  
                smtp.EnableSsl = false;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("confirmacao@mussika.co.mz", "mussika123456789");
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(message);
            }
            catch (Exception ex)
            {

                return false;
            }
            return true;
        }

        public ActionResult ConfirmarEmailCriacao(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var usu = db.Usuarios.Where(u => u.idusario == id).SingleOrDefault();
                    UsuarioViewModel model = new UsuarioViewModel()
                    {
                        idusario = usu.idusario,
                        telefone = usu.telefone,
                        cod_autenticao = usu.cod_autenticao,
                        activo = (bool)usu.activo,
                        autenticado = (bool)usu.autenticado,
                        nome = usu.nome,
                        usuario1 = usu.usuario1,
                    };
                    return View(model);
                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }

        }

        public ActionResult autenticarCriacao(long id)
        {
            UsuarioViewModel usuVm = new UsuarioViewModel();
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var usu = db.Usuarios.Where(U => U.idusario == id).SingleOrDefault();

                    UsuarioAutenticacao novaAuntenticacao = new UsuarioAutenticacao()
                    {
                        codigo = usu.cod_autenticao,
                        data = DateTime.Now,
                        idUsuario = usu.idusario,
                        viaemail = true,
                        resultado = "Autenticado",

                    };
                    db.UsuarioAutenticacaos.Add(novaAuntenticacao);
                    db.SaveChanges();

                    usu.activo = true;
                    usu.autenticado = true;
                    db.SaveChanges();

                    usuVm.activo = true;
                    usuVm.autenticado = true;
                    usuVm.cod_autenticao = usu.cod_autenticao;
                    usuVm.datacadastro = (DateTime)usu.datacadastro;
                    usuVm.idusario = usu.idusario;
                    usuVm.nome = usu.nome;
                    usuVm.senha = usu.senha;
                    usuVm.usuario1 = usu.usuario1;



                    Session["idusario"] = usu.idusario;
                    Session["usuario"] = usu.usuario1;
                    Session["nome"] = usu.nome;
                    Session["tipo"] = usu.id_usuario_tipo;
                    Session["imagem"] = "../Repository/images/perfil.png";

                };
                return Redirect("/inicio/principal");
            }
            catch (Exception ex)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }

        public ActionResult Sair()
        {
            Session.Abandon();

            return Redirect("/inicio/principal");
        }

        public ActionResult Entrar(UsuarioViewModel model)
        {
            UsuarioViewModel usuVm = new UsuarioViewModel();
            try
            {

                using (var db = new mussika_bdEntities())
                {
                    ////verificacao de conta admin padrao///
                    var admin = db.Usuarios.Where(u => u.usuario1 == "admin@mussika.co.mz").SingleOrDefault();
                    if (admin == null)
                    {
                        string password = criptografia.Encrypt(Constants.usuarioDefaultPass, Constants.secretPass);
                        Usuario novo = new Usuario()
                        {
                            activo = true,
                            autenticado = true,
                            datacadastro = DateTime.Now,
                            id_usuario_tipo = 3,
                            nome = "Aministrador",
                            senha = password,
                            usuario1 = Constants.usuarioAdminDefault,
                        };
                        db.Usuarios.Add(novo);
                        db.SaveChanges();
                    }


                    var usu = db.Usuarios.Where(U => U.usuario1.Trim().ToLower() == model.usuario1.Trim().ToLower()).SingleOrDefault();
                    if (usu == null)
                    {
                        return Content("naoexiste");
                    }
                    if (usu.autenticado != true && usu.e_provedor == true)
                    {
                        return Content("provedornaoautenticado");
                    }
                    else
                    if (usu.senha == "123456789")
                    {
                        return Content("senhapadrao");
                    }
                    
                    if (usu.autenticado != false)
                    {
                        string senhaDecriptdadaBD = criptografia.Decrypt(usu.senha, Constants.secretPass);
                        //string senhaDecriptdadaModel = criptografia.Decrypt(model.senha, Constants.secretPass);
                        if (senhaDecriptdadaBD == model.senha)
                        {


                            //usuVm.activo = true;
                            //usuVm.autenticado = true;
                            //usuVm.cod_autenticao = usu.cod_autenticao;
                            //usuVm.datacadastro = (DateTime)usu.datacadastro;
                            //usuVm.idusario = usu.idusario;
                            //usuVm.nomeCompleto = usu.nome;
                            ////usu.senha = usu.senha;
                            //usuVm.usuario = usu.usuario1;
                            Session["idusario"] = usu.idusario;
                            Session["usuario"] = usu.usuario1;
                            Session["nome"] = usu.nome;
                            Session["tipo"] = usu.id_usuario_tipo;
                            
                            if (string.IsNullOrEmpty(usu.foto_capa) || string.IsNullOrWhiteSpace(usu.foto_capa))
                            {
                                Session["imagem"] = "../Repository/images/perfil.png";
                            }
                            else
                            {
                                Session["imagem"] = "../Repository/images/usuario/" + usu.foto_capa;
                            }

                            return Content(Request.UrlReferrer.ToString());
                        }
                        else
                        {
                            return Content("senhainvalida");
                        }

                    }
                    else
                    {
                        return Content("naoautorizado");
                    }
                }
            }
            catch (Exception ex)
            {

                return Content("false");
            }
        }

        public ActionResult confirmarContaInactiva(string usuario)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var usu = db.Usuarios.Where(u => u.usuario1.Trim().ToLower() == usuario.Trim().ToLower()).SingleOrDefault();
                    if (usu != null)
                    {
                        UsuarioViewModel model = new UsuarioViewModel()
                        {
                            idusario = usu.idusario,
                            cod_autenticao = usu.cod_autenticao,
                            activo = (bool)usu.activo,
                            telefone = usu.telefone,
                            autenticado = (bool)usu.autenticado,
                            nome = usu.nome,
                            usuario1 = usu.usuario1,
                        };
                        return View(model);
                    }
                    else
                    {
                        return Redirect("/inicio/InternalServerError");
                    }

                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }

        }

        public ActionResult EnviarEmailActivacao(long id)
        {
            try
            {
                Random generator = new Random();
                int r = generator.Next(1, 1000000);
                string codigo_aut = r.ToString().PadLeft(6, '0');

                Usuario usu = null;
                using (var db = new mussika_bdEntities())
                {
                    usu = db.Usuarios.Where(u => u.idusario == id).SingleOrDefault();

                    MailMessage message = new MailMessage();
                    SmtpClient smtp = new SmtpClient("wsrv1.mozdomains.com");
                    message.From = new MailAddress("confirmacao@mussika.co.mz");
                    message.To.Add(new MailAddress(usu.usuario1));
                    message.Subject = "[MUSSIKA] – MENSAGEM DE CONFIRMAÇÃO DE ABERTURA DE CONTA";
                    message.IsBodyHtml = true; //to make message body as html  
                    message.Body = "<p> Bem vindo a bordo Caro utilizador,</p> <p>Você se registrou com êxito em uma conta do Mussika. Encontre as informações da sua conta abaixo.</p>" +
                        "<p>Nome Completo: " + usu.nome + "</p>" +
                        "<p><p>Usuario: " + usu.usuario1 + "</p>" +
                        "Você precisa confirmar seu endereço de e-mail para poder continuar." +
                        "<p> Copie o código abaixo e cole no campo CODIGO apresentado na aplicação. </p>" +
                           "<h2>" + codigo_aut + "</h2>";
                    //smtp.Port = 587;
                    //smtp.Host = "smtp.gmail.com"; //for gmail host  
                    smtp.EnableSsl = false;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential("confirmacao@mussika.co.mz", "mussika123456789");
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.Send(message);

                    usu.cod_autenticao = codigo_aut;
                    db.SaveChanges();

                    if (usu.telefone != null)
                    {
                        EnviarSms.enviarsms(codigo_aut, usu.telefone);
                    }

                    return Content(codigo_aut);
                }
            }
            catch (Exception ex)
            {

                return Content("false");
            }
        }

        public ActionResult EsqueceuSenha()
        {
            return View();
        }

        public ActionResult EnviarEmailRecuperacao(string email)
        {
            try
            {
                if (!IsEmail(email))
                {
                    return Content("emailinvalido");
                }
                Random generator = new Random();
                int r = generator.Next(1, 1000000);
                string codigo_aut = r.ToString().PadLeft(6, '0');

                using (var db = new mussika_bdEntities())
                {
                    var usu = db.Usuarios.Where(u => u.usuario1.Trim().ToLower() == email.Trim().ToLower()).SingleOrDefault();
                    if (usu == null)
                    {
                        return Content("emailinvalido");
                    }
                    else
                    {
                        if (usu.telefone != null)
                        {
                            EnviarSms.enviarsms(codigo_aut, usu.telefone);
                        }
                    }

                }

                if (guardarCodigo(email, codigo_aut))
                {
                    MailMessage message = new MailMessage();
                    SmtpClient smtp = new SmtpClient("wsrv1.mozdomains.com");
                    message.From = new MailAddress("confirmacao@mussika.co.mz");
                    message.To.Add(new MailAddress(email));
                    message.Subject = "[MUSSIKA] – MENSAGEM DE CONFIRMAÇÃO ALTERAÇÃO DE SENHA";
                    message.IsBodyHtml = true; //to make message body as html  
                    message.Body = "<p> Bem vindo a bordo Caro utilizador," +
                        "Você precisa confirmar seu endereço de e-mail para poder continuar com a Alteração de senha." +
                        "<p> Copie o código abaixo e cole no campo CODIGO apresentado na aplicação. </p>" +
                           "<h2>" + codigo_aut + "</h2>";
                    //smtp.Port = 587;
                    //smtp.Host = "smtp.gmail.com"; //for gmail host  
                    smtp.EnableSsl = false;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential("confirmacao@mussika.co.mz", "mussika123456789");
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.Send(message);


                }


            }
            catch (Exception ex)
            {

                return Content("false");
            }
            return Content("true");
        }

        private bool guardarCodigo(string email, string codigo)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var usu = db.Usuarios.Where(u => u.usuario1.Trim().ToLower() == email.Trim().ToLower()).SingleOrDefault();
                    if (usu != null)
                    {
                        usu.cod_autenticao = codigo;
                        usu.autenticado = false;
                        db.SaveChanges();
                        return true;
                    }
                }

            }
            catch (Exception)
            {

                return false;
            }
            return false;
        }

        public ActionResult confirmarEmailAlteracaoSenha(string email)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var usu = db.Usuarios.Where(u => u.usuario1.Trim().ToLower() == email.Trim().ToLower()).SingleOrDefault();
                    UsuarioViewModel model = new UsuarioViewModel()
                    {
                        idusario = usu.idusario,
                        cod_autenticao = usu.cod_autenticao,
                        telefone = usu.telefone,
                        activo = (bool)usu.activo,
                        autenticado = (bool)usu.autenticado,
                        nome = usu.nome,
                        usuario1 = usu.usuario1,
                    };
                    return View(model);
                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }

        public ActionResult AlterarSenha(long id)
        {
            UsuarioViewModel model = new UsuarioViewModel();
            model.idusario = id;
            return View(model);
        }

        public ActionResult AlterarSenhaBd(UsuarioViewModel model)
        {

            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var usu = db.Usuarios.Where(U => U.idusario == model.idusario).SingleOrDefault();
                    if (usu == null)
                    {
                        return Content("usuarionaoexiste");
                    }
                    string senhaEncriptada = criptografia.Encrypt(model.senha, Constants.secretPass);

                    usu.senha = senhaEncriptada;
                    usu.activo = true;
                    usu.autenticado = true;
                    db.SaveChanges();



                    UsuarioAutenticacao novaAuntenticacao = new UsuarioAutenticacao()
                    {
                        codigo = usu.cod_autenticao,
                        data = DateTime.Now,
                        idUsuario = usu.idusario,
                        viaemail = true,
                        resultado = "Autenticado",

                    };
                    db.UsuarioAutenticacaos.Add(novaAuntenticacao);
                    db.SaveChanges();

                    UsuarioViewModel mvm = new UsuarioViewModel();

                    mvm.autenticado = true;
                    mvm.activo = true;
                    mvm.idusario = usu.idusario;
                    mvm.nome = usu.nome;
                    mvm.usuario1 = usu.usuario1;
                    mvm.senha = model.senha;
                    return Json(mvm, JsonRequestBehavior.AllowGet);
                };

            }
            catch (Exception ex)
            {

                return Content("false");
            }

        }
        public ActionResult EntrarAposAlteracao(UsuarioViewModel model)
        {
            UsuarioViewModel usuVm = new UsuarioViewModel();
            try
            {

                using (var db = new mussika_bdEntities())
                {
                    var usu = db.Usuarios.Where(U => U.usuario1.Trim().ToLower() == model.usuario1.Trim().ToLower()).SingleOrDefault();
                    if (usu == null)
                    {
                        return Redirect("/inicio/InternalServerError");
                    }
                    else

                        if (usu.autenticado != false)
                    {
                        string senhaDecriptdadaBD = criptografia.Decrypt(usu.senha, Constants.secretPass);
                        //string senhaDecriptdadaModel = criptografia.Decrypt(model.senha, Constants.secretPass);
                        if (senhaDecriptdadaBD == model.senha)
                        {



                            Session["idusario"] = usu.idusario;
                            Session["usuario"] = usu.usuario1;
                            Session["nome"] = usu.nome;
                            Session["tipo"] = usu.id_usuario_tipo;

                            if (string.IsNullOrEmpty(usu.foto_capa) || string.IsNullOrWhiteSpace(usu.foto_capa))
                            {
                                Session["imagem"] = "../Repository/images/perfil.png";
                            }
                            else
                            {
                                Session["imagem"] = "../Repository/images/usuario/" + usu.foto_capa;
                            }

                            return Redirect("/inicio/principal");
                        }
                        else
                        {
                            return Redirect("/inicio/InternalServerError");
                        }

                    }
                    else
                    {
                        return Redirect("/inicio/InternalServerError");
                    }
                }
            }
            catch (Exception ex)
            {

                return Content("false");
            }
        }

        public ActionResult RedifinirSenha(string usuario)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var usu = db.Usuarios.Where(u => u.usuario1.Trim().ToLower() == usuario.Trim().ToLower()).SingleOrDefault();
                    if (usu == null)
                    {
                        return Redirect("/inicio/InternalServerError");
                    }
                    else
                    {

                        UsuarioViewModel model = new UsuarioViewModel
                        {
                            activo = true,
                            autenticado = true,
                            datacadastro = DateTime.Now,
                            id_usuario_tipo = (usu.id_usuario_tipo ?? 1),
                            nome = usu.nome,
                            usuario1 = usu.usuario1,
                            idusario = usu.idusario,

                        };
                        return View(model);
                    }
                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }

        public ActionResult actualizarSenha(UsuarioViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var usuario = db.Usuarios.Where(u => u.idusario == model.idusario).SingleOrDefault();
                    if (usuario.senha != "123456789")
                    {
                        string senhaDecriptada = criptografia.Decrypt(usuario.senha, Constants.secretPass);
                        if (senhaDecriptada != model.senhaActual)
                        {
                            return Content("senhaactualinvalida");
                        }

                    }
                    string senhaEncriptada = criptografia.Encrypt(model.senha, Constants.secretPass);
                    usuario.senha = senhaEncriptada;
                    db.SaveChanges();

                    UsuarioAutenticacao novaAuntenticacao = new UsuarioAutenticacao()
                    {
                        codigo = usuario.cod_autenticao,
                        data = DateTime.Now,
                        idUsuario = usuario.idusario,
                        viaemail = true,
                        resultado = "Autenticado",

                    };
                    db.UsuarioAutenticacaos.Add(novaAuntenticacao);
                    db.SaveChanges();

                    UsuarioViewModel mvm = new UsuarioViewModel();

                    mvm.autenticado = true;
                    mvm.activo = true;
                    mvm.idusario = usuario.idusario;
                    mvm.nome = usuario.nome;
                    mvm.usuario1 = usuario.usuario1;
                    mvm.senha = model.senha;
                    return Json(mvm, JsonRequestBehavior.AllowGet);

                }
            }
            catch (Exception)
            {

                return Content("false");
            }
        }

        public ActionResult GoogleLogin(GmailUserViewModel model)
        {
            /*  
             *  
             *  
             *    try
              {

                  using (var db = new mussika_bdEntities())
                  {
                      string email = model.id + "@mussika.co.mz";
                      var usuario = db.Usuarios.Where(u => u.usuario1.Trim().ToLower() == email.Trim().ToLower()).SingleOrDefault();
                      if (usuario == null)
                      {
                          string senhaEncriptada = criptografia.Encrypt(Constants.usuarioDefaultPass, Constants.secretPass);
                          Usuario novo = new Usuario()
                          {
                              activo = true,
                              autenticado = true,
                              datacadastro = DateTime.Now,
                              id_usuario_tipo = 1,
                              nome = model.name,
                              senha = senhaEncriptada,
                              usuario1 = email,
                          };
                          db.Usuarios.Add(novo);
                          db.SaveChanges();



                          Session["idusario"] = novo.idusario;
                          Session["usuario"] = novo.usuario1;
                          Session["nome"] = novo.nome;
                          Session["tipo"] = novo.id_usuario_tipo;
                          Session["imagem"] = model.picture;
                          Session["is_google"] = true;

                      }
                      else
                      {
                          Session["idusario"] = usuario.idusario;
                          Session["usuario"] = usuario.usuario1;
                          Session["nome"] = usuario.nome;
                          Session["tipo"] = usuario.id_usuario_tipo;
                          Session["imagem"] = model.picture;
                          Session["is_google"] = true;
                      }
                  }
              }
              catch (Exception)
              {

                  return Content("false");
              }
             *  */

            return Content(Request.UrlReferrer.ToString());
        }

        private Uri RediredtUri
        {
            get
            {
                var uriBuilder = new UriBuilder(Request.Url);
                uriBuilder.Query = null;
                uriBuilder.Fragment = null;
                uriBuilder.Path = Url.Action("FacebookCallback");
                return uriBuilder.Uri;
            }
        }
        [AllowAnonymous]

        public ActionResult Facebook()
        {
            var fb = new FacebookClient();
            var loginUrl = fb.GetLoginUrl(new
            {
                // client_id = "1385992288243020",
                // client_secret = "6e540ab98141346e957c5f1b7cbb54a9",
                client_id = "575152900636120",
                client_secret = "7571e9de2c4fba544a17ea95c7cac94a",
                redirect_uri = RediredtUri.AbsoluteUri,
                response_type = "code",
                scope = "email"
            });

            return Redirect(loginUrl.AbsoluteUri);

        }
        public ActionResult FacebookCallback(string code)
        {
            var fb = new FacebookClient();
            dynamic result = fb.Post("oauth/access_token", new
            {
                // client_id = "1385992288243020",
                // client_secret = "6e540ab98141346e957c5f1b7cbb54a9",
                client_id = "575152900636120",
                client_secret = "7571e9de2c4fba544a17ea95c7cac94a",
                redirect_uri = RediredtUri.AbsoluteUri,
                code = code
            });
            var accessToken = result.access_token;
            Session["AccessToken"] = accessToken;
            fb.AccessToken = accessToken;
            dynamic me = fb.Get("me?fields=link,first_name,currency,last_name,email,gender,locale,timezone,verified,picture,age_range");
            string email = me.email;
            TempData["email"] = me.email;
            TempData["id"] = me.id;
            TempData["first_name"] = me.first_name;
            TempData["lastname"] = me.last_name;
            TempData["picture"] = me.picture.data.url;
            FormsAuthentication.SetAuthCookie(email, false);
            return Redirect("/Login/LoginWithFacebook/");

        }

        public ActionResult LoginWithFacebook()
        {
            try
            {

                using (var db = new mussika_bdEntities())
                {
                    string idFb = TempData.ContainsKey("id") ? TempData["id"].ToString() : "";
                    string fullName = TempData["first_name"].ToString() + " " + TempData["lastname"];
                    string email = idFb + "@mussika.co.mz";
                    var usuario = db.Usuarios.Where(u => u.usuario1.Trim().ToLower() == email.Trim().ToLower()).SingleOrDefault();
                    if (usuario == null)
                    {
                        string senhaEncriptada = criptografia.Encrypt(Constants.usuarioDefaultPass, Constants.secretPass);
                        Usuario novo = new Usuario()
                        {
                            activo = true,
                            autenticado = true,
                            datacadastro = DateTime.Now,
                            id_usuario_tipo = 1,
                            nome = fullName,
                            senha = senhaEncriptada,
                            usuario1 = email,
                        };
                        db.Usuarios.Add(novo);
                        db.SaveChanges();



                        Session["idusario"] = novo.idusario;
                        Session["usuario"] = novo.usuario1;
                        Session["nome"] = novo.nome;
                        Session["tipo"] = novo.id_usuario_tipo;
                        Session["imagem"] = TempData["picture"].ToString() ?? Constants.defaultUserImage;

                    }
                    else
                    {
                        Session["idusario"] = usuario.idusario;
                        Session["usuario"] = usuario.usuario1;
                        Session["nome"] = usuario.nome;
                        Session["tipo"] = usuario.id_usuario_tipo;
                        Session["imagem"] = TempData["picture"].ToString() ?? Constants.defaultUserImage;
                    }
                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
            return Redirect(Request.UrlReferrer.ToString());
        }

        public ActionResult ProvedorInactivo()
        {
            return View();
        }
    }
}

