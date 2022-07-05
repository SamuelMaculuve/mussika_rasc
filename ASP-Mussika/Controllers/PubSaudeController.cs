using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using ASP_Mussika.Models;
using PagedList;

namespace ASP_Mussika.Controllers
{
    public class PubSaudeController : Controller
    {
        // GET: PubSaude
        public ActionResult Index()
        {
            using (var db = new mussika_bdEntities())
            {
                ViewBag.hospitais = db.hospitals.Count();
                ViewBag.clinicas = db.clinicas.Count();
                ViewBag.farmacias = db.farmacias.Count();
            }
            return View();
        }

        public ActionResult Hospitais(int? page, string filtro = "")
        {

            List<hospital> hospitais = null;
            ViewBag.filtro = filtro;
            using (var db = new mussika_bdEntities())
            {
                if (string.IsNullOrEmpty(filtro))
                {
                    hospitais = db.hospitals.Where(h => h.inactivo == false).ToList();
                }
                else
                {
                    hospitais = db.hospitals.Where(h => h.inactivo == false && h.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                }
                int pageSize = 10;
                int pageNumber = (page ?? 1);
                return View(hospitais.ToPagedList(pageNumber, pageSize));

            }
        }

        public ActionResult Hospital(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var hospital = db.hospitals.Where(h => h.id == id).SingleOrDefault();
                    ViewBag.distrito = hospital.distrito.nome;
                    return View(hospital);
                }
            }
            catch (Exception)
            {

                return Redirect("Error/InternalServerError");
            }
        }
        public ActionResult marcaConsulta(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var hospital = db.clinicas.Where(h => h.id == id).SingleOrDefault();
                    ViewBag.distrito = hospital.distrito.nome;
                    ViewBag.centro = hospital.id;
                    return View(hospital);
                }
            }
            catch (Exception)
            {

                return Redirect("Error/InternalServerError");
            }
        }

        public ActionResult Clinicas(int? page, string filtro = "")
        {
            List<clinica> hospitais = null;
            ViewBag.filtro = filtro;
            using (var db = new mussika_bdEntities())
            {
                if (string.IsNullOrEmpty(filtro))
                {
                    hospitais = db.clinicas.Where(h => h.inactivo == false).ToList();
                }
                else
                {
                    hospitais = db.clinicas.Where(h => h.inactivo == false && h.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                }

                int pageSize = 10;
                int pageNumber = (page ?? 1);
                return View(hospitais.ToPagedList(pageNumber, pageSize));

            }
        }
        public ActionResult Clinica(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var hospital = db.clinicas.Where(h => h.id == id).SingleOrDefault();
                    ViewBag.distrito = hospital.distrito.nome;
                    return View(hospital);
                }
            }
            catch (Exception)
            {

                return Redirect("Error/InternalServerError");
            }
        }
        public ActionResult Farmacias(int? page, string filtro = "")
        {
            List<farmacia> farmacias = null;
            ViewBag.filtro = filtro;
            using (var db = new mussika_bdEntities())
            {
                if (string.IsNullOrEmpty(filtro))
                {
                    farmacias = db.farmacias.Where(h => h.inactivo == false).ToList();
                }
                else
                {
                    farmacias = db.farmacias.Where(h => h.inactivo == false && h.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                }

                int pageSize = 10;
                int pageNumber = (page ?? 1);
                return View(farmacias.ToPagedList(pageNumber, pageSize));

            }
        }
        public ActionResult Farmacia(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var hospital = db.farmacias.Where(h => h.id == id).SingleOrDefault();
                    ViewBag.distrito = hospital.distrito.nome;
                    return View(hospital);
                }
            }
            catch (Exception)
            {

                return Redirect("Error/InternalServerError");
            }
        }

        public ActionResult FarmaciasProdutos(long id, int? page, string filtro = "")
        {
            try
            {
                ViewBag.filtro = filtro;

                using (var db = new mussika_bdEntities())
                {

                    List<farmacia_produto> itens = null;
                    ViewBag.autor = db.farmacias.Where(p => p.id == id).SingleOrDefault();
                    ViewBag.id_autor = id;
                    if (!string.IsNullOrEmpty(filtro))
                    {

                        itens = db.farmacia_produto.Where(q => q.id_farmacia == id && q.inactivo == false && q.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();

                    }

                    else
                    {
                        itens = db.farmacia_produto.Where(q => q.id_farmacia == id && q.inactivo == false).ToList();
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
                var model = db.farmacia_produto.Where(l => l.id == id).SingleOrDefault();
                ViewBag.loja = model.farmacia.nome;
                ViewBag.distrito = model.farmacia.distrito.nome;
                ViewBag.bairro = model.farmacia.bairro;

                return View(model);
            }

        }

        public ActionResult salvarConsulta(consulta_view_model model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    long usuario = long.Parse(Session["idusario"].ToString());
                    saude_reserva nova = new saude_reserva()
                    {
                        clinica = model.clinica,
                        data_cadastro = DateTime.Now.ToString("dd-MM-yyyy"),
                        data_consulta = model.dia,
                        endereco_paciente = model.enedereco,
                        hora_consulta = model.hora,
                        hospital = model.hospital,
                        idade = model.idade,
                        id_centro_saude = model.centro,
                        nome_paciente = model.nome_paciente,
                        sintomas = model.sintomas,
                        confirmado = false,
                        id_usuario= usuario,

                    };
                    db.saude_reserva.Add(nova);
                    db.SaveChanges();

                    return Content("true");
                }
            }
            catch (Exception)
            {

                return Content("false");
            }
        }

        public ActionResult Consultas()
        {
            try
            {
                long id_provedor = long.Parse(Session["idusario"].ToString());
                using (var db = new mussika_bdEntities())
                {
                    List<clinica> clinicas = db.clinicas.Where(a => a.id_provedor == id_provedor).ToList();
                    List<saude_reserva> pendentes = new List<saude_reserva>();
                    List<saude_reserva> totais = new List<saude_reserva>();
                    foreach (var item in clinicas)
                    {
                        pendentes.AddRange(db.saude_reserva.Where(a => a.id_centro_saude == item.id && a.confirmado == false).ToList());
                        totais.AddRange(db.saude_reserva.Where(a => a.id_centro_saude == item.id).ToList());

                    }
                    ViewBag.pendentes = pendentes.Count();
                    ViewBag.total = totais.Count();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return View();
        }

        public List<consulta_view_model> ConsultaList()
        {
            List<consulta_view_model> listaUsuarios = new List<consulta_view_model>();

            using (var db = new mussika_bdEntities())
            {
                long id_provedor = long.Parse(Session["idusario"].ToString());
                var usuarios = db.saude_reserva.Where(a => a.confirmado == false);

                foreach (var model in usuarios)
                {
                    var quarto = db.clinicas.Where(a => a.id == model.id_centro_saude).SingleOrDefault();
                    if (quarto.id_provedor != id_provedor)
                    {
                        continue;
                    }
                    consulta_view_model ProVM = new consulta_view_model()
                    {
                        idade = model.idade ?? 0,
                        nome_paciente = model.nome_paciente,
                        dia = model.data_consulta,
                        hora = model.hora_consulta,
                        id = model.id,


                    };
                    listaUsuarios.Add(ProVM);
                }
            }
            return listaUsuarios;


        }

        [HttpPost]
        public ActionResult carregarTabelaConsultasByAjax(int draw, int start, int length)
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
                var produtos = ConsultaList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.nome_paciente.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<consulta_view_model>;
                Func<consulta_view_model, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome" ? c.nome_paciente :
                                          sortColumn == "dia" ? c.nome_paciente :
                                          sortColumn == "hora" ? c.hora



                                          : c.nome_paciente);
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

        public ActionResult processarConsulta(long id_consulta)
        {
            using(var db=new mussika_bdEntities())
            {
                var consulta = db.saude_reserva.Where(a => a.id == id_consulta).SingleOrDefault();
                var clinica = db.clinicas.Where(a => a.id == consulta.id_centro_saude).SingleOrDefault();
                ViewBag.clinica = clinica;
                return View(consulta);
            }
           
        }

        public ActionResult confirmarConsulta(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var consulta = db.saude_reserva.Where(a => a.id == id).SingleOrDefault();
                consulta.confirmado = true;
                db.SaveChanges();
                notificarConsultaCliente(consulta);
                return Redirect("/PubSaude/Consultas");
            }
        }

        private void notificarConsultaCliente(saude_reserva consulta)
        {
            try
            {
                string nome = "";
                using (var db = new mussika_bdEntities())
                {
                    var clinica = db.clinicas.Where(u => u.id == consulta.id_centro_saude).SingleOrDefault();
                 
                    MailMessage message = new MailMessage();
                    SmtpClient smtp = new SmtpClient("wsrv1.mozdomains.com");
                    message.From = new MailAddress("confirmacao@mussika.co.mz");
                    message.To.Add(new MailAddress(consulta.Usuario.usuario1));
                    message.Subject = "[MUSSIKA] – CONSULTA";
                    message.IsBodyHtml = true; //to make message body as html  
                    message.Body = "<p>Informamos que foi efectuada um agendamento de consulta,</p> <p>abaixo encontre os detalhes da operação:.</p>" +
                        "<p>nome da centro medico: " + clinica.nome + "</p>" +
                        "<p>Reservada por: " + consulta.Usuario.nome + "</p>" +                        
                        "<p>Data: " + consulta.data_cadastro + "</p>" +

                    "<p>Obrigado!</p>";


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


            }
        }
    }
}