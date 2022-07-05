using ASP_Mussika.Models;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class PubReservaController : Controller
    {
        // GET: PubReserva
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Acomodacao(reserva_acomodacaoViewModel sumario)
        {
            AcomodacaoViewModel model1 = null;
            try
            {
                string[] datas = sumario.datas.Split('-');
                DateTime ex = DateTime.Now;
                //DateTime data_chegada = DateTime.Parse(datas[0]);
                DateTime data_chegada = DateTime.Now;
                //DateTime data_Saida = DateTime.Parse(datas[1]);
                DateTime data_Saida = DateTime.Now.AddDays(4);
                sumario.data_chegada = datas[0];
                sumario.data_saida = datas[1];


                using (var db = new mussika_bdEntities())
                {
                    var quarto = db.acomodacao_quarto.Where(q => q.id == sumario.id_quarto).SingleOrDefault();
                    ViewBag.quarto = quarto;
                    sumario.custo_total = (decimal)quarto.custo_diaria;

                    ViewBag.sumario = sumario;
                    var model = db.acomodacaos.Where(r => r.id == sumario.id).SingleOrDefault();
                    model1 = new AcomodacaoViewModel()
                    {
                        descricao = model.descricao,
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
                        nomeAcomodacaoTipo=model.acomodacao_tipo.tipo,
                        nomeDistrito=model.distrito.nome,
                    };

                };
            }
            catch (Exception)
            {

                return Content("false");
            }
            return View(model1);
        }

        public ActionResult ProcessarReserva(long id_reserva)
        {
            AcomodacaoViewModel model1 = null;
            reserva_acomodacaoViewModel Reserva_model_view = new reserva_acomodacaoViewModel();
            try
            {
               
                using (var db = new mussika_bdEntities())
                {
                    acomodacao_reserva reserva = db.acomodacao_reserva.Where(a => a.id == id_reserva).SingleOrDefault();


                    Reserva_model_view.id = reserva.id;
                    Reserva_model_view.data_chegada = reserva.data_entrada;
                    Reserva_model_view.data_saida = reserva.data_saida;

                    var quarto = db.acomodacao_quarto.Where(q => q.id == reserva.id_acomodacao_quarto).SingleOrDefault();
                    ViewBag.quarto = quarto;
                    Reserva_model_view.custo_total = (decimal)quarto.custo_diaria;

                    ViewBag.sumario = Reserva_model_view;
                    var model = db.acomodacaos.Where(r => r.id == quarto.acomodacao.id).SingleOrDefault();
                    model1 = new AcomodacaoViewModel()
                    {
                        descricao = model.descricao,
                        email = model.email,
                        endereco = model.endereco,
                        foto_capa = model.foto_capa,
                        id_acomodacao_tipo = model.id_acomodacao_tipo??0,
                        id_distrito = model.id_distrito??0,
                        mapa = model.mapa,
                        nome = model.nome,
                        telefone = model.telefone,
                        website = model.website,
                        id = model.id,
                        nomeAcomodacaoTipo = model.acomodacao_tipo.tipo,
                        nomeDistrito = model.distrito.nome,
                    };

                };
            }
            catch (Exception)
            {

                return Content("false");
            }
            return View(model1);
        }

        public ActionResult confirmarReserva(long id)
        {
            try
            {
                using(var db=new mussika_bdEntities())
                {
                    var reserva = db.acomodacao_reserva.Where(a => a.id == id).SingleOrDefault();
                    reserva.confirmado = true;
                    db.SaveChanges();
                   
                }
                return Redirect("~/ProvedorAcomodacao/Reservas");
            }
            catch (Exception)
            {

                return View("InternalServerError");
            }
        }
        public int RandomNumber(int min, int max)
        {
            Random random = new Random();
            return random.Next(min, max);
        }

        public string RandomString(int size, bool lowerCase)
        {
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            char ch;
            for (int i = 0; i < size; i++)
            {
                ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }
            if (lowerCase)
                return builder.ToString().ToLower();
            return builder.ToString();
        }
        public string RandomStringNumber()
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(RandomString(2, false));
            builder.Append(RandomNumber(10, 99));
            builder.Append(RandomString(2, false));
            return builder.ToString();
        }

        public  ActionResult pagarViaMpesa(long id, string numero, decimal valor, string oque_e, string checkIn,string checkOut)
        {
            try
            {
                string numero_ = numero.Replace('(', ' ');
                numero_ = numero_.Replace(')', ' ');
                numero_ = numero_.Replace('-', ' ');
                numero_ = string.Concat(numero_.Where(c => !char.IsWhiteSpace(c)));

                string ThirdPartyrefereence = RandomStringNumber();
                string TransactionReference = RandomStringNumber();

                string dinheiro = verificar_preco(id, valor, oque_e);
                if (dinheiro == "") { return Redirect("/PubMusica/PagamentoFalhou?erro=Não foi possivel processar o pagamento!"); }

                WebClient client = new WebClient();
                string token = client.DownloadString("https://mpesa.mussika.co.mz/index.php");

                RestClient restClient = new RestClient("https://api.vm.co.mz:18352");
                RestRequest restRequest = new RestRequest("/ipg/v1x/c2bPayment/singleStage/", Method.POST);
                
                restRequest.AddHeader("Origin", "developer.mpesa.vm.co.mz");
                restRequest.AddHeader("Authorization", $"Bearer {token}");
                
                var data = new C2B_MODEL() { input_Amount = dinheiro, input_CustomerMSISDN = numero_, input_ServiceProviderCode = "900413", input_ThirdPartyReference = ThirdPartyrefereence, input_TransactionReference = TransactionReference };
                restRequest.AddHeader("Content-Type", "application/json");
                restRequest.AddJsonBody(data);

                var response =  restClient.Execute<MpesaResponse>(restRequest);
                if (response.IsSuccessful == true)
                {
                    MpesaResponse resposta = response.Data;
                    if (resposta.output_ResponseCode == "INS-0")
                    {
                        try
                        {
                            using (mussika_bdEntities db = new mussika_bdEntities())
                            {
                                long id_usuario = long.Parse(Session["idusario"].ToString());
                                if (oque_e == "musica")
                                {
                                    var existe = db.compras.Where(c => c.oque_e == "musica" && c.id_produto == id && c.id_usuario == id_usuario).SingleOrDefault();
                                    if (existe == null)
                                    {
                                        musica musica = db.musicas.Where(c => c.id == id).SingleOrDefault();
                                        compra nova = new compra()
                                        {
                                            confirmado = true,
                                            data_cadastro = DateTime.Now,
                                            descricao = "musica de " + musica.artista_obra.nome,
                                            id_produto = musica.id,
                                            id_usuario = id_usuario,
                                            inactivo = false,
                                            modo_pagamento = "mpesa",
                                            oque_e = oque_e,
                                            valor = musica.preco_venda,
                                        };
                                        db.compras.Add(nova);
                                        db.SaveChanges();
                                    }
                                }
                                else if (oque_e == "musicaAlbum")
                                {
                                    var existe = db.compras.Where(c => c.oque_e == "musicaAlbum" && c.id_produto == id && c.id_usuario == id_usuario).SingleOrDefault();
                                    if (existe == null)
                                    {
                                        musica_album musica = db.musica_album.Where(c => c.id == id).SingleOrDefault();
                                        var musicasDoAlbum = db.musicas.Where(m => m.id_album == musica.id).ToList();
                                        compra nova = new compra()
                                        {
                                            confirmado = true,
                                            data_cadastro = DateTime.Now,
                                            descricao = "Album de " + musica.artista_obra.nome,
                                            id_produto = musica.id,
                                            id_usuario = id_usuario,
                                            inactivo = false,
                                            modo_pagamento = "mpesa",
                                            oque_e = oque_e,
                                            valor = musica.preco,
                                        };
                                        db.compras.Add(nova);
                                        db.SaveChanges();

                                        foreach (var item in musicasDoAlbum)
                                        {
                                            compra nova_ = new compra()
                                            {
                                                confirmado = true,
                                                data_cadastro = DateTime.Now,
                                                descricao = "musica do Album " + musica.nome,
                                                id_produto = item.id,
                                                id_usuario = id_usuario,
                                                inactivo = false,
                                                modo_pagamento = "mpesa",
                                                oque_e = "musica",
                                                valor = item.preco_venda,
                                            };
                                            db.compras.Add(nova_);
                                            db.SaveChanges();
                                        }

                                    }
                                }
                                else if (oque_e == "musicaVideo")
                                {
                                    var existe = db.compras.Where(c => c.oque_e == "musicaVideo" && c.id_produto == id && c.id_usuario == id_usuario).SingleOrDefault();
                                    if (existe == null)
                                    {
                                        musica musica = db.musicas.Where(c => c.id == id).SingleOrDefault();
                                        compra nova = new compra()
                                        {
                                            confirmado = true,
                                            data_cadastro = DateTime.Now,
                                            descricao = "Video clipe da musica de " + musica.artista_obra.nome,
                                            id_produto = musica.id,
                                            id_usuario = id_usuario,
                                            inactivo = false,
                                            modo_pagamento = "mpesa",
                                            oque_e = oque_e,
                                            valor = musica.preco_video,
                                        };
                                        db.compras.Add(nova);
                                        db.SaveChanges();
                                    }
                                }
                                else if (oque_e == "restauranteMesa")
                                {

                                    restaurante restaurante_ = db.restaurantes.Where(c => c.id == id).SingleOrDefault();
                                    compra nova = new compra()
                                    {
                                        confirmado = true,
                                        data_cadastro = DateTime.Now,
                                        descricao = "Mesa do Restaurante da " + restaurante_.nome,
                                        id_produto = restaurante_.id,
                                        id_usuario = id_usuario,
                                        inactivo = false,
                                        modo_pagamento = "mpesa",
                                        oque_e = oque_e,
                                        valor = 100,
                                    };
                                    db.compras.Add(nova);
                                    db.SaveChanges();

                                }
                                else if (oque_e == "acomodacao")
                                {

                                    var quarto = db.acomodacao_quarto.Where(q => q.id == id).SingleOrDefault();
                                    compra nova = new compra()
                                    {
                                        confirmado = true,
                                        data_cadastro = DateTime.Now,
                                        descricao = "Reserva de Quarto " + quarto.descricao,
                                        id_produto = quarto.id,
                                        id_usuario = id_usuario,
                                        inactivo = false,
                                        modo_pagamento = "mpesa",
                                        oque_e = oque_e,
                                        valor = quarto.custo_diaria,
                                    };
                                    db.compras.Add(nova);
                                    db.SaveChanges();
                                   long id_reserva= CriarReserva(id_usuario, "mpesa", quarto, nova, checkIn,checkOut);
                                    notificarReserva(id_usuario,"mpesa",quarto,nova, id_reserva);
                                    notificarReservaCliente(id_usuario,"mpesa",quarto,nova, id_reserva);
                                }

                            };

                        }
                        catch (Exception ex)
                        {

                            return Redirect("/PubMusica/PagamentoFalhou?erro=" + ex.InnerException.Message);
                        }
                    
                            return Redirect("/Pagamento/PagamentoSucesso");
                       

                    }
                }
            }
            catch (Exception ex)
            {

                return Redirect("/PubMusica/PagamentoFalhou?erro=" + ex.InnerException.Message);
            }
            return Redirect("/PubMusica/PagamentoFalhou?erro=Não foi possivel processar o pagamento!");
        }

        private string verificar_preco(long id, decimal valor, string oque_e)
        {
            string valor_real = "";
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    switch (oque_e)
                    {
                        case "musica":
                            var musica = db.musicas.Where(m => m.id == id).SingleOrDefault();
                            valor_real = musica.preco_venda.ToString();
                            break;
                        case "musicaVideo":
                            var musicaVideo = db.musicas.Where(m => m.id == id).SingleOrDefault();
                            valor_real = musicaVideo.preco_video.ToString();
                            break;
                        case "musicaAlbum":
                            var musicaAlbum = db.musica_album.Where(m => m.id == id).SingleOrDefault();
                            valor_real = musicaAlbum.preco.ToString();
                            break;
                        case "acomodacao":
                            var acomodacao_quarto = db.acomodacao_quarto.Where(m => m.id == id).SingleOrDefault();
                            valor_real = acomodacao_quarto.custo_diaria.ToString();
                            break;
                        case "restaurantePrato":
                            var restaurantePrato = db.restaurante_prato.Where(m => m.id == id).SingleOrDefault();
                            valor_real = restaurantePrato.preco_venda.ToString();
                            break;
                        case "lojaProduto":
                            var lojaProduto = db.loja_produto.Where(m => m.id == id).SingleOrDefault();
                            valor_real = lojaProduto.preco_venda.ToString();
                            break;
                        case "produtoBazar":
                            var produtoBazar = db.artigoes.Where(m => m.id == id).SingleOrDefault();
                            valor_real = produtoBazar.preco_venda.ToString();
                            break;
                        case "evento":
                            var evento = db.eventoes.Where(m => m.id == id).SingleOrDefault();
                            if (valor == evento.preco_bilhete || valor == evento.preco_bilhete_vip) { valor_real = valor.ToString(); }
                            valor_real = evento.preco_bilhete.ToString();
                            break;
                        case "farmacia":
                            var farmacia = db.farmacia_produto.Where(m => m.id == id).SingleOrDefault();
                            valor_real = farmacia.preco_venda.ToString();
                            break;
                        case "clinica":
                            var clinica = db.clinicas.Where(m => m.id == id).SingleOrDefault();
                            valor_real = clinica.preco_consulta.ToString();
                            break;

                        default:
                            break;
                    }
                }
            }
            catch (Exception)
            {

                return "";
            }
            return valor_real;
        }

        private long CriarReserva(long id_usuario, string v, acomodacao_quarto quarto, compra nova,string checkIn,string checkOut)
        {
            long id_reserva = 0;
            try
            {
                using(var db=new mussika_bdEntities())
                {
                    var user = db.Usuarios.Where(u => u.idusario == id_usuario).SingleOrDefault();
                    acomodacao_reserva nova_reserva = new acomodacao_reserva()
                    {
                        nome_hospede = user.nome,
                        cancelado = false,
                        confirmado = false,
                        data_reserva = nova.data_cadastro,
                        email = user.usuario1,
                        id_acomodacao_quarto = quarto.id,
                        preco = (double)nova.valor,
                        data_entrada=checkIn,
                        data_saida=checkOut,
                    };
                   var reg= db.acomodacao_reserva.Add(nova_reserva);
                    db.SaveChanges();

                    id_reserva= reg.id;
                }
            }
            catch (Exception)
            {

                
            }
            return id_reserva;
        }

        private void notificarReservaCliente(long id_usuario, string v, acomodacao_quarto quarto, compra nova, long id_reserva)
        {
            try
            {
                string nome = "";
                using (var db = new mussika_bdEntities())
                {
                    var user = db.Usuarios.Where(u => u.idusario == id_usuario).SingleOrDefault();
                    nome = user.nome;

                    MailMessage message = new MailMessage();
                    SmtpClient smtp = new SmtpClient("wsrv1.mozdomains.com");
                    message.From = new MailAddress("confirmacao@mussika.co.mz");
                    message.To.Add(new MailAddress(user.usuario1));
                    message.Subject = "[MUSSIKA] – NOVA RESERVA";
                    message.IsBodyHtml = true; //to make message body as html  
                    message.Body = "<p>Informamos que foi efectuada uma reserva de uma acomodação,</p> <p>abaixo encontre os detalhes da operação:.</p>" +
                        "<p>nome da Acomodação: " + quarto.acomodacao.nome + "</p>" +
                        "<p>Reservada por: " + nome + "</p>" +
                        "<p>Reserva: " + quarto.descricao + "</p>" +
                        "<p>Codigo Reserva: " + id_reserva + "</p>" +
                        "<p>Data: " + nova.data_cadastro + "</p>" +

                        "Em Breve recebera a respectiva Factura!" +
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
        private void notificarReserva(long id_usuario, string v, acomodacao_quarto quarto, compra nova, long id_reserva)
        {
            try
            {
                string nome = "";
                using(var db = new mussika_bdEntities())
                {
                    var user = db.Usuarios.Where(u => u.idusario == id_usuario).SingleOrDefault();
                    nome = user.nome;
                }
                MailMessage message = new MailMessage();
                SmtpClient smtp = new SmtpClient("wsrv1.mozdomains.com");
                message.From = new MailAddress("confirmacao@mussika.co.mz");
                message.To.Add(new MailAddress("reserva@mussika.co.mz"));
                message.Subject = "[MUSSIKA] – NOVA RESERVA";
                message.IsBodyHtml = true; //to make message body as html  
                message.Body = "<p>Informamos que foi efectuada uma reserva de uma acomodação,</p> <p>abaixo encontre os detalhes da operação:.</p>" +
                    "<p>nome da Acomodação: " + quarto.acomodacao.nome + "</p>" +
                    "<p>Reservada por: " + nome + "</p>" +
                    "<p>Reserva: " + quarto.descricao + "</p>" +
                    "<p>Codigo Reserva: " + id_reserva + "</p>" +
                    "<p>Data: " + nova.data_cadastro + "</p>" +

                    "Podera monitorar esta reserva no painel=> Acomodação=> Reservas.";
                    
                    
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

                
            }
        }
    }
}