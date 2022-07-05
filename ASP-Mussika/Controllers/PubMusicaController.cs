using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using ASP_Mussika.Models;
using PagedList;
using RestSharp;

namespace ASP_Mussika.Controllers
{
    public class PubMusicaController : Controller
    {
        // GET: PubMusica

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AssistirVideo(long idVideo)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    musica item = db.musicas.Where(c => c.id == idVideo).SingleOrDefault();
                    MusicaViewModel model_ = new MusicaViewModel()
                    {
                        album = item.album,
                        ano = item.ano,
                        artista = item.artista,
                        caminho_capa1 = item.caminho_capa1,
                        duracao = item.duracao,
                        e_album = item.e_album,
                        formato = item.formato,
                        genero = item.genero_musical.descricao,
                        gratis = item.gratis,
                        gravadora = item.gravadora,
                        id = item.id,
                        id_artista_obra = item.id_artista_obra??0,
                        id_genero_musical = item.id_genero_musical,
                        link = item.link,
                        pode_baixar = item.pode_baixar,
                        preco_venda = item.preco_venda,
                        produtor = item.produtor,
                        titulo = item.titulo,
                        //distrito = item.artista_obra.distrito.nome,
                        caminho_ficheiro = item.caminho_ficheiro,

                    };
                    return View(model_);
                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }
        public ActionResult Cantores(int? page, string filtro = "", int categoria = 0)
        {
            List<artista_obra> cantores = new List<artista_obra>();
            ViewBag.filtro = filtro;
            ViewBag.categoria = categoria;
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    ViewBag.categorias = db.genero_musical.ToList();

                    if (string.IsNullOrEmpty(filtro))
                    {
                        if (categoria != 0)
                        {
                            var obra_arte = db.musicas.Where(h => h.id_genero_musical == categoria && h.artista_obra.e_musico == true).ToList();
                            foreach (var item in obra_arte)
                            {
                                artista_obra ar_ = db.artista_obra.Where(a => a.id == item.id_artista_obra).SingleOrDefault();
                                var existe = cantores.FindAll(c => c.id == ar_.id);
                                if (existe.Count == 0)
                                {
                                    cantores.Add(ar_);
                                }
                            }
                        }
                        else
                        {
                            cantores = db.artista_obra.Where(c => c.e_musico == true).ToList();
                        }

                    }
                    else
                    {
                        if (categoria != 0)
                        {
                            var obra_arte = db.obra_arte.Where(h => h.id_categoria_obra == categoria && h.artista_obra.e_musico == true).ToList();
                            foreach (var item in obra_arte)
                            {
                                artista_obra ar_ = db.artista_obra.Where(a => a.id == item.id_artista_obra).SingleOrDefault();
                                var existe = cantores.FindAll(c => c.id == ar_.id);
                                if (existe.Count == 0)
                                {
                                    cantores.Add(ar_);
                                }

                            }
                        }
                        else
                        {
                            cantores = db.artista_obra.Where(h => h.e_musico == true && h.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
                        }

                    }



                    int pageSize = 10;
                    int pageNumber = (page ?? 1);
                    return View(cantores.ToPagedList(pageNumber, pageSize));
                }
            }
            catch (Exception ex)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }

        public ActionResult videos(int? page, string filtro = "", int categoria = 0)
        {
            List<musica> cantores = new List<musica>();
            ViewBag.filtro = filtro;
            ViewBag.categoria = categoria;
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    ViewBag.categorias = db.genero_musical.ToList();

                    if (string.IsNullOrEmpty(filtro))
                    {
                        if (categoria != 0)
                        {
                            var obra_arte = db.musicas.Where(h => h.id_genero_musical == categoria  && h.link!=null).ToList();
                            foreach (var item in obra_arte)
                            {
                                item.artista = item.artista_obra.nome;
                                    cantores.Add(item);
                                
                            }
                        }
                        else
                        {
                            cantores = db.musicas.Where(c => c.link != null).ToList();
                        }

                    }
                    else
                    {
                        if (categoria != 0)
                        {
                            var obra_arte = db.musicas.Where(h => h.id_genero_musical == categoria && h.link != null).ToList();
                            foreach (var item in obra_arte)
                            {
                                item.artista = item.artista_obra.nome;
                                cantores.Add(item);
                                

                            }
                        }
                        else
                        {
                            cantores = db.musicas.Where(h => h.titulo.Trim().ToLower().Contains(filtro.Trim().ToLower()) || h.artista.Trim().ToLower().Contains(filtro.Trim().ToLower()) && h.link != null).ToList();
                        }

                    }

                    foreach (var item in cantores)
                    {
                        item.artista = item.artista_obra.nome;
                        


                    }

                    int pageSize = 10;
                    int pageNumber = (page ?? 1);
                    return View(cantores.ToPagedList(pageNumber, pageSize));
                }
            }
            catch (Exception ex)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }

        public ActionResult Musicas(long cantor, int? page, int categoria = 0)
        {
            List<MusicaViewModel> listaMusica = new List<MusicaViewModel>();
            try
            {


                using (var db = new mussika_bdEntities())
                {
                    ViewBag.categorias = db.genero_musical.ToList();
                    List<musica> musicas = null;
                    if (categoria != 0)
                    {
                        musicas = db.musicas.Where(o => o.id_genero_musical == categoria && o.id_artista_obra == cantor && o.link == null && o.inactiva==false).ToList();
                    }
                    else
                    {
                        musicas = db.musicas.Where(o => o.id_artista_obra == cantor && o.link== null && o.inactiva == false).ToList();
                    }

                    ViewBag.id_cantor = cantor;
                    ViewBag.cantor = db.artista_obra.Where(a => a.id == cantor).SingleOrDefault();
                    foreach (var item in musicas)
                    {
                        MusicaViewModel model_ = new MusicaViewModel()
                        {
                            album = item.album,
                            ano = item.ano,
                            artista = item.artista,
                            caminho_capa1 = item.caminho_capa1,
                            duracao = item.duracao,
                            e_album = item.e_album,
                            formato = item.formato,
                            genero = item.genero_musical.descricao,
                            gratis = item.gratis,
                            gravadora = item.gravadora,
                            id = item.id,
                            id_artista_obra = item.id_artista_obra,
                            id_genero_musical = item.id_genero_musical,
                            link = item.link,
                            pode_baixar = item.pode_baixar,
                            preco_venda = item.preco_venda,
                            produtor = item.produtor,
                            titulo = item.titulo,
                        };
                        listaMusica.Add(model_);
                    }
                    int pageSize = 10;
                    int pageNumber = (page ?? 1);
                    return View(listaMusica.ToPagedList(pageNumber, pageSize));
                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }
        public ActionResult videomusicas(long cantor, int? page, int categoria = 0)
        {
            List<MusicaViewModel> listaMusica = new List<MusicaViewModel>();
            try
            {


                using (var db = new mussika_bdEntities())
                {
                    ViewBag.categorias = db.genero_musical.ToList();
                    List<musica> musicas = null;
                    if (categoria != 0)
                    {
                        musicas = db.musicas.Where(o => o.id_genero_musical == categoria && o.id_artista_obra == cantor).ToList();
                    }
                    else
                    {
                        musicas = db.musicas.Where(o => o.id_artista_obra == cantor).ToList();
                    }

                    ViewBag.id_cantor = cantor;
                    ViewBag.cantor = db.artista_obra.Where(a => a.id == cantor).SingleOrDefault();
                    foreach (var item in musicas)
                    {
                        MusicaViewModel model_ = new MusicaViewModel()
                        {
                            album = item.album,
                            ano = item.ano,
                            artista = item.artista,
                            caminho_capa1 = item.caminho_capa1,
                            duracao = item.duracao,
                            e_album = item.e_album,
                            formato = item.formato,
                            genero = item.genero_musical.descricao,
                            gratis = item.gratis,
                            gravadora = item.gravadora,
                            id = item.id,
                            id_artista_obra = item.id_artista_obra,
                            id_genero_musical = item.id_genero_musical,
                            link = item.link,
                            pode_baixar = item.pode_baixar,
                            preco_venda = item.preco_venda,
                            produtor = item.produtor,
                            titulo = item.titulo,
                        };
                        listaMusica.Add(model_);
                    }
                    int pageSize = 10;
                    int pageNumber = (page ?? 1);
                    return View(listaMusica.ToPagedList(pageNumber, pageSize));
                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }


        public ActionResult Albuns(int? page)
        {
            List<MusicaViewModel> listaMusica = new List<MusicaViewModel>();
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    ViewBag.categorias = db.genero_musical.ToList();
                    List<musica_album> musicas = null;

                    musicas = db.musica_album.Where(o => o.inactivo == false).ToList();
                    foreach (var item in musicas)
                    {
                        MusicaViewModel model_ = new MusicaViewModel()
                        {
                           
                            ano = item.ano_lancamento,
                            genero = item.genero_musical.descricao,
                            gravadora = item.gravadora,
                            id = item.id,
                            id_artista_obra = item.id_artista,
                            id_genero_musical = item.id_genero,
                            preco_venda = item.preco,
                            produtor = item.produtor,
                            titulo = item.nome,
                            caminho_capa1=item.foto_capa,
                        };
                        listaMusica.Add(model_);
                    }
                    int pageSize = 10;
                    int pageNumber = (page ?? 1);
                    return View(listaMusica.ToPagedList(pageNumber, pageSize));
                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }

        public ActionResult AlbumDetalhe(long id,int? page)
        {
            List<MusicaViewModel> listaMusica = new List<MusicaViewModel>();
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    ViewBag.id = id;
                    List<musica> musicas = null;
                    var album = db.musica_album.Where(a => a.id == id).SingleOrDefault();
                    ViewBag.nome_album = album.nome;

                    long usuario = 0;
                    if (Session["idusario"] != null)
                    {
                        usuario = long.Parse(Session["idusario"].ToString());
                    }
                    compra ComprouAlbum = db.compras.Where(m => m.id_produto == id && m.id_usuario == usuario && m.oque_e == "musicaAlbum").SingleOrDefault();
                    if (ComprouAlbum != null)
                    {
                        ViewBag.comprou = true;
                    }
                    else
                    {
                        ViewBag.comprou = false;
                    }

                    musicas = db.musicas.Where(o => o.id_album == id && o.inactiva==false).ToList();
                    foreach (var item in musicas)
                    {
                        MusicaViewModel model_ = new MusicaViewModel()
                        {
                            album = item.album,
                            ano = item.ano,
                            artista = item.artista,
                            caminho_capa1 = item.caminho_capa1,
                            duracao = item.duracao,
                            e_album = item.e_album,
                            formato = item.formato,
                            genero = item.genero_musical.descricao,
                            gratis = item.gratis,
                            gravadora = item.gravadora,
                            id = item.id,
                            id_artista_obra = item.id_artista_obra,
                            id_genero_musical = item.id_genero_musical,
                            link = item.link,
                            pode_baixar = item.pode_baixar,
                            preco_venda = item.preco_venda,
                            produtor = item.produtor,
                            titulo = item.titulo,
                            
                        };
                        listaMusica.Add(model_);
                    }
                    int pageSize = 10;
                    int pageNumber = (page ?? 1);
                    return View(listaMusica.ToPagedList(pageNumber, pageSize));
                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }
        public ActionResult MusicasDiversas(int? page)
        {
            List<MusicaViewModel> listaMusica = new List<MusicaViewModel>();
            try
            {


                using (var db = new mussika_bdEntities())
                {
                    ViewBag.categorias = db.genero_musical.ToList();
                    List<musica> musicas = null;

                    musicas = db.musicas.Where(m => m.e_album == false && string.IsNullOrEmpty(m.link) && m.inactiva == false).OrderByDescending(o => o.id).ToList();




                    foreach (var item in musicas)
                    {
                        MusicaViewModel model_ = new MusicaViewModel()
                        {
                            album = item.album,
                            ano = item.ano,
                            artista = item.artista_obra.nome,
                            caminho_capa1 = item.caminho_capa1,
                            duracao = item.duracao,
                            e_album = item.e_album,
                            formato = item.formato,
                            genero = item.genero_musical.descricao,
                            gratis = item.gratis,
                            gravadora = item.gravadora,
                            id = item.id,
                            id_artista_obra = item.id_artista_obra,
                            id_genero_musical = item.id_genero_musical,
                            link = item.link,
                            pode_baixar = item.pode_baixar,
                            preco_venda = item.preco_venda,
                            produtor = item.produtor,
                            titulo = item.titulo,
                        };
                        listaMusica.Add(model_);
                    }
                    int pageSize = 10;
                    int pageNumber = (page ?? 1);
                    return View(listaMusica.ToPagedList(pageNumber, pageSize));
                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }

        public ActionResult Musica(long id)
        {

            try
            {


                using (var db = new mussika_bdEntities())
                {
                    var item = db.musicas.Where(c => c.id == id).SingleOrDefault();

                    
                    long usuario =0;
                    if (Session["idusario"] != null)
                    {
                         usuario = long.Parse(Session["idusario"].ToString());
                    }
                    compra musica = db.compras.Where(m => m.id_produto == id && m.id_usuario == usuario && m.oque_e=="musica").SingleOrDefault();
                    if (musica != null)
                    {
                        ViewBag.comprou = true;
                    }
                    else
                    {
                        ViewBag.comprou = false;
                    }
                    MusicaViewModel model_ = new MusicaViewModel()
                    {
                        album = item.album,
                        ano = item.ano,
                        artista = item.artista_obra.nome,
                        caminho_capa1 = item.caminho_capa1,
                        duracao = item.duracao,
                        e_album = item.e_album,
                        formato = item.formato,
                        genero = item.genero_musical.descricao,
                        gratis = item.gratis,
                        gravadora = item.gravadora,
                        id = item.id,
                        id_artista_obra = item.id_artista_obra??0,
                        id_genero_musical = item.id_genero_musical,
                        link = item.link,
                        pode_baixar = item.pode_baixar,
                        preco_venda = item.preco_venda??0,
                        produtor = item.produtor,
                        titulo = item.titulo,
                        //distrito = item.artista_obra.distrito.nome,
                        caminho_ficheiro = item.caminho_ficheiro,

                    };



                    return View(model_);
                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
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

        public async Task<ActionResult> pagarViaMpesa(long id, string numero,decimal valor,string oque_e="musica")
        {
            try
            {
                string numero_ = numero.Replace('(', ' ');
                numero_ = numero_.Replace(')', ' ');
                numero_ = numero_.Replace('-', ' ');
                numero_ = string.Concat(numero_.Where(c => !char.IsWhiteSpace(c)));

                WebClient client = new WebClient();
                string token = client.DownloadString("https://mpesa.mussika.co.mz/index.php");

                //RestClient restClient = new RestClient("https://api.sandbox.vm.co.mz:18352");
                RestClient restClient = new RestClient("https://api.vm.co.mz:18352");
                RestRequest restRequest = new RestRequest("/ipg/v1x/c2bPayment/singleStage/", Method.POST);
                restRequest.AddHeader("Content-Type", "application/json");
                restRequest.AddHeader("Origin", "developer.mpesa.vm.co.mz");
                restRequest.AddHeader("Authorization", $"Bearer {token}");
                string ThirdPartyrefereence = RandomStringNumber();
                string TransactionReference = RandomStringNumber();
                
                
                //string dinheiro = string.Format("{0:N}", valor);
                string dinheiro =verificar_preco(id, valor,oque_e);
                if (dinheiro == "") { return Redirect("/PubMusica/PagamentoFalhou?erro=Não foi possivel processar o pagamento!"); }
                //var data = new C2B_MODEL() { input_Amount = dinheiro, input_CustomerMSISDN = numero_, input_ServiceProviderCode = "171717", input_ThirdPartyReference = ThirdPartyrefereence, input_TransactionReference = TransactionReference };
                var data = new C2B_MODEL() { input_Amount = dinheiro, input_CustomerMSISDN = numero_, input_ServiceProviderCode = "900413", input_ThirdPartyReference = ThirdPartyrefereence, input_TransactionReference = TransactionReference };
                restRequest.AddJsonBody(data);

                var response = await restClient.ExecuteAsync<MpesaResponse>(restRequest);
                if (response.IsSuccessful == true)
                {
                    MpesaResponse resposta = response.Data;
                    if (resposta.output_ResponseCode == "INS-0")
                    {
                        try
                        {
                            using (var db = new mussika_bdEntities())
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

                            };

                        }
                        catch (Exception ex)
                        {

                            return Redirect("/PubMusica/PagamentoFalhou?erro=" + ex.InnerException.Message);
                        }
                        if (oque_e == "musica")
                        {
                            return Redirect("/PubMusica/PagamentoSucesso?id_musica=" + id + "&&video=false&&accao=musica");
                        }else if(oque_e == "musicaAlbum")
                        {
                            return Redirect("/PubMusica/PagamentoSucesso?id_musica=" + id + "&&video=false&&accao=musicaAlbum");
                        }
                        else
                        {
                            return Redirect("/PubMusica/PagamentoSucesso?id_musica=" + id + "&&video=true&&accao=video");
                        }
                        
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
                using(var db=new mussika_bdEntities())
                {
                    switch (oque_e)
                    {
                        case "musica":
                            var musica = db.musicas.Where(m => m.id == id).SingleOrDefault();
                            valor_real = Math.Round((double)musica.preco_venda,2).ToString();
                            break;
                        case "musicaVideo":
                            var musicaVideo = db.musicas.Where(m => m.id == id).SingleOrDefault();
                            valor_real = Math.Round((double)musicaVideo.preco_video, 2).ToString();
                            break;
                        case "musicaAlbum":
                            var musicaAlbum = db.musica_album.Where(m => m.id == id).SingleOrDefault();
                            valor_real = Math.Round((double)musicaAlbum.preco, 2).ToString();
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

        public ActionResult OuvirAudio(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    musica item = db.musicas.Where(c => c.id == id).SingleOrDefault();
                    var artista = db.artista_obra.Where(a => a.id == item.id_artista_obra).SingleOrDefault();
                    MusicaViewModel model_ = new MusicaViewModel()
                    {
                        album = item.album,
                        ano = item.ano,
                        artista = artista.nome,
                        caminho_capa1 = item.caminho_capa1,
                        duracao = item.duracao,
                        e_album = item.e_album,
                        formato = item.formato,
                        genero = item.genero_musical.descricao,
                        gratis = item.gratis,
                        gravadora = item.gravadora,
                        id = item.id,
                        id_artista_obra = item.id_artista_obra??0,
                        id_genero_musical = item.id_genero_musical,
                        link = item.link,
                        pode_baixar = item.pode_baixar,
                        preco_venda = item.preco_venda,
                        produtor = item.produtor,
                        titulo = item.titulo,
                        //distrito = item.artista_obra.distrito.nome,
                        caminho_ficheiro = item.caminho_ficheiro,

                    };



                    return View(model_);
                }




            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
            return Redirect("/inicio/InternalServerError");
        }

        public ActionResult video(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    musica item = db.musicas.Where(c => c.id == id).SingleOrDefault();
                    long usuario = 0;
                    if (Session["idusario"] != null)
                    {
                        usuario = long.Parse(Session["idusario"].ToString());
                    }
                    compra musica = db.compras.Where(m => m.id_produto == id && m.id_usuario == usuario && m.oque_e == "musicaVideo").SingleOrDefault();
                    if (musica != null)
                    {
                        ViewBag.comprou = true;
                    }
                    else
                    {
                        ViewBag.comprou = false;
                    }
                    MusicaViewModel model_ = new MusicaViewModel()
                    {
                        album = item.album,
                        ano = item.ano,
                        artista = item.artista_obra.nome,
                        caminho_capa1 = item.caminho_capa1,
                        duracao = item.duracao,
                        e_album = item.e_album,
                        formato = item.formato,
                        genero = item.genero_musical.descricao,
                        gratis = item.gratis,
                        gravadora = item.gravadora,
                        id = item.id,
                        id_artista_obra = item.id_artista_obra??0,
                        id_genero_musical = item.id_genero_musical,
                        link = item.link,
                        pode_baixar = item.pode_baixar,
                        preco_venda = item.preco_venda,
                        preco_video=item.preco_video,
                        produtor = item.produtor,
                        titulo = item.titulo,
                        //distrito = item.artista_obra.distrito.nome,
                        caminho_ficheiro = item.caminho_ficheiro,

                    };
                    return View(model_);
                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }

        public ActionResult PagamentoSucesso(long id_musica, string accao,bool video=false)
        {
           
            switch (accao)
            {
                case "musicaAlbum":
                    ViewBag.accao = "Ver Album!";
                    break;
                case "musica":
                    ViewBag.accao = "Escutar Audio!";
                    break;
                case "video":
                    ViewBag.accao = "Assistir Video";
                    break;
                default:
                    ViewBag.accao = "Voltar";
                    break;
            }
           
            ViewBag.e_video = video;
            ViewBag.oque_fazer = accao;
            ViewBag.link = "/PubMusica/OuvirAudio?id=" + id_musica;
            ViewBag.linkVideo = "/PubMusica/AssistirVideo?idVideo=" + id_musica;
            ViewBag.linkAlbum = "/PubMusica/AlbumDetalhe?id="+id_musica;
            ViewBag.idMusica = id_musica;
            return View();
        }

        public ActionResult PagamentoFalhou(string erro)
        {
            if (erro == "FAILED")
            {
                ViewBag.erro = "Houve um erro ao processar o seu pedido, verifique se as informações fornecidas são válidas, ou contacte seu Banco. Codigo do Erro: APIPAY01";
            }
            else
            {
                ViewBag.erro = "Houve um erro ao processar o seu pedido, verifique se as informações fornecidas são válidas, ou contacte seu Banco.Codigo do Erro: APIPAY01";
            }
            
            return View();
        }
        public ActionResult comprar(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    musica item = db.musicas.Where(c => c.id == id).SingleOrDefault();
                    MusicaViewModel model_ = new MusicaViewModel()
                    {
                        album = item.album,
                        ano = item.ano,
                        artista = item.artista_obra.nome,
                        caminho_capa1 = item.caminho_capa1,
                        duracao = item.duracao,
                        e_album = item.e_album,
                        formato = item.formato,
                        genero = item.genero_musical.descricao,
                        gratis = item.gratis,
                        gravadora = item.gravadora,
                        id = item.id,
                        id_artista_obra = item.id_artista_obra??0,
                        id_genero_musical = item.id_genero_musical,
                        link = item.link,
                        pode_baixar = item.pode_baixar,
                        preco_venda = item.preco_venda,
                        produtor = item.produtor,
                        titulo = item.titulo,
                        //distrito = item.artista_obra.distrito.nome,

                    };

                    return View(model_);

                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }
        public ActionResult comprarAlbum(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    musica_album item = db.musica_album.Where(c => c.id == id).SingleOrDefault();
                    MusicaViewModel model_ = new MusicaViewModel()
                    {
                        
                        ano = item.ano_lancamento,
                        artista = item.artista_obra.nome,
                        caminho_capa1 = item.foto_capa,
                        
                        genero = item.genero_musical.descricao,
                       
                        gravadora = item.gravadora,
                        id = item.id,
                        id_artista_obra = item.id_artista ?? 0,
                        id_genero_musical = item.id_genero,
                       
                        preco_venda = item.preco,
                        produtor = item.produtor,
                        titulo = item.nome,
                        //distrito = item.artista_obra.distrito.nome,

                    };

                    return View(model_);

                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }
        public ActionResult comprarVideo(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    musica item = db.musicas.Where(c => c.id == id).SingleOrDefault();


                    MusicaViewModel model_ = new MusicaViewModel()
                    {
                        album = item.album,
                        ano = item.ano,
                        artista = item.artista,
                        caminho_capa1 = item.caminho_capa1,
                        duracao = item.duracao,
                        e_album = item.e_album,
                        formato = item.formato,
                        genero = item.genero_musical.descricao,
                        gratis = item.gratis,
                        gravadora = item.gravadora,
                        id = item.id,
                        id_artista_obra = item.id_artista_obra??0,
                        id_genero_musical = item.id_genero_musical,
                        link = item.link,
                        pode_baixar = item.pode_baixar,
                        preco_venda = item.preco_venda,
                        preco_video = item.preco_video,
                        produtor = item.produtor,
                        titulo = item.titulo,
                        //distrito = item.artista_obra.distrito.nome,

                    };

                    return View(model_);

                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }
    }
}