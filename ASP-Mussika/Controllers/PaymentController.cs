using ASP_Mussika.Models;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class PaymentController : Controller
    {
        // GET: Payment
        public ActionResult Compra(long id_produto, decimal valor, string oque_e, string checkIn = "", string checkOut = "", bool tem_entrega = false, int id_transportadora = 0, string local_entrega = "", string nome_destinatario = "", string contacto_destinatario = "")
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    long id_usuario = long.Parse(Session["idusario"].ToString());
                    
                    if (oque_e == "musica")
                    {
                        var existe = db.compras.Where(c => c.oque_e == "musica" && c.id_produto == id_produto && c.id_usuario == id_usuario).SingleOrDefault();
                        if (existe == null)
                        {
                            musica musica = db.musicas.Where(c => c.id == id_produto).SingleOrDefault();
                            compra nova = new compra()
                            {
                                confirmado = true,
                                data_cadastro = DateTime.Now,
                                descricao = "musica de " + musica.artista_obra.nome,
                                id_produto = musica.id,
                                id_usuario = id_usuario,
                                inactivo = false,
                                modo_pagamento = "mastercard",
                                oque_e = oque_e,
                                valor = musica.preco_venda,
                            };
                            db.compras.Add(nova);
                            db.SaveChanges();
                        }
                    }
                    else if (oque_e == "musicaAlbum")
                    {
                        var existe = db.compras.Where(c => c.oque_e == "musicaAlbum" && c.id_produto == id_produto && c.id_usuario == id_usuario).SingleOrDefault();
                        if (existe == null)
                        {
                            musica_album musica = db.musica_album.Where(c => c.id == id_produto).SingleOrDefault();
                            var musicasDoAlbum = db.musicas.Where(m => m.id_album == musica.id).ToList();
                            compra nova = new compra()
                            {
                                confirmado = true,
                                data_cadastro = DateTime.Now,
                                descricao = "Album de " + musica.artista_obra.nome,
                                id_produto = musica.id,
                                id_usuario = id_usuario,
                                inactivo = false,
                                modo_pagamento = "mastercard",
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
                        var existe = db.compras.Where(c => c.oque_e == "musicaVideo" && c.id_produto == id_produto && c.id_usuario == id_usuario).SingleOrDefault();
                        if (existe == null)
                        {
                            musica musica = db.musicas.Where(c => c.id == id_produto).SingleOrDefault();
                            compra nova = new compra()
                            {
                                confirmado = true,
                                data_cadastro = DateTime.Now,
                                descricao = "Video clipe",
                                id_produto = musica.id,
                                id_usuario = id_usuario,
                                inactivo = false,
                                modo_pagamento = "mastercard",
                                oque_e = oque_e,
                                valor = musica.preco_video,
                            };
                            db.compras.Add(nova);
                            db.SaveChanges();
                        }
                    }
                    else if (oque_e == "restauranteMesa")
                    {

                        restaurante restaurante_ = db.restaurantes.Where(c => c.id == id_produto).SingleOrDefault();
                        compra nova = new compra()
                        {
                            confirmado = true,
                            data_cadastro = DateTime.Now,
                            descricao = "Mesa do Restaurante da " + restaurante_.nome,
                            id_produto = restaurante_.id,
                            id_usuario = id_usuario,
                            inactivo = false,
                            modo_pagamento = "mastercard",
                            oque_e = oque_e,
                            valor = 100,
                        };
                        db.compras.Add(nova);
                        db.SaveChanges();

                    }
                    else if (oque_e == "acomodacao")
                    {

                        var quarto = db.acomodacao_quarto.Where(q => q.id == id_produto).SingleOrDefault();
                        compra nova = new compra()
                        {
                            confirmado = true,
                            data_cadastro = DateTime.Now,
                            descricao = "Reserva de Quarto " + quarto.descricao,
                            id_produto = quarto.id,
                            id_usuario = id_usuario,
                            inactivo = false,
                            modo_pagamento = "mastercard",
                            oque_e = oque_e,
                            valor = quarto.custo_diaria,
                        };
                        db.compras.Add(nova);
                        db.SaveChanges();

                        long id_reserva = CriarReserva(id_usuario, "mpesa", quarto, nova, checkIn, checkOut);
                        notificarReserva(id_usuario, "mpesa", quarto, nova, id_reserva);
                        notificarReservaCliente(id_usuario, "mpesa", quarto, nova, id_reserva);

                    }
                    else if (oque_e == "restaurantePrato")
                    {

                        restaurante_prato prato = db.restaurante_prato.Where(c => c.id == id_produto).SingleOrDefault();
                        
                        compra nova = new compra()
                        {
                            confirmado = true,
                            data_cadastro = DateTime.Now,
                            descricao = prato.nome + " do " + prato.restaurante.nome,
                            id_produto = prato.id,
                            id_usuario = id_usuario,
                            inactivo = false,
                            modo_pagamento = "mastercard",
                            oque_e = oque_e,
                            valor = prato.preco_venda,
                            tem_entrega = tem_entrega,
                            custo_transporte = tem_entrega == true ? valor - prato.preco_venda : 0,
                            id_transportadora = id_transportadora,
                            contacto_destinatario = contacto_destinatario,
                            local_entrega = local_entrega,
                            nome_destinatario = nome_destinatario
                        };
                        db.compras.Add(nova);
                        db.SaveChanges();

                    }
                    else if (oque_e == "lojaProduto")
                    {

                        var lojaProduto = db.loja_produto.Where(q => q.id == id_produto).SingleOrDefault();
                        compra nova = new compra()
                        {
                            confirmado = true,
                            data_cadastro = DateTime.Now,
                            descricao = lojaProduto.nome + " - loja: " + lojaProduto.loja.nome,
                            id_produto = lojaProduto.id,
                            id_usuario = id_usuario,
                            inactivo = false,
                            modo_pagamento = "mastercard",
                            oque_e = oque_e,
                            valor = lojaProduto.preco_venda,
                            tem_entrega = tem_entrega,
                            custo_transporte = tem_entrega == true ? valor - lojaProduto.preco_venda : 0,
                            id_transportadora = id_transportadora,
                            contacto_destinatario = contacto_destinatario,
                            local_entrega = local_entrega,
                            nome_destinatario = nome_destinatario
                        };
                        db.compras.Add(nova);
                        db.SaveChanges();

                    }
                    else if (oque_e == "produtoBazar")
                    {

                        var produtoBazar = db.artigoes.Where(q => q.id == id_produto).SingleOrDefault();
                        compra nova = new compra()
                        {
                            confirmado = true,
                            data_cadastro = DateTime.Now,
                            descricao = produtoBazar.nome,
                            id_produto = produtoBazar.id,
                            id_usuario = id_usuario,
                            inactivo = false,
                            modo_pagamento = "mastercard",
                            oque_e = oque_e,
                            valor = produtoBazar.preco_venda,
                            tem_entrega = tem_entrega,
                            custo_transporte = tem_entrega == true ? valor - produtoBazar.preco_venda : 0,
                            id_transportadora = id_transportadora,
                            contacto_destinatario = contacto_destinatario,
                            local_entrega = local_entrega,
                            nome_destinatario = nome_destinatario
                        };
                        db.compras.Add(nova);
                        db.SaveChanges();

                    }
                    else if (oque_e == "arteCultura")
                    {

                        var arteCultura = db.obra_arte.Where(q => q.id == id_produto).SingleOrDefault();

                        compra nova = new compra()
                        {
                            confirmado = true,
                            data_cadastro = DateTime.Now,
                            descricao = "Obra Arte - " + arteCultura.titulo,
                            id_produto = arteCultura.id,
                            id_usuario = id_usuario,
                            inactivo = false,
                            modo_pagamento = "mastercard",
                            oque_e = oque_e,
                            valor = arteCultura.preco_venda,
                            tem_entrega = tem_entrega,
                            custo_transporte = tem_entrega == true ? valor - arteCultura.preco_venda : 0,
                            id_transportadora = id_transportadora,
                            contacto_destinatario = contacto_destinatario,
                            local_entrega = local_entrega,
                            nome_destinatario = nome_destinatario
                        };
                        db.compras.Add(nova);
                        db.SaveChanges();

                    }
                    else if (oque_e == "evento")
                    {

                        var evento = db.eventoes.Where(q => q.id == id_produto).SingleOrDefault();

                        compra nova = new compra()
                        {
                            confirmado = true,
                            data_cadastro = DateTime.Now,
                            descricao = "Evento - " + evento.nome,
                            id_produto = evento.id,
                            id_usuario = id_usuario,
                            inactivo = false,
                            modo_pagamento = "mastercard",
                            oque_e = oque_e,
                          
                        };
                        if (nova.valor == evento.preco_bilhete)
                        {
                            nova.valor = evento.preco_bilhete;
                        }
                        else
                        {
                            nova.valor = evento.preco_bilhete_vip;
                        }
                        db.compras.Add(nova);
                        db.SaveChanges();
                        criarEventoBilhete(evento, nova, id_usuario);

                    }
                    else if (oque_e == "farmacia")
                    {

                        var farmacia = db.farmacia_produto.Where(q => q.id == id_produto).SingleOrDefault();

                        compra nova = new compra()
                        {
                            confirmado = true,
                            data_cadastro = DateTime.Now,
                            descricao = "Produto da Farmacia - " + farmacia.nome,
                            id_produto = farmacia.id,
                            id_usuario = id_usuario,
                            inactivo = false,
                            modo_pagamento = "mastercard",
                            oque_e = oque_e,
                            valor = farmacia.preco_venda,
                            tem_entrega = tem_entrega,
                            custo_transporte = tem_entrega == true ? valor - farmacia.preco_venda : 0,
                            id_transportadora = id_transportadora,
                            contacto_destinatario = contacto_destinatario,
                            local_entrega = local_entrega,
                            nome_destinatario = nome_destinatario
                        };
                        db.compras.Add(nova);
                        db.SaveChanges();

                    }
                    else if (oque_e == "clinica")
                    {

                        var clinica = db.clinicas.Where(q => q.id == id_produto).SingleOrDefault();

                        compra nova = new compra()
                        {
                            confirmado = true,
                            data_cadastro = DateTime.Now,
                            descricao = "Consulta de Clinica - " + clinica.nome,
                            id_produto = clinica.id,
                            id_usuario = id_usuario,
                            inactivo = false,
                            modo_pagamento = "mastercard",
                            oque_e = oque_e,
                            valor = clinica.preco_consulta,
                        };
                        db.compras.Add(nova);
                       
                        db.SaveChanges();

                    }
                    else if (oque_e == "subscricao")
                    {

                        var subscricao = db.pacote_subscricao.Where(q => q.id == id_produto).SingleOrDefault();

                        compra nova = new compra()
                        {
                            confirmado = true,
                            data_cadastro = DateTime.Now,
                            descricao = "Assinatura do pacote - " + subscricao.nome,
                            id_produto = subscricao.id,
                            id_usuario = id_usuario,
                            inactivo = false,
                            modo_pagamento = "mpesa",
                            oque_e = oque_e,
                            valor = subscricao.preco_por_mes,
                        };
                        db.compras.Add(nova);

                        db.SaveChanges();
                    }


                };

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException.Message);
                return Redirect("/PubMusica/PagamentoFalhou?erro=sads");
            }
            if (oque_e == "musica")
            {
                return Redirect("/Pagamento/PagamentoSucesso");
            }
            else if (oque_e == "musicaAlbum")
            {
                return Redirect("/Pagamento/PagamentoSucesso");
            }
            else
            {
                return Redirect("/Pagamento/PagamentoSucesso");
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

        public ActionResult PagarViaMasterCard(string SessioId, long id_produto)
        {
            bool resultado = false;
            string orderID = RandomStringNumber();
            string transationID = RandomStringNumber();

            RestClient restCliente = new RestClient("https://test-gateway.mastercard.com");

            var authorizationRequest = new RestRequest("/api/rest/version/54/merchant/22599/order/" + orderID + "/transaction/" + transationID, Method.PUT);
            authorizationRequest.AddHeader("Content-Type", "application/json");
            authorizationRequest.AddHeader("Authorization", $"Basic bWVyY2hhbnQuMjI1OTk6MzBlYzZkOGY1MmI3YzJiY2YzOGZkNWZlNzRjNDhkMzA=");

            var data = new PayRequest() { apiOperation = "AUTHORIZE", session = new PayRequest.Session() { id = SessioId }, sourceOfFunds = new PayRequest.SourceOfFunds() { type = "CARD" }, order = new PayRequest.Order() { amount = 100, currency = "MZN" } };
            authorizationRequest.AddJsonBody(data);
            var response = restCliente.Execute<PayResponse>(authorizationRequest);
            PayResponse Autorizacao = response.Data;

            if (Autorizacao.order.status == "AUTHORIZED")
            {
                RestRequest CaptureRequest = new RestRequest("/api/rest/version/54/merchant/22599/order/" + Autorizacao.order.id + "/transaction/" + RandomStringNumber(), Method.PUT);
                CaptureRequest.AddHeader("Content-Type", "application/json");
                CaptureRequest.AddHeader("Authorization", $"Basic bWVyY2hhbnQuMjI1OTk6MzBlYzZkOGY1MmI3YzJiY2YzOGZkNWZlNzRjNDhkMzA=");

                var data2 = new PayRequest() { transaction = new PayRequest.Transaction() { amount = 100, currency = "MZN" }, apiOperation = "CAPTURE", session = new PayRequest.Session() { id = SessioId }, sourceOfFunds = new PayRequest.SourceOfFunds() { type = "CARD" } };
                CaptureRequest.AddJsonBody(data2);
                var captura = restCliente.Execute<PayResponse>(CaptureRequest);
                PayResponse capturacao = captura.Data;
                if (capturacao.order.status == "CAPTURED")
                {
                    resultado = true;
                }
            }


            //salvarCompra(id_produto, "musica");

            if (resultado == false)
            {
                return Redirect("/PubMusica/PagamentoFalhou?erro=sads");
            }
            else
            {
                return Redirect("/Pagamento/PagamentoSucesso");
            }

        }

        private long CriarReserva(long id_usuario, string v, acomodacao_quarto quarto, compra nova, string checkIn, string checkOut)
        {
            long id_reserva = 0;
            try
            {
                using (var db = new mussika_bdEntities())
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
                        data_entrada = checkIn,
                        data_saida = checkOut,
                    };
                    var reg = db.acomodacao_reserva.Add(nova_reserva);
                    db.SaveChanges();

                    id_reserva = reg.id;
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
                using (var db = new mussika_bdEntities())
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

        private void criarEventoBilhete(evento evento, compra nova, long id_usuario)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    Random generator = new Random();
                    int r = generator.Next(1, 1000000);
                    string codigo_aut = r.ToString().PadLeft(10, '0');

                    evento_bilhete novo = new evento_bilhete()
                    {
                        data_compra = nova.data_cadastro,
                        id_evento = evento.id,
                        inactivo = false,
                        usuario = id_usuario,
                        valor = nova.valor,
                        token = codigo_aut,

                    };
                    if (nova.valor == evento.preco_bilhete)
                    {
                        novo.vip = false;
                    }
                    else
                    {
                        novo.vip = true;
                    }
                    db.evento_bilhete.Add(novo);
                    db.SaveChanges();
                    notificarCompraBilheteCliente(evento, nova, id_usuario, novo);
                };
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void notificarCompraBilheteCliente(evento evento, compra nova, long id_usuario, evento_bilhete novo)
        {
            string bilhete = novo.vip == true ? "BILHETE V.I.P" : "BILHETE NORMAL";
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
                    message.Subject = "[MUSSIKA] – Aquisição de Bilhete";
                    message.IsBodyHtml = true; //to make message body as html  
                    message.Body = "<p>Informamos que foi efectuada uma compra de Bilhete,</p> <p>abaixo encontre os detalhes da operação:.</p>" +
                        "<p>nome da Evento: " + evento.nome + "</p>" +
                        "<p>Efectuada por: " + nome + "</p>" +
                        "<p>Tipo de Bilhete: " + bilhete + "</p>" +
                        "<p>Codigo Bilhete: " + novo.token + "</p>" +
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
    }

}