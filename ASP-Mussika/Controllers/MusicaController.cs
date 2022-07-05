using ASP_Mussika.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class MusicaController : Controller
    {
        // GET: Musica
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult gestao(string layout = "_LayoutAdmin")
        {
            ViewBag.layout = layout;
            return View();
        }
        public ActionResult CriarAutor(string layout= "_LayoutAdmin", long id_provedor=0,string accao="musica")
        {
            using (var db = new mussika_bdEntities())
            {
                List<distrito> distritos_ = db.distritoes.ToList();
                ViewBag.distritos = new SelectList(distritos_, "id", "nome");
                ViewBag.layout = layout;
                ViewBag.accao = accao;
            };
            return View();

        }

        public ActionResult SalvarAutor(AutorArteViewModel model)
        {
            try
            {
                long id_Autor = 0;
                using (var db = new mussika_bdEntities())
                {
                    var autor = db.artista_obra.Where(a => a.nome.Trim().ToLower() == model.nome.Trim().ToLower()).SingleOrDefault();
                    if (autor != null)
                    {
                        return Content("existe");
                    }
                    artista_obra nova = new artista_obra()
                    {
                        descricao = model.descricao,
                        id_distrito = model.id_distrito,
                        fotografia = model.fotografia,
                        nome = model.nome,
                        telefone = model.telefone,
                        e_musico = true,
                    };
                    if(model.layout== "_LayoutProvedor") { long id_usuario = long.Parse(Session["idusario"].ToString()); nova.id_provedor = id_usuario; }
                    db.artista_obra.Add(nova);
                    db.SaveChanges();
                    id_Autor = nova.id;

                    if (!checkFotoCapa(model.fotografia))
                    {
                        nova.fotografia = "noimage.png";
                        db.SaveChanges();
                    }
                }
                return Content(id_Autor.ToString());
            }
            catch (Exception)
            {

                return Content("false");
            }
        }
        private bool checkFotoCapa(string fileName)
        {
            try
            {
                var originalDirectory = new DirectoryInfo(string.Format("{0}Repository\\images", Server.MapPath(@"\")));
                string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "tempImage");
                var path = string.Format("{0}\\{1}", pathString, fileName);

                System.Drawing.Image image = System.Drawing.Image.FromFile(path);

                int newwidthimg = image.Width;

                float AspectRatio = (float)image.Size.Width / (float)image.Size.Height;

                int newHeight = image.Height;

                int maxHeight = 240;
                int maxWidth = 320;

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

                bitMAP1.Save(Server.MapPath("~/Repository/images/ArteCultura/" + fileName));

                bitMAP1.Dispose();

                thumbnailGraph.Dispose();

                image.Dispose();


                string fullPath = Request.MapPath("~/Repository/images/tempImage/" + fileName);
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
            catch (Exception)
            {
                return false;

            }
        }

        public List<AutorArteViewModel> AutorList()
        {
            List<AutorArteViewModel> listaAutores = new List<AutorArteViewModel>();

            using (var db = new mussika_bdEntities())
            {
                var autores = db.artista_obra.Where(a => a.e_musico == true).OrderByDescending(P => P.id); ;


                foreach (var model in autores)
                {
                    AutorArteViewModel ProVM = new AutorArteViewModel()
                    {
                        id_distrito = (int)model.id_distrito,
                        nome = model.nome,
                        id = model.id,
                        NomeDistrito = model.distrito.nome,
                        fotografia = model.fotografia,
                        telefone = model.telefone,
                    };
                    listaAutores.Add(ProVM);
                }
            }
            return listaAutores;


        }

        public List<AutorArteViewModel> AutorListProvedor()
        {
            List<AutorArteViewModel> listaAutores = new List<AutorArteViewModel>();

            using (var db = new mussika_bdEntities())
            {
                long id_usuario = long.Parse(Session["idusario"].ToString());
                var autores = db.artista_obra.Where(a => a.e_musico == true && a.id_provedor==id_usuario).OrderByDescending(P => P.id); ;
                //var musicas = db.musicas.Where(c => c.id_provedor == id_usuario);

                //List<artista_obra> listaArtistaObra = new List<artista_obra>();
                //foreach (var item in musicas) { listaArtistaObra.Add(item.artista_obra); }
                //listaArtistaObra.Distinct();

                foreach (var model in autores)
                {
                    AutorArteViewModel ProVM = new AutorArteViewModel()
                    {
                        id_distrito = (int)model.id_distrito,
                        nome = model.nome,
                        id = model.id,
                        NomeDistrito = model.distrito.nome,
                        fotografia = model.fotografia,
                        telefone = model.telefone,
                    };
                    listaAutores.Add(ProVM);
                }
            }
            return listaAutores;


        }

        [HttpPost]
        public ActionResult carregarTabelaAutoresByAjax(int draw, int start, int length)
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
                var produtos = AutorList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<AutorArteViewModel>;
                Func<AutorArteViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome" ? c.nome :
                                          sortColumn == "NomeDistrito" ? c.NomeDistrito :
                                          sortColumn == "telefone" ? c.telefone.ToString()


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
        public ActionResult carregarTabelaAutoresByAjaxProvedor(int draw, int start, int length)
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
                var produtos = AutorListProvedor();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<AutorArteViewModel>;
                Func<AutorArteViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome" ? c.nome :
                                          sortColumn == "NomeDistrito" ? c.NomeDistrito :
                                          sortColumn == "telefone" ? c.telefone.ToString()


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

        public ActionResult EditarAutor(long id, string layout= "_LayoutAdmin")
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var autor = db.artista_obra.Where(a => a.id == id).SingleOrDefault();
                    List<distrito> distritos_ = db.distritoes.ToList();
                    ViewBag.distritos = new SelectList(distritos_, "id", "nome");
                    ViewBag.layout = layout;
                    return View(autor);


                }
            }
            catch (Exception)
            {

                return Redirect("/Error/InternalServerError");
            }
        }
        public ActionResult salvarAlteracoes(AutorArteViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var autor = db.artista_obra.Where(a => a.id == model.id).SingleOrDefault();
                    autor.telefone = model.telefone;
                    autor.nome = model.nome;
                    autor.id_distrito = model.id_distrito;
                    autor.descricao = model.descricao;


                    if (autor.fotografia != model.fotografia)
                    {
                        if (!checkFotoCapa(model.fotografia))
                        {
                            autor.fotografia = "noimage.png";
                            db.SaveChanges();
                        }
                        else
                        {
                            autor.fotografia = model.fotografia;
                            db.SaveChanges();
                        }
                    }
                    db.SaveChanges();



                }
                return Content(model.id.ToString());
            }
            catch (Exception)
            {

                return Content("false");
            }
        }

        public ActionResult Musicas(int id, int? page)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<musica> itens = null;
                    ViewBag.autor = db.artista_obra.Where(p => p.id == id).SingleOrDefault();
                    ViewBag.id_artista = id;
                    itens = db.musicas.Where(q => q.id_artista_obra == id).ToList();
                    int pageSize = 3;
                    int pageNumber = (page ?? 1);
                    return View(itens.ToPagedList(pageNumber, pageSize));

                }
            }
            catch (Exception)
            {

                return Redirect("/Error/InternalServerError");
            }
        }

        public ActionResult CriarMusica(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<genero_musical> categ = db.genero_musical.ToList();
                    ViewBag.categorias = new SelectList(categ, "id", "descricao");
                    ViewBag.autor = db.artista_obra.Where(a => a.id == id).SingleOrDefault();
                }
            }
            catch (Exception)
            {

                return Redirect("Error/InternalServerError");
            }
            return View();
        }

        public ActionResult Salvar(musica model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    if (model.id <= 0)
                    {
                        model.caminho_capa1 = "noimage.png";
                        var id = db.musicas.Add(model);
                        model.gratis = false;
                        model.pode_baixar = false;
                        db.SaveChanges();

                        model.id = id.id;
                    }
                    else
                    {
                        var musica = db.musicas.Where(m => m.id == model.id).SingleOrDefault();
                        musica.gratis = false;
                        musica.gravadora = model.gravadora;
                        musica.id_artista_obra = model.id_artista_obra;
                        musica.id_genero_musical = model.id_genero_musical;
                        musica.link = model.link;
                        musica.pode_baixar = false;
                        musica.preco_venda = model.preco_venda;
                        musica.produtor = model.produtor;
                        musica.titulo = model.titulo;
                        musica.album = model.album;
                        musica.ano = model.ano;
                        musica.artista = model.artista;
                        musica.duracao = model.duracao;
                        musica.e_album = model.e_album;
                        musica.formato = model.formato;

                        db.SaveChanges();
                        model.id = musica.id;
                    }
                }
            }
            catch (Exception)
            {

                return Content("false");
            }
            return Content(model.id.ToString());
        }

        public ActionResult CarregarFotos(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var musica = db.musicas.Where(m => m.id == id).SingleOrDefault();
                ViewBag.id = id;
                ViewBag.nome = musica.artista;
                return View(musica);
            }
            
        }

        public ActionResult SaveUploadedFile(RestViewModel model)
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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "musica");

                        var fileName1 = Path.GetFileName(file.FileName);
                        model.foto_capa = fileName1;
                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (verificarMusica(model))
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
        public ActionResult RemoverFotoMusica(string filename, long id)
        {
            try
            {
                if (!string.IsNullOrEmpty(filename))
                {
                    if (filename.Trim().ToLower() != "noimage.png")
                    {
                       

                        string fullPath = Request.MapPath("~/Repository/images/musica/" + filename);
                        if (System.IO.File.Exists(fullPath))
                        {
                            if (alterarCaminhoMusica(id))
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

        private bool alterarCaminhoMusica(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var qua = db.musicas.Where(f => f.id == id).SingleOrDefault();
                    qua.caminho_capa1 = "noimage.png";
                    db.SaveChanges();
                }
                return true;
            }
            catch (Exception)
            {

                return false;
            }

        }
        private bool verificarMusica(RestViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    musica muica_ = db.musicas.Where(r => r.id == model.id).SingleOrDefault();
                    if (muica_ != null)
                    {
                        muica_.caminho_capa1 = model.foto_capa;

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
            string pathString2 = System.IO.Path.Combine(originalDirectory.ToString(), "musica");
            string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "tempImage");
            //var fileName1 = Path.GetFileName(fileupload1.FileName);
            var path = string.Format("{0}\\{1}", pathString, fileupload1.FileName);

            fileupload1.SaveAs(path);

            System.Drawing.Image image = System.Drawing.Image.FromFile(path);

            int newwidthimg = image.Width;

            float AspectRatio = (float)image.Size.Width / (float)image.Size.Height;

            int newHeight = image.Height;

            int maxHeight = 240;
            int maxWidth = 320;

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

            bitMAP1.Save(Server.MapPath("~/Repository/images/musica/" + fileupload1.FileName));

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

        public ActionResult EditarMusica(long id)
        {
            using(var db=new mussika_bdEntities())
            {
                List<genero_musical> categ = db.genero_musical.ToList();
                ViewBag.categorias = new SelectList(categ, "id", "descricao");               
                var musica = db.musicas.Where(m => m.id == id).SingleOrDefault();
                ViewBag.autor = db.artista_obra.Where(a => a.id == musica.id_artista_obra).SingleOrDefault();
                return View(musica);
            }
        }

        [HttpPost]
        public ActionResult UploadAudio(HttpPostedFileBase fileupload, long id)
        {
            long id_musica = 0;
            if (TempData.ContainsKey("idmusica"))
                id_musica = id;
            if (fileupload != null)
            {
               
                using (var db = new mussika_bdEntities())
                {
                    string fileName = Path.GetFileName(fileupload.FileName);
                    int fileSize = fileupload.ContentLength;
                    int Size = fileSize / 1000000;
                    fileName = fileName.Replace(" ", "");
                    fileName = fileName.Trim();
                    var musica = db.musicas.Where(m => m.id == id_musica).SingleOrDefault();
                    string novo_nome = "musica_" + id_musica + DateTime.Now.ToString("ddMMyyyyHHmm") + fileName;
                    RemoverAudioMusica(musica.caminho_ficheiro, id_musica);
                    musica.caminho_ficheiro = novo_nome;

                    fileupload.SaveAs(Server.MapPath("~/Repository/Audio/" + novo_nome));
                    db.SaveChanges();
                }
                

               
            }
            return Redirect("~/Musica/CarregarFotos?id="+id_musica);
        }

        public ActionResult UploadMusica(long id)
        {
            using(var db=new mussika_bdEntities())
            {
                List<genero_musical> categ = db.genero_musical.ToList();
                ViewBag.categorias = new SelectList(categ, "id", "descricao");               
                var musica = db.musicas.Where(m => m.id == id).SingleOrDefault();
                TempData["idmusica"] = musica.id;
                ViewBag.autor = db.artista_obra.Where(a => a.id == musica.id_artista_obra).SingleOrDefault();
                return View(musica);
            }
        }

        public ActionResult RemoverAudioMusica(string filename, long id)
        {
            try
            {
                if (!string.IsNullOrEmpty(filename))
                {
                    if (filename.Trim().ToLower() != "")
                    {


                        string fullPath = Request.MapPath("~/Repository/Audio/" + filename);
                        if (System.IO.File.Exists(fullPath))
                        {
                            if (alterarCaminhoAudio(id))
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

        private bool alterarCaminhoAudio(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var qua = db.musicas.Where(f => f.id == id).SingleOrDefault();
                    qua.caminho_ficheiro = "";
                    db.SaveChanges();
                }
                return true;
            }
            catch (Exception)
            {

                return false;
            }

        }
    }
}