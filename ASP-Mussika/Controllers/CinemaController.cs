using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASP_Mussika.Models;

namespace ASP_Mussika.Controllers
{
    public class CinemaController : Controller
    {
        // GET: Cinema
        public ActionResult Index()
        {
            return View();
        }

        public List<CinemaViewModel> CinemaList()
        {
            List<CinemaViewModel> listaArtigos = new List<CinemaViewModel>();

            using (var db = new mussika_bdEntities())
            {
                var artigos = db.cinemas.OrderByDescending(P => P.id); ;


                foreach (var model in artigos)
                {
                    CinemaViewModel ProVM = new CinemaViewModel()
                    {
                        id = model.id,
                        descricao = model.descricao,
                        id_distrito = model.id_distrito ?? 0,
                        inactivo = model.inactivo ?? false,
                        localizacao = model.localizacao,
                        nome = model.nome,
                        nomeDistrito = model.distrito.nome,
                    };
                    listaArtigos.Add(ProVM);
                }
            }
            return listaArtigos;


        }

        [HttpPost]
        public ActionResult carregarTabelaCinemasByAjax(int draw, int start, int length)
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
                var produtos = CinemaList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<CinemaViewModel>;
                Func<CinemaViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome" ? c.nome :
                                           sortColumn == "nomeDistrito" ? c.nomeDistrito



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

        public ActionResult criar()
        {
            using (var db = new mussika_bdEntities())
            {

                List<distrito> distritos_ = db.distritoes.ToList();
                ViewBag.distritos = new SelectList(distritos_, "id", "nome");
                return View();
            }
        }

        public ActionResult salvar(CinemaViewModel model)
        {

            long id = 0;
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    if (model.id <= 0)
                    {
                        cinema novo = new cinema()
                        {
                            descricao = model.descricao,
                            foto_capa = "noimage.png",
                            id_distrito = model.id_distrito,
                            inactivo = model.inactivo,
                            localizacao = model.localizacao,
                            nome = model.nome,
                        };

                        db.cinemas.Add(novo);
                        db.SaveChanges();
                        id = novo.id;
                    }
                    else
                    {
                        var evento = db.cinemas.Where(e => e.id == model.id).SingleOrDefault();
                        evento.id_distrito = model.id_distrito;
                        evento.inactivo = model.inactivo;
                        evento.localizacao = model.localizacao;
                        evento.nome = model.nome;
                        evento.descricao = model.descricao;
                        db.SaveChanges();
                        id = evento.id;
                    }
                }
            }
            catch (Exception)
            {
                return Content("false");
            }
            return Content(id.ToString());
        }

        public ActionResult CarregarFotos(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var evento = db.cinemas.Where(m => m.id == id).SingleOrDefault();
                ViewBag.id = id;
                ViewBag.nome = evento.nome;
                return View(evento);
            }

        }

        public ActionResult SaveUploadedFile(CinemaViewModel model)
        {
            string isSavedSuccessfully = "";
            string fName = "";
            try
            {
                foreach (string fileName in Request.Files)
                {
                    HttpPostedFileBase file = Request.Files[fileName];
                    //Save file content goes here
                    fName = file.FileName;

                    if (file != null && file.ContentLength > 0)
                    {

                        var originalDirectory = new DirectoryInfo(string.Format("{0}Repository\\images", Server.MapPath(@"\")));

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "cinema");

                        var fileName1 = Path.GetFileName(file.FileName);
                        model.foto_capa = fileName1;
                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (verificarCinema(model))
                        {
                            if (!isExists)
                                System.IO.Directory.CreateDirectory(pathString);

                            var path = string.Format("{0}\\{1}", pathString, file.FileName);

                            //file.SaveAs(path);
                            if (reziseImage(file))
                            {
                                isSavedSuccessfully = file.FileName;
                            }

                        }
                        else
                        {
                            isSavedSuccessfully = file.FileName;
                        }


                    }

                }

            }
            catch (Exception ex)
            {
                isSavedSuccessfully = "";
            }


            if (isSavedSuccessfully != "")
            {
                return Json(new { Message = fName });
            }
            else
            {
                return Json(new { Message = "Error in saving file" });
            }
        }
        public ActionResult RemoverFotoCinema(string filename, long id)
        {
            try
            {
                if (!string.IsNullOrEmpty(filename))
                {
                    if (filename.Trim().ToLower() != "noimage.png")
                    {

                        string fullPath = Request.MapPath("~/Repository/images/cinema/" + filename);
                        if (System.IO.File.Exists(fullPath))
                        {
                            if (alterarCaminhoCinema(id))
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

        private bool alterarCaminhoCinema(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var qua = db.cinemas.Where(f => f.id == id).SingleOrDefault();
                    qua.foto_capa = "noimage.png";
                    db.SaveChanges();
                }
                return true;
            }
            catch (Exception)
            {

                return false;
            }

        }
        private bool verificarCinema(CinemaViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    cinema evento_ = db.cinemas.Where(r => r.id == model.id).SingleOrDefault();
                    if (evento_ != null)
                    {
                        evento_.foto_capa = model.foto_capa;

                        db.SaveChanges();
                        return true;
                    }

                    return true;
                }
            }
            catch (Exception)
            {

                return false;
            }
        }
        public bool reziseImage(HttpPostedFileBase fileupload)
        {
            HttpPostedFileBase fileupload1 = fileupload;
            var originalDirectory = new DirectoryInfo(string.Format("{0}Repository\\images", Server.MapPath(@"\")));
            string pathString2 = System.IO.Path.Combine(originalDirectory.ToString(), "cinema");
            string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "tempImage");
            //var fileName1 = Path.GetFileName(fileupload1.FileName);
            var path = string.Format("{0}\\{1}", pathString, fileupload1.FileName);

            fileupload1.SaveAs(path);

            System.Drawing.Image image = System.Drawing.Image.FromFile(path);

            int newwidthimg = image.Width;

            float AspectRatio = (float)image.Size.Width / (float)image.Size.Height;

            int newHeight = image.Height;

            int maxHeight = 540;
            int maxWidth = 520;

            newHeight = (newHeight * maxWidth) / newwidthimg;
            newwidthimg = maxWidth;
            if (newHeight > maxHeight)
            {
                newwidthimg = (newwidthimg * maxHeight) / newHeight;
                newHeight = maxHeight;
            }

            Bitmap bitMAP1 = new Bitmap(newwidthimg, newHeight);

            //Graphics imgGraph = Graphics.FromImage(bitMAP1);

            var thumbnailGraph = Graphics.FromImage(bitMAP1);
            thumbnailGraph.CompositingQuality = CompositingQuality.HighQuality;
            //bitMAP1.imgQuality = CompositingQuality.HighQuality;
            thumbnailGraph.SmoothingMode = SmoothingMode.HighQuality;
            //bitMAP1.SmoothingMode = SmoothingMode.HighQuality;
            thumbnailGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            //bitMAP1.InterpolationMode = InterpolationMode.HighQualityBicubic;

            var imageRectangle = new Rectangle(0, 0, newwidthimg, newHeight);

            thumbnailGraph.DrawImage(image, imageRectangle);
            //bitMAP1.DrawImage(image, imageRectangle);

            bitMAP1.Save(Server.MapPath("~/Repository/images/cinema/" + fileupload1.FileName));

            bitMAP1.Dispose();

            thumbnailGraph.Dispose();

            image.Dispose();


            string fullPath = Request.MapPath("~/Repository/images/tempImage/" + fileupload1.FileName);
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

        public ActionResult EditarEvento(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                List<distrito> distritos_ = db.distritoes.ToList();
                ViewBag.distritos = new SelectList(distritos_, "id", "nome");
                var evento = db.cinemas.Where(m => m.id == id).SingleOrDefault();

                return View(evento);
            }
        }

        public ActionResult sessoes(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var cinema = db.cinemas.Where(c => c.id == id).SingleOrDefault();
                    return View(cinema);
                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        public List<cinemaSessaoViewModel> SessaoList(long id)
        {
            List<cinemaSessaoViewModel> listaArtigos = new List<cinemaSessaoViewModel>();

            using (var db = new mussika_bdEntities())
            {
                var artigos = db.cinema_sessao.Where(s => s.id_cinema == id).OrderByDescending(P => P.id); ;


                foreach (var model in artigos)
                {
                    cinemaSessaoViewModel ProVM = new cinemaSessaoViewModel()
                    {
                        id = model.id,
                        descricao = model.descricao,
                        nome_cinema = model.cinema.nome,
                        inactivo = model.inactivo ?? false,
                        nome_filme = model.filme.titulo_original,
                        dataConvetido = model.data.Value.ToString("dd-MM-yyyy"),
                        hora = model.hora,
                    };
                    listaArtigos.Add(ProVM);
                }
            }
            return listaArtigos;


        }

        [HttpPost]
        public ActionResult carregarTabelaSessoesByAjax(int draw, int start, int length, int id)
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
                var produtos = SessaoList(id);
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {

                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<cinemaSessaoViewModel>;
                Func<cinemaSessaoViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome_filme" ? c.nome_filme :
                                          sortColumn == "hora" ? c.hora :
                                           sortColumn == "dataConvetido" ? c.dataConvetido



                                          : c.nome_filme);
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

        public ActionResult criarSessao(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var cinema = db.cinemas.Where(c => c.id == id).SingleOrDefault();
                    return View(cinema);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        public ActionResult salvarSessao(cinemaSessaoViewModel model)
        {

            long id = 0;
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    if (model.id <= 0)
                    {
                        cinema_sessao novo = new cinema_sessao()
                        {
                            descricao = model.descricao,
                            id_cinema = model.id_cinema,
                            inactivo = model.inactivo,
                            hora = model.hora,
                            data = model.data,
                            preco=model.preco,

                        };

                        db.cinema_sessao.Add(novo);
                        db.SaveChanges();
                        id = novo.id;
                    }
                    else
                    {
                        var evento = db.cinema_sessao.Where(e => e.id == model.id).SingleOrDefault();
                        evento.hora = model.hora;
                        evento.inactivo = model.inactivo;
                        evento.data = model.data;
                        evento.id_cinema = model.id_cinema;
                        evento.descricao = model.descricao;
                        evento.preco = model.preco;
                        db.SaveChanges();
                        id = evento.id;
                    }
                }
            }
            catch (Exception ex)
            {
                return Content("false");
            }
            return Content(id.ToString());
        }

        public ActionResult addFilme(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var sessao = db.cinema_sessao.Where(c => c.id == id).SingleOrDefault();
                    return View(sessao);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<FilmeViewModel> FilmeList()
        {
            List<FilmeViewModel> listaArtigos = new List<FilmeViewModel>();

            using (var db = new mussika_bdEntities())
            {
                var filmes = db.filmes.Where(f => f.inactivo == false).OrderByDescending(P => P.id); ;


                foreach (var model in filmes)
                {
                    FilmeViewModel ProVM = new FilmeViewModel()
                    {
                        id = model.id,
                        ano_producao = model.ano_producao ?? 0,
                        cor = model.cor,
                        direcao = model.direcao,
                        distribuidor = model.distribuidor,
                        elenco = model.elenco,
                        idioma = model.idioma,
                        minutos = model.minutos,
                        nacionalidade = model.nacionalidade,
                        orcamento = model.orcamento ?? 0,
                        sinopse = model.sinopse,
                        tipo_filme = model.tipo_filme,
                        titulo_original = model.titulo_original,
                    };
                    listaArtigos.Add(ProVM);
                }
            }
            return listaArtigos;


        }

        [HttpPost]
        public ActionResult carregarTabelaFimesByAjax(int draw, int start, int length)
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
                var produtos = FilmeList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.titulo_original.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<FilmeViewModel>;
                Func<FilmeViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "titulo_original" ? c.titulo_original :
                                           sortColumn == "nacionalidade" ? c.nacionalidade :
                                          sortColumn == "minutos" ? c.minutos :
                                          sortColumn == "direcao" ? c.direcao


                                          : c.titulo_original);
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

        public ActionResult VincularFilme(long id_filme, long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var sessao = db.cinema_sessao.Where(s => s.id == id).SingleOrDefault();
                    sessao.id_filme = id_filme;
                    db.SaveChanges();
                    return View("Index");
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public ActionResult EditarSessao(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var sessao = db.cinema_sessao.Where(s => s.id == id).SingleOrDefault();
                    return View(sessao);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}