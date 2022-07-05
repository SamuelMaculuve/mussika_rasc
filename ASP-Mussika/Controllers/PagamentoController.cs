using ASP_Mussika.Models;
using PayPal.Api;
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
    public class PagamentoController : Controller
    {
        // GET: Pagamento
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Televisao()
        {
            return View();
        }
        public ActionResult filme(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var model = db.filmes.Where(l => l.id == id).SingleOrDefault();
                var cat_ = db.item_filme_categoria.Where(f => f.id_filme == id && f.inactivo == false).ToList();
                List<item_categoria_filme_view_Model> listaCategoria = new List<item_categoria_filme_view_Model>();
                foreach (var item in cat_)
                {
                    item_categoria_filme_view_Model it = new item_categoria_filme_view_Model()
                    {
                        id = item.id,
                        nome = item.filme_categoria.descricao,
                    };
                    listaCategoria.Add(it);
                }
                ViewBag.categorias = listaCategoria;



                return View(model);
            }
        }
        public ActionResult Mesa()
        {
            return View();
        }
        public ActionResult TeatroDanca()
        {
            return View();
        }
        public ActionResult EventoEspectaculo()
        {
            return View();
        }
        public ActionResult Energia()
        {
            return View();
        }

        public ActionResult ProdutosComEntrega()
        {
            return View();
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
        public ActionResult PaymentPage(long id_produto)
        {
            ViewBag.id = id_produto;
            return View();
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
                    // resultado= salvarCompra(id_produto, "musica");
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

        private ActionResult Compra()
        {
            //try
            //{
            //    using (var db = new mussika_bdEntities())
            //    {
            //        long id_usuario = long.Parse(Session["idusario"].ToString());
            //        if (oque_e == "musica")
            //        {
            //            var existe = db.compras.Where(c => c.oque_e == "musica" && c.id_produto == id_produto && c.id_usuario == id_usuario).SingleOrDefault();
            //            if (existe == null)
            //            {
            //                musica musica = db.musicas.Where(c => c.id == id_produto).SingleOrDefault();
            //                compra nova = new compra()
            //                {
            //                    confirmado = true,
            //                    data_cadastro = DateTime.Now,
            //                    descricao = "musica de " + musica.artista_obra.nome,
            //                    id_produto = musica.id,
            //                    id_usuario = id_usuario,
            //                    inactivo = false,
            //                    modo_pagamento = "mpesa",
            //                    oque_e = oque_e,
            //                    valor = musica.preco_venda,
            //                };
            //                db.compras.Add(nova);
            //                db.SaveChanges();
            //            }
            //        }
            //        else if (oque_e == "musicaAlbum")
            //        {
            //            var existe = db.compras.Where(c => c.oque_e == "musicaAlbum" && c.id_produto == id_produto && c.id_usuario == id_usuario).SingleOrDefault();
            //            if (existe == null)
            //            {
            //                musica_album musica = db.musica_album.Where(c => c.id == id_produto).SingleOrDefault();
            //                var musicasDoAlbum = db.musicas.Where(m => m.id_album == musica.id).ToList();
            //                compra nova = new compra()
            //                {
            //                    confirmado = true,
            //                    data_cadastro = DateTime.Now,
            //                    descricao = "Album de " + musica.artista_obra.nome,
            //                    id_produto = musica.id,
            //                    id_usuario = id_usuario,
            //                    inactivo = false,
            //                    modo_pagamento = "mpesa",
            //                    oque_e = oque_e,
            //                    valor = musica.preco,
            //                };
            //                db.compras.Add(nova);
            //                db.SaveChanges();

            //                foreach (var item in musicasDoAlbum)
            //                {
            //                    compra nova_ = new compra()
            //                    {
            //                        confirmado = true,
            //                        data_cadastro = DateTime.Now,
            //                        descricao = "musica do Album " + musica.nome,
            //                        id_produto = item.id,
            //                        id_usuario = id_usuario,
            //                        inactivo = false,
            //                        modo_pagamento = "mpesa",
            //                        oque_e = "musica",
            //                        valor = item.preco_venda,
            //                    };
            //                    db.compras.Add(nova_);
            //                    db.SaveChanges();
            //                }

            //            }
            //        }
            //        else if (oque_e == "musicaVideo")
            //        {
            //            var existe = db.compras.Where(c => c.oque_e == "musicaVideo" && c.id_produto == id_produto && c.id_usuario == id_usuario).SingleOrDefault();
            //            if (existe == null)
            //            {
            //                musica musica = db.musicas.Where(c => c.id == id_produto).SingleOrDefault();
            //                compra nova = new compra()
            //                {
            //                    confirmado = true,
            //                    data_cadastro = DateTime.Now,
            //                    descricao = "Video clipe da musica de " + musica.artista_obra.nome,
            //                    id_produto = musica.id,
            //                    id_usuario = id_usuario,
            //                    inactivo = false,
            //                    modo_pagamento = "mpesa",
            //                    oque_e = oque_e,
            //                    valor = musica.preco_video,
            //                };
            //                db.compras.Add(nova);
            //                db.SaveChanges();
            //            }
            //        }

            //    };

            //}
            //catch (Exception ex)
            //{

            //    return Redirect("/PubMusica/PagamentoFalhou?erro=sads");
            //}
            //if (oque_e == "musica")
            //{
            //    return Redirect("/Pagamento/PagamentoSucesso");
            //}
            //else if (oque_e == "musicaAlbum")
            //{
            //    return Redirect("/Pagamento/PagamentoSucesso");
            //}
            //else
            //{
            //    return Redirect("/Pagamento/PagamentoSucesso");
            //}
            return Redirect("/Pagamento/PagamentoSucesso");
        }
        public ActionResult PagamentoSucesso()
        {
            return View();
        }

        public ActionResult paymentGateway(string oque, long id_produto, bool bilhete_vip = false)
        {
            CompraViewModel compra = new CompraViewModel();

            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var transpor = db.transportadoras.Where(a => a.inactivo == false).ToList();
                    ViewBag.transportadoras = transpor;
                }
                string caseSwitch = oque;

                switch (caseSwitch)
                {
                    case "restauranteMesa":
                        compra = carregarRestaurante(id_produto);
                        break;
                    case "acomodacao":
                        compra = carregarAcomodacao(id_produto);
                        break;
                    case "restaurantePrato":
                        compra = carregarRestaurantePrato(id_produto);
                        break;
                    case "lojaProduto":
                        compra = carregarProdutoLoja(id_produto);
                        break;
                    case "produtoBazar":
                        compra = carregarprodutoBazar(id_produto);
                        break;
                    case "arteCultura":
                        compra = carregarArteCultura(id_produto);
                        break;
                    case "evento":
                        compra = carregarEvento(id_produto, bilhete_vip);
                        break;
                    case "farmacia":
                        compra = carregarFarmacia(id_produto);
                        break;
                    case "clinica":
                        compra = carregarClinica(id_produto);
                        break;
                    case "subscricao":
                        compra = carregarSubscricao(id_produto);
                        break;
                    default:
                        Console.WriteLine("Default case");
                        break;
                }

            }
            catch (Exception ex)
            {

                throw;
            }
            return View(compra);
        }

        private CompraViewModel carregarSubscricao(long id_produto)
        {
            CompraViewModel compra = new CompraViewModel();
            using (var db = new mussika_bdEntities())
            {
                //var subscricao_pacote = db.pagamento_subscricao.Where(q => q.id_pacote_subscricao == id_produto).SingleOrDefault();
                var subscricao = db.pacote_subscricao.Where(q => q.id == id_produto).SingleOrDefault();

                compra.id_produto = subscricao.id;
                compra.nome = subscricao.nome;
                compra.oque_e = "subscricao";
                compra.valor = subscricao.preco_por_mes;
                compra.foto_capa = "https://mussika.co.mz/Repository/images/MussikaServico/mussika_pagamento.jpg";

            }
            return compra;
        }

        private CompraViewModel carregarClinica(long id_produto)
        {
            CompraViewModel compra = new CompraViewModel();
            using (var db = new mussika_bdEntities())
            {
                var clinica = db.clinicas.Where(q => q.id == id_produto).SingleOrDefault();

                compra.id_produto = clinica.id;
                compra.nome = clinica.nome;
                compra.oque_e = "clinica";
                compra.valor = clinica.preco_consulta;
                compra.foto_capa = "https://mussika.co.mz/Repository/images/clinicas/" + clinica.foto_capa;

            }
            return compra;
        }

        private CompraViewModel carregarFarmacia(long id_produto)
        {
            CompraViewModel compra = new CompraViewModel();
            using (var db = new mussika_bdEntities())
            {
                var farmacia = db.farmacia_produto.Where(q => q.id == id_produto).SingleOrDefault();

                compra.id_produto = farmacia.id;
                compra.nome = farmacia.nome;
                compra.oque_e = "farmacia";
                compra.peso = 0;
                compra.valor = farmacia.preco_venda;
                compra.foto_capa = "https://mussika.co.mz/Repository/images/farmacias/" + farmacia.foto_capa;

            }
            return compra;
        }

        private CompraViewModel carregarEvento(long id_produto, bool bilhete_vip)
        {
            CompraViewModel compra = new CompraViewModel();
            using (var db = new mussika_bdEntities())
            {
                var evento = db.eventoes.Where(q => q.id == id_produto).SingleOrDefault();

                compra.id_produto = evento.id;
                compra.nome = evento.nome;
                compra.oque_e = "evento";
                if (bilhete_vip == true) { compra.valor = evento.preco_bilhete_vip; } else { compra.valor = evento.preco_bilhete; }

                compra.foto_capa = "https://mussika.co.mz/Repository/images/eventos/" + evento.foto_capa;

            }
            return compra;
        }

        private CompraViewModel carregarArteCultura(long id_produto)
        {
            CompraViewModel compra = new CompraViewModel();
            using (var db = new mussika_bdEntities())
            {
                var arteCultura = db.obra_arte.Where(q => q.id == id_produto).SingleOrDefault();

                compra.id_produto = arteCultura.id;
                compra.nome = arteCultura.titulo;
                compra.oque_e = "arteCultura";
                compra.peso = arteCultura.peso ?? 0;
                compra.valor = arteCultura.preco_venda;
                compra.foto_capa = "https://mussika.co.mz/Repository/images/ArteCultura/" + arteCultura.caminho_imagem;

            }
            return compra;
        }

        private CompraViewModel carregarprodutoBazar(long id_produto)
        {
            CompraViewModel compra = new CompraViewModel();
            using (var db = new mussika_bdEntities())
            {
                var produtoBazar = db.artigoes.Where(q => q.id == id_produto).SingleOrDefault();

                compra.id_produto = produtoBazar.id;
                compra.nome = produtoBazar.nome;
                compra.oque_e = "produtoBazar";
                compra.peso = produtoBazar.peso??0;
                compra.valor = produtoBazar.preco_venda;
                compra.foto_capa = "https://mussika.co.mz/Repository/images/lojas/" + produtoBazar.foto_capa;

            }
            return compra;
        }

        private CompraViewModel carregarProdutoLoja(long id_produto)
        {
            CompraViewModel compra = new CompraViewModel();
            using (var db = new mussika_bdEntities())
            {
                var lojaProduto = db.loja_produto.Where(q => q.id == id_produto).SingleOrDefault();

                compra.id_produto = lojaProduto.id;
                compra.nome = lojaProduto.nome;
                compra.oque_e = "lojaProduto";
                compra.valor = lojaProduto.preco_venda;
                compra.peso = lojaProduto.peso ?? 0;
                compra.foto_capa = "https://mussika.co.mz/Repository/images/lojas/" + lojaProduto.foto_capa;

            }
            return compra;
        }

        private CompraViewModel carregarRestaurantePrato(long id_produto)
        {
            CompraViewModel compra = new CompraViewModel();
            using (var db = new mussika_bdEntities())
            {
                var prato = db.restaurante_prato.Where(q => q.id == id_produto).SingleOrDefault();

                compra.id_produto = prato.id;
                compra.nome = prato.nome + " do " + prato.restaurante.nome;
                compra.oque_e = "restaurantePrato";
                compra.peso = 0;
                compra.valor = prato.preco_venda;
                compra.foto_capa = "https://mussika.co.mz/Repository/images/Restaurantes/" + prato.foto_capa;

            }
            return compra;
        }

        private CompraViewModel carregarAcomodacao(long id_produto)
        {
            CompraViewModel compra = new CompraViewModel();
            using (var db = new mussika_bdEntities())
            {
                var quarto = db.acomodacao_quarto.Where(q => q.id == id_produto).SingleOrDefault();

                compra.id_produto = quarto.id;
                compra.nome = "Reserva de Quarto";
                compra.oque_e = "acomodacao";
                compra.valor = quarto.custo_diaria;
                compra.foto_capa = "https://mussika.co.mz/Repository/images/Acomodacoes/" + quarto.acomodacao.foto_capa;

            }
            return compra;
        }

        private CompraViewModel carregarRestaurante(long id_produto)
        {
            CompraViewModel compra = new CompraViewModel();
            using (var db = new mussika_bdEntities())
            {
                var restaurante = db.restaurantes.Where(r => r.id == id_produto).SingleOrDefault();

                compra.id_produto = restaurante.id;
                compra.nome = "Reserva de Mesa";
                compra.oque_e = "restauranteMesa";
                compra.valor = 100;
               
                compra.foto_capa = "https://mussika.co.mz/Repository/images/Restaurantes/" + restaurante.foto_capa;

            }
            return compra;

        }

        public async Task<ActionResult> pagarViaMpesa(long id, string numero, decimal valor, string oque_e, bool tem_entrega = false, int id_transportadora = 0, string local_entrega = "", string nome_destinatario = "", string contacto_destinatario = "", string local_levantamento = "", bool sensivel = false, bool peso_grande = false)
        {
            try
            {
                string numero_ = numero.Replace('(', ' ');
                numero_ = numero_.Replace(')', ' ');
                numero_ = numero_.Replace('-', ' ');
                numero_ = string.Concat(numero_.Where(c => !char.IsWhiteSpace(c)));

                WebClient client = new WebClient();
                string token = client.DownloadString("https://mpesa.mussika.co.mz/index.php");

                RestClient restClient = new RestClient("https://api.vm.co.mz:18352");
                RestRequest restRequest = new RestRequest("/ipg/v1x/c2bPayment/singleStage/", Method.POST);
                restRequest.AddHeader("Content-Type", "application/json");
                restRequest.AddHeader("Origin", "developer.mpesa.vm.co.mz");
                restRequest.AddHeader("Authorization", $"Bearer {token}");
                string ThirdPartyrefereence = RandomStringNumber();
                string TransactionReference = RandomStringNumber();

                //string dinheiro = verificar_preco(id, valor, oque_e,tem_entrega);
                string dinheiro = valor.ToString();
                if (dinheiro == "") { return Redirect("/PubMusica/PagamentoFalhou?erro=Não foi possivel processar o pagamento!"); }

                var data = new C2B_MODEL() { input_Amount = dinheiro, input_CustomerMSISDN = numero_, input_ServiceProviderCode = "900413", input_ThirdPartyReference = ThirdPartyrefereence, input_TransactionReference = TransactionReference };
                restRequest.AddJsonBody(data);

                var response = await restClient.ExecuteAsync<MpesaResponse>(restRequest);
                if (response.IsSuccessful == true)
                {
                    MpesaResponse resposta = response.Data;
                    if (resposta.output_ResponseCode == "INS-0")
                    {
                        criarCompra(id, numero, valor, oque_e, tem_entrega, local_entrega, nome_destinatario, contacto_destinatario, local_levantamento, sensivel, peso_grande, id_transportadora);

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

        private void criarCompra(long id, string numero, decimal valor, string oque_e, bool tem_entrega, string local_entrega, string nome_destinatario, string contacto_destinatario, string local_levantamento, bool sensivel, bool peso_grande, int id_transportadora = 0)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    long id_usuario = long.Parse(Session["idusario"].ToString());
                    compra comrpa_efectuada = null; ;

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
                            var record = db.compras.Add(nova);
                            db.SaveChanges();
                            comrpa_efectuada = record;
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
                            var record = db.compras.Add(nova);
                            db.SaveChanges();
                            comrpa_efectuada = record;

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
                                var recorde = db.compras.Add(nova);
                                db.SaveChanges();
                                comrpa_efectuada = recorde;
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
                            var record = db.compras.Add(nova);
                            db.SaveChanges();
                            comrpa_efectuada = record;
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
                        var record = db.compras.Add(nova);
                        db.SaveChanges();
                        comrpa_efectuada = record;

                    }
                    else if (oque_e == "restaurantePrato")
                    {

                        restaurante_prato prato = db.restaurante_prato.Where(c => c.id == id).SingleOrDefault();
                        compra nova = new compra()
                        {
                            confirmado = true,
                            data_cadastro = DateTime.Now,
                            descricao = prato.nome + " do " + prato.restaurante.nome,
                            id_produto = prato.id,
                            id_usuario = id_usuario,
                            inactivo = false,
                            modo_pagamento = "mpesa",
                            oque_e = oque_e,
                            valor = prato.preco_venda,
                            tem_entrega = tem_entrega,
                            custo_transporte = tem_entrega == true ? valor - prato.preco_venda : 0,
                            id_transportadora = id_transportadora,
                            contacto_destinatario = contacto_destinatario,
                            local_entrega = local_entrega,
                            nome_destinatario = nome_destinatario,
                            local_levantamento = local_levantamento,
                            sensivel = sensivel,
                            peso_grande = peso_grande,
                        };
                        var record = db.compras.Add(nova);
                        db.SaveChanges();
                        comrpa_efectuada = record;

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
                        var record = db.compras.Add(nova);
                        db.SaveChanges();
                        comrpa_efectuada = record;

                    }
                    else if (oque_e == "lojaProduto")
                    {

                        var lojaProduto = db.loja_produto.Where(q => q.id == id).SingleOrDefault();
                        compra nova = new compra()
                        {
                            confirmado = true,
                            data_cadastro = DateTime.Now,
                            descricao = lojaProduto.nome + " - loja: " + lojaProduto.loja.nome,
                            id_produto = lojaProduto.id,
                            id_usuario = id_usuario,
                            inactivo = false,
                            modo_pagamento = "mpesa",
                            oque_e = oque_e,
                            valor = lojaProduto.preco_venda,
                            tem_entrega = tem_entrega,
                            custo_transporte = tem_entrega == true ? valor - lojaProduto.preco_venda : 0,
                            id_transportadora = id_transportadora,
                            contacto_destinatario = contacto_destinatario,
                            local_entrega = local_entrega,
                            nome_destinatario = nome_destinatario,
                            local_levantamento = local_levantamento,
                            sensivel = sensivel,
                            peso_grande = peso_grande,
                        };
                        var record = db.compras.Add(nova);
                        db.SaveChanges();
                        comrpa_efectuada = record;

                    }
                    else if (oque_e == "produtoBazar")
                    {

                        var produtoBazar = db.artigoes.Where(q => q.id == id).SingleOrDefault();
                        compra nova = new compra()
                        {
                            confirmado = true,
                            data_cadastro = DateTime.Now,
                            descricao = produtoBazar.nome,
                            id_produto = produtoBazar.id,
                            id_usuario = id_usuario,
                            inactivo = false,
                            modo_pagamento = "mpesa",
                            oque_e = oque_e,
                            valor = produtoBazar.preco_venda,
                            tem_entrega = tem_entrega,
                            custo_transporte = tem_entrega == true ? valor - produtoBazar.preco_venda : 0,
                            id_transportadora = id_transportadora,
                            contacto_destinatario = contacto_destinatario,
                            local_entrega = local_entrega,
                            nome_destinatario = nome_destinatario,
                            local_levantamento = local_levantamento,
                            sensivel = sensivel,
                            peso_grande = peso_grande,
                        };
                        var record = db.compras.Add(nova);
                        db.SaveChanges();
                        comrpa_efectuada = record;

                    }
                    else if (oque_e == "arteCultura")
                    {

                        var arteCultura = db.obra_arte.Where(q => q.id == id).SingleOrDefault();

                        compra nova = new compra()
                        {
                            confirmado = true,
                            data_cadastro = DateTime.Now,
                            descricao = "Obra Arte - " + arteCultura.titulo,
                            id_produto = arteCultura.id,
                            id_usuario = id_usuario,
                            inactivo = false,
                            modo_pagamento = "mpesa",
                            oque_e = oque_e,
                            valor = arteCultura.preco_venda,
                            tem_entrega = tem_entrega,
                            custo_transporte = tem_entrega == true ? valor - arteCultura.preco_venda : 0,
                            
                        };
                        if(tem_entrega == true)
                        {
                            nova.id_transportadora = id_transportadora;
                            nova.contacto_destinatario = contacto_destinatario;
                            nova.local_entrega = local_entrega;
                            nova.nome_destinatario = nome_destinatario;
                            nova.local_levantamento = local_levantamento;
                            nova.sensivel = sensivel;
                            nova.peso_grande = peso_grande;
                        }
                        var record = db.compras.Add(nova);
                        db.SaveChanges();
                        comrpa_efectuada = record;

                    }
                    else if (oque_e == "evento")
                    {

                        var evento = db.eventoes.Where(q => q.id == id).SingleOrDefault();

                        compra nova = new compra()
                        {
                            confirmado = true,
                            data_cadastro = DateTime.Now,
                            descricao = "Evento - " + evento.nome,
                            id_produto = evento.id,
                            id_usuario = id_usuario,
                            inactivo = false,
                            modo_pagamento = "mpesa",
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
                        var record = db.compras.Add(nova);
                        db.SaveChanges();
                        comrpa_efectuada = record;

                        criarEventoBilhete(evento, nova, id_usuario);

                    }
                    else if (oque_e == "farmacia")
                    {

                        var farmacia = db.farmacia_produto.Where(q => q.id == id).SingleOrDefault();

                        compra nova = new compra()
                        {
                            confirmado = true,
                            data_cadastro = DateTime.Now,
                            descricao = "Produto da Farmacia - " + farmacia.nome,
                            id_produto = farmacia.id,
                            id_usuario = id_usuario,
                            inactivo = false,
                            modo_pagamento = "mpesa",
                            oque_e = oque_e,
                            valor = farmacia.preco_venda,
                            tem_entrega = tem_entrega,
                            custo_transporte = tem_entrega == true ? valor - farmacia.preco_venda : 0,
                            id_transportadora = id_transportadora,
                            contacto_destinatario = contacto_destinatario,
                            local_entrega = local_entrega,
                            nome_destinatario = nome_destinatario,
                            local_levantamento = local_levantamento,
                            sensivel = sensivel,
                            peso_grande = peso_grande,
                        };
                        var record = db.compras.Add(nova);
                        db.SaveChanges();
                        comrpa_efectuada = record;

                    }
                    else if (oque_e == "clinica")
                    {

                        var clinica = db.clinicas.Where(q => q.id == id).SingleOrDefault();

                        compra nova = new compra()
                        {
                            confirmado = true,
                            data_cadastro = DateTime.Now,
                            descricao = "Consulta de Clinica - " + clinica.nome,
                            id_produto = clinica.id,
                            id_usuario = id_usuario,
                            inactivo = false,
                            modo_pagamento = "mpesa",
                            oque_e = oque_e,
                            valor = clinica.preco_consulta,

                        };
                        var record = db.compras.Add(nova);
                        db.SaveChanges();
                        comrpa_efectuada = record;
                    }

                    else if (oque_e == "subscricao")
                    {

                        var subscricao = db.pacote_subscricao.Where(q => q.id == id).SingleOrDefault();

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
                        var record = db.compras.Add(nova);
                        db.SaveChanges();
                        comrpa_efectuada = record;

                        var last_record = db.pagamento_subscricao.OrderByDescending(p => p.id).FirstOrDefault();
                        last_record.confirmado = true;
                        db.SaveChanges();
                    }
                    if (comrpa_efectuada.tem_entrega == true)
                    {
                        compra transporte = new compra()
                        {
                            confirmado = true,
                            data_cadastro = DateTime.Now,
                            descricao = "Transporte de produto - "+comrpa_efectuada.descricao,
                            id_produto = comrpa_efectuada.id_transportadora,
                            id_transportadora= comrpa_efectuada.id_transportadora,
                            id_usuario = id_usuario,
                            inactivo = false,
                            modo_pagamento = "mpesa",
                            oque_e = "transportadora",
                            valor = comrpa_efectuada.custo_transporte,
                            provedor_pago=false,
                        };
                         db.compras.Add(transporte);
                        db.SaveChanges();
                    }
                    comrpa_efectuada.provedor_pago = false;
                    db.SaveChanges();
                    if (tem_entrega == true)
                    {
                        notificaEntrega(comrpa_efectuada);
                    }
                };

            }
            catch (Exception ex)
            {

                throw;
            }
        }

        private void notificaEntrega(compra comrpa_efectuada)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    if(comrpa_efectuada.oque_e== "lojaProduto")
                    {
                        var produto = db.loja_produto.Where(l => l.id == comrpa_efectuada.id_produto).SingleOrDefault();
                        var transportadora = db.transportadoras.Where(t => t.id_transportadora == comrpa_efectuada.id_transportadora).SingleOrDefault();
                        enviarEmailTransportadora(produto.peso ?? 0, produto.loja.bairro, transportadora, comrpa_efectuada);
                    }
                    if (comrpa_efectuada.oque_e == "farmacia")
                    {
                        var produto = db.farmacia_produto.Where(l => l.id == comrpa_efectuada.id_produto).SingleOrDefault();
                        var transportadora = db.transportadoras.Where(t => t.id_transportadora == comrpa_efectuada.id_transportadora).SingleOrDefault();
                        enviarEmailTransportadora(produto.peso??0,produto.farmacia.bairro, transportadora, comrpa_efectuada);
                    }
                    if (comrpa_efectuada.oque_e == "arteCultura")
                    {
                        var produto = db.obra_arte.Where(l => l.id == comrpa_efectuada.id_produto).SingleOrDefault();
                        var transportadora = db.transportadoras.Where(t => t.id_transportadora == comrpa_efectuada.id_transportadora).SingleOrDefault();
                        enviarEmailTransportadora(produto.peso ?? 0, produto.artista_obra.distrito.nome, transportadora, comrpa_efectuada);
                    }

                    if (comrpa_efectuada.oque_e == "restaurantePrato")
                    {
                        var produto = db.restaurante_prato.Where(l => l.id == comrpa_efectuada.id_produto).SingleOrDefault();
                        var transportadora = db.transportadoras.Where(t => t.id_transportadora == comrpa_efectuada.id_transportadora).SingleOrDefault();
                        enviarEmailTransportadora(produto.peso ?? 0, produto.restaurante.endereco, transportadora, comrpa_efectuada);
                    }
                    if (comrpa_efectuada.oque_e == "produtoBazar")
                    {
                        var produto = db.artigoes.Where(l => l.id == comrpa_efectuada.id_produto).SingleOrDefault();
                        var transportadora = db.transportadoras.Where(t => t.id_transportadora == comrpa_efectuada.id_transportadora).SingleOrDefault();
                        enviarEmailTransportadora(produto.peso ?? 0, produto.bairro, transportadora, comrpa_efectuada);
                    }

                }
            }
            catch (Exception)
            {


            }
        }

        private void enviarEmailTransportadora(decimal peso,string endereco_produto, transportadora transportadora, compra comrpa_efectuada)
        {
            try
            {
                Random generator = new Random();
                int r = generator.Next(1, 1000000);
                string codigo_aut = r.ToString().PadLeft(10, '0');

                long id_cliente = long.Parse(Session["idusario"].ToString());
                string produto_sensivel = "";
                if (comrpa_efectuada.sensivel == true) { produto_sensivel = "SIM"; } else { produto_sensivel= "NÃO";};
                using (var db = new mussika_bdEntities())
                {
                    var usuario = db.Usuarios.Where(u => u.idusario == id_cliente).SingleOrDefault();

                    MailMessage message = new MailMessage();
                    SmtpClient smtp = new SmtpClient("wsrv1.mozdomains.com");
                    message.From = new MailAddress("confirmacao@mussika.co.mz");
                    message.To.Add(new MailAddress(transportadora.Usuario.usuario1));
                    message.Subject = "[MUSSIKA] – SOLICITAÇÃO DE ENTREGA DE PRODUTO";
                    message.IsBodyHtml = true; //to make message body as html  
                    message.Body = "<p>Informamos que foi efectuada uma solicitação de entrega de produto, abaixo encontre os detalhes da entrega:</p>" +
                        "<p>Nome da Cliente: " + usuario.nome + "</p>" +
                        "<p>Email: " + usuario.usuario1 + "</p>" +
                        "<p>Contacto do Cliente: " + usuario.telefone + "</p>" +
                        "<p>Nome do Produto a Ser Transportado: " + comrpa_efectuada.descricao + "</p>" +
                        "<p>Peso: " +peso + "</p>" +
                        "<p>Produto sensivel: " + produto_sensivel + "</p>" +
                        "<p>Total a Pagar: " + comrpa_efectuada.custo_transporte + "</p>" +
                        "<p>Local de Levantamento do Produto: " + comrpa_efectuada.local_levantamento + "</p>" +
                        "<p>Local Entrega: " + comrpa_efectuada.local_entrega + "</p>" +
                        "<p>Contacto Destinatario: " + comrpa_efectuada.contacto_destinatario + "</p>" +
                        "<p>Nome Destinatario: " + comrpa_efectuada.nome_destinatario + "</p>" +
                        "<p>Codigo da Entrega: " + codigo_aut + "</p>" +
                        

                        
                    "<p>Obrigado!</p>";


                    //smtp.Port = 587;
                    //smtp.Host = "smtp.gmail.com"; //for gmail host  
                    smtp.EnableSsl = false;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential("confirmacao@mussika.co.mz", "mussika123456789");
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.Send(message);

                    //////////////cliente//////////////////////////////////////////////////

                    MailMessage message_cliente = new MailMessage();
                    SmtpClient smtp_cliente = new SmtpClient("wsrv1.mozdomains.com");
                    message_cliente.From = new MailAddress("confirmacao@mussika.co.mz");
                    message_cliente.To.Add(new MailAddress(usuario.usuario1));
                    message_cliente.Subject = "[MUSSIKA] – SOLICITAÇÃO DE ENTREGA DE PRODUTO";
                    message_cliente.IsBodyHtml = true; //to make message body as html  
                    message_cliente.Body = "<p>Informamos que efectuou uma solicitação de entrega de produto, abaixo encontre os detalhes do pedido:</p>" +
                        "<p>Nome da Cliente: " + usuario.nome + "</p>" +
                        "<p>Email: " + usuario.usuario1 + "</p>" +
                        "<p>Contacto do Cliente: " + usuario.telefone + "</p>" +
                        "<p>Nome do Produto a Ser Transportado: " + comrpa_efectuada.descricao + "</p>" +
                        "<p>Peso: " + peso + "</p>" +
                        "<p>Produto sensivel: " + produto_sensivel + "</p>" +
                        "<p>Total a Pagar: " + comrpa_efectuada.custo_transporte + "</p>" +
                        "<p>Local de Levantamento do Produto: " + comrpa_efectuada.local_levantamento + "</p>" +
                        "<p>Local Entrega: " + comrpa_efectuada.local_entrega + "</p>" +
                        "<p>Contacto Destinatario: " + comrpa_efectuada.contacto_destinatario + "</p>" +
                        "<p>Nome Destinatario: " + comrpa_efectuada.nome_destinatario + "</p>" +
                        "<p>Codigo da Entrega: " + codigo_aut + "</p>" +



                    "<p>Obrigado!</p>";


                    //smtp.Port = 587;
                    //smtp.Host = "smtp.gmail.com"; //for gmail host  
                    smtp_cliente.EnableSsl = false;
                    smtp_cliente.UseDefaultCredentials = false;
                    smtp_cliente.Credentials = new NetworkCredential("confirmacao@mussika.co.mz", "mussika123456789");
                    smtp_cliente.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp_cliente.Send(message_cliente);

                }
            }
            catch (Exception ex)
            {


            }
        }

        private string verificar_preco(long id, decimal valor, string oque_e,bool tem_entrega=false)
        {
            decimal valor_real = 0;
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    switch (oque_e)
                    {
                        case "musica":
                            var musica = db.musicas.Where(m => m.id == id).SingleOrDefault();
                            valor_real = musica.preco_venda??0;
                            break;
                        case "musicaVideo":
                            var musicaVideo = db.musicas.Where(m => m.id == id).SingleOrDefault();
                            valor_real = musicaVideo.preco_video??0;
                            break;
                        case "musicaAlbum":
                            var musicaAlbum = db.musica_album.Where(m => m.id == id).SingleOrDefault();
                            valor_real = musicaAlbum.preco??0;
                            break;
                        case "acomodacao":
                            var acomodacao_quarto = db.acomodacao_quarto.Where(m => m.id == id).SingleOrDefault();
                            valor_real = acomodacao_quarto.custo_diaria??0;
                            break;
                        case "restaurantePrato":
                            var restaurantePrato = db.restaurante_prato.Where(m => m.id == id).SingleOrDefault();
                            valor_real = restaurantePrato.preco_venda??0;
                            break;
                        case "lojaProduto":
                            var lojaProduto = db.loja_produto.Where(m => m.id == id).SingleOrDefault();
                            valor_real = lojaProduto.preco_venda??0;
                            break;
                        case "produtoBazar":
                            var produtoBazar = db.artigoes.Where(m => m.id == id).SingleOrDefault();
                            valor_real = produtoBazar.preco_venda??0;
                            break;
                        case "evento":
                            var evento = db.eventoes.Where(m => m.id == id).SingleOrDefault();
                            if (valor == evento.preco_bilhete || valor == evento.preco_bilhete_vip) { valor_real = valor; }
                            valor_real = evento.preco_bilhete??0;
                            break;
                        case "farmacia":
                            var farmacia = db.farmacia_produto.Where(m => m.id == id).SingleOrDefault();
                            valor_real = farmacia.preco_venda??0;
                            break;
                        case "clinica":
                            var clinica = db.clinicas.Where(m => m.id == id).SingleOrDefault();
                            valor_real = clinica.preco_consulta??0;
                            break;
                        case "subscricao":
                            var subscricao = db.pacote_subscricao.Where(m => m.id == id).SingleOrDefault();
                            valor_real = subscricao.preco_por_mes??0;
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
            
            return valor_real.ToString();
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
                        "<p>NB: Mantenha o codigo bilhete seguro pois o mesmo é o comprovativo da aquisição do Bilhete!</p>" +
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

        public ActionResult pay_master_card(long id, decimal valor, string oque_e, bool tem_entrega = false, int id_transportadora = 0, string local_entrega = "", string nome_destinatario = "", string contacto_destinatario = "", bool sensivel = false, bool peso_grande = false)
        {
            string preco_real = verificar_preco(id, valor, oque_e);
            if (preco_real == "") { return Redirect("/PubMusica/PagamentoFalhou?erro=Não foi possivel processar o pagamento!"); }

            return Redirect("https://payment.bim.mussika.co.mz/home/index?id=" + id + "&valor=" + preco_real + "&oque_e=" + oque_e + "&tem_entrega=" + tem_entrega + "&id_transportadora=" + id_transportadora + "&local_entrega=" + local_entrega + "&nome_destinatario=" + nome_destinatario + "&contacto_destinatario=" + contacto_destinatario);
        }
        /***********************************/

        public ActionResult PaymentWithPaypal(string Cancel = null)
        {
            //getting the apiContext
            APIContext apiContext = PaypalConfiguration.GetAPIContext();

            try
            {
                //A resource representing a Payer that funds a payment Payment Method as paypal
                //Payer Id will be returned when payment proceeds or click to pay
                string payerId = Request.Params["PayerID"];

                if (string.IsNullOrEmpty(payerId))
                {
                    //this section will be executed first because PayerID doesn't exist
                    //it is returned by the create function call of the payment class

                    // Creating a payment
                    // baseURL is the url on which paypal sendsback the data.
                    string baseURI = Request.Url.Scheme + "://" + Request.Url.Authority +
                                "/Pagamento/PaymentWithPayPal?";

                    //here we are generating guid for storing the paymentID received in session
                    //which will be used in the payment execution

                    var guid = Convert.ToString((new Random()).Next(100000));

                    //CreatePayment function gives us the payment approval url
                    //on which payer is redirected for paypal account payment

                    var createdPayment = this.CreatePayment(apiContext, baseURI + "guid=" + guid);

                    //get links returned from paypal in response to Create function call

                    var links = createdPayment.links.GetEnumerator();

                    string paypalRedirectUrl = null;

                    while (links.MoveNext())
                    {
                        Links lnk = links.Current;

                        if (lnk.rel.ToLower().Trim().Equals("approval_url"))
                        {
                            //saving the payapalredirect URL to which user will be redirected for payment
                            paypalRedirectUrl = lnk.href;
                        }
                    }

                    // saving the paymentID in the key guid
                    Session.Add(guid, createdPayment.id);

                    return Redirect(paypalRedirectUrl);
                }
                else
                {

                    // This function exectues after receving all parameters for the payment

                    var guid = Request.Params["guid"];

                    var executedPayment = ExecutePayment(apiContext, payerId, Session[guid] as string);

                    //If executed payment failed then we will show payment failure message to user
                    if (executedPayment.state.ToLower() != "approved")
                    {
                        return View("FailureView");
                    }
                }
            }
            catch (Exception ex)
            {
                return View("FailureView");
            }

            //on successful payment, show success page to user.
            return View("SuccessView");
        }

        private PayPal.Api.Payment payment;
        private Payment ExecutePayment(APIContext apiContext, string payerId, string paymentId)
        {
            var paymentExecution = new PaymentExecution() { payer_id = payerId };
            this.payment = new Payment() { id = paymentId };
            return this.payment.Execute(apiContext, paymentExecution);
        }

        private Payment CreatePayment(APIContext apiContext, string redirectUrl)
        {

            //create itemlist and add item objects to it
            var itemList = new ItemList() { items = new List<Item>() };

            //Adding Item Details like name, currency, price etc
            itemList.items.Add(new Item()
            {
                name = "Item Name comes here",
                currency = "USD",
                price = "1",
                quantity = "1",
                sku = "sku"
            });

            var payer = new Payer() { payment_method = "paypal" };

            // Configure Redirect Urls here with RedirectUrls object
            var redirUrls = new RedirectUrls()
            {
                cancel_url = redirectUrl + "&Cancel=true",
                return_url = redirectUrl
            };

            // Adding Tax, shipping and Subtotal details
            var details = new Details()
            {
                tax = "1",
                shipping = "1",
                subtotal = "1"
            };

            //Final amount with details
            var amount = new Amount()
            {
                currency = "USD",
                total = "3", // Total must be equal to sum of tax, shipping and subtotal.
                details = details
            };

            var transactionList = new List<Transaction>();
            // Adding description about the transaction
            transactionList.Add(new Transaction()
            {
                description = "Transaction description",
                invoice_number = "your invoice number", //Generate an Invoice No
                amount = amount,
                item_list = itemList
            });


            this.payment = new Payment()
            {
                intent = "sale",
                payer = payer,
                transactions = transactionList,
                redirect_urls = redirUrls
            };

            // Create a payment using a APIContext
            return this.payment.Create(apiContext);
        }

    }
}