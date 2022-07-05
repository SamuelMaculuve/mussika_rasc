using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASP_Mussika.Models;

namespace ASP_Mussika.Controllers
{
    public class CarteiraController : Controller
    {
        // GET: Carteira
        public ActionResult Index( long id_usuario)
        {
            List<CompraViewModel> listaItens = new List<CompraViewModel>();
            try
            {
                using(var db=new mussika_bdEntities())
                {
                    var itenss = db.carrinho_compra.Where(c => c.id_usuario == id_usuario && c.activo == true).OrderByDescending(d => d.data_cadastro);
                    ViewBag.nrCarinhoCompra = itenss.Count();
                    long id_usu = long.Parse(Session["idusario"].ToString());

                
                        
                 
                  var compras = db.compras.Where(c => c.id_usuario == id_usu);
                  ViewBag.QCompras = compras.Count();
                  decimal valorGasto = 0;
                    foreach(var item in compras) { valorGasto += (decimal)item.valor; }
                    ViewBag.dinheiroGasto = valorGasto;

                    var itens = db.compras.Where(c => c.id_usuario == id_usuario).OrderByDescending(c => c.data_cadastro).ToList();


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
                                var artista = db.artista_obra.Where(a => a.id == foto_.id_artista_obra).SingleOrDefault();
                                foto = Constants.webUrl + "/Repository/images/musica/" + foto_.caminho_capa1;
                                linkAudio = foto_.caminho_ficheiro;
                                linkMedia = foto_.link;
                                titulo = artista.nome;
                                subtitulo = foto_.titulo;
                                break;
                            case "musicaVideo":
                                var musicaVideo_foto_ = db.musicas.Where(m => m.id == item.id_produto).SingleOrDefault();
                                var artista_video = db.artista_obra.Where(a => a.id == musicaVideo_foto_.id_artista_obra).SingleOrDefault();
                                foto = Constants.webUrl + "/Repository/images/musica/" + musicaVideo_foto_.caminho_capa1;
                                linkAudio = musicaVideo_foto_.caminho_ficheiro;
                                linkMedia = musicaVideo_foto_.link;
                                titulo = artista_video.nome;
                                subtitulo = musicaVideo_foto_.titulo;
                                break;
                            case "filme":
                                var foto_filme = db.filmes.Where(m => m.id == item.id_produto).SingleOrDefault();
                                
                                foto = Constants.webUrl + "/Repository/images/cinema/" + foto_filme.foto_capa;
                                linkMedia = foto_filme.link_trailer;
                                titulo = foto_filme.titulo_original;
                                subtitulo = "Filme";
                                break;
                            case "restaurante":
                                var restaurante = db.restaurante_prato.Where(m => m.id == item.id_produto).SingleOrDefault();
                                foto = Constants.webUrl + "/Repository/images/Restaurantes/" + restaurante.foto_capa;
                                titulo = restaurante.nome;
                                subtitulo = "Prato de Restaurante";
                                break;
                            case "acomodacao":
                                var acomodacao = db.acomodacao_quarto.Where(m => m.id == item.id_produto).SingleOrDefault();
                                foto = Constants.webUrl + "/Repository/images/Acomodacoes/" + acomodacao.foto_capa??"";
                                titulo = acomodacao.descricao;
                                subtitulo = "Acomodação Quarto ";
                                break;
                            case "evento":
                                var evento = db.eventoes.Where(m => m.id == item.id_produto).SingleOrDefault();
                                foto = Constants.webUrl + "/Repository/images/eventos/" + evento.foto_capa;
                                titulo = evento.nome;
                                subtitulo = "Bilhete Evento";
                                break;
                            case "artigo":
                                var artigo = db.artigoes.Where(m => m.id == item.id_produto).SingleOrDefault();
                                foto = Constants.webUrl + "/Repository/images/artigo/" + artigo.foto_capa;
                                titulo = artigo.nome;
                                subtitulo = "Artigo do Bazar";
                                break;
                            case "loja":
                                var loja = db.loja_produto.Where(m => m.id == item.id_produto).SingleOrDefault();
                                foto = Constants.webUrl + "/Repository/images/lojas/" + loja.foto_capa;
                                titulo = loja.nome;
                                subtitulo = "Produto do loja";
                                break;
                            case "artecultura":
                                var artecultura = db.obra_arte.Where(m => m.id == item.id_produto).SingleOrDefault();
                                foto = Constants.webUrl + "/Repository/images/lojas/" + artecultura.caminho_imagem;
                                titulo = artecultura.titulo;
                                subtitulo = artecultura.autor;
                                break;
                            case "sessaoFilme":
                                var sessaoFilme = db.cinema_sessao.Where(m => m.id == item.id_produto).SingleOrDefault();
                                foto = Constants.webUrl + "/Repository/images/cinema/" + sessaoFilme.cinema.foto_capa;
                                titulo = sessaoFilme.filme.titulo_original;
                                subtitulo = "Sessão de Cinema";
                                break;
                            case "taxi":
                                var taxi = db.taxis.Where(m => m.id == item.id_produto).SingleOrDefault();
                                foto = "https://mussika.co.mz/Repository/images/diversos/taxi.jpg";
                                titulo = "Taxi";
                                subtitulo = "Transporte";
                                break;
                            case "servico":
                                //var taxi = db.taxis.Where(m => m.id == item.id_produto).SingleOrDefault();
                                foto = "https://mussika.co.mz/Repository/images/MussikaServico/mussika_pagamento.jpg";
                                titulo = "Mussika Serviços";
                                subtitulo = "Pagamento";
                                break;
                            case "clinica":
                                var clinica = db.clinicas.Where(m => m.id == item.id_produto).SingleOrDefault();
                                foto = Constants.webUrl + "/Repository/images/clinicas/" + clinica.foto_capa;
                                titulo = clinica.nome;
                                subtitulo = "Agendamento de Consulta";
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

                }
            }
            catch (Exception)
            {

                return View("InternalServerError");
            }
            return View(listaItens);
        }
    }
}