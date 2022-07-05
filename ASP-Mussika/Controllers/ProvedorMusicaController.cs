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
    public class ProvedorMusicaController : Controller
    {
        //GET: ProvedorMusica
        public ActionResult Index(int id, int? page)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<musica> itens = new List<musica>();
                    ViewBag.autor = Session["nome"].ToString();
                    ViewBag.id_artista = Session["idusario"];
                    var musicas= db.musicas.Where(q => q.id_provedor == id&& q.e_album==false && q.inactiva==false).ToList();
                    foreach (var item in musicas)
                    {
                        musica nova = new musica()
                        {
                            artista = item.artista_obra.nome,
                            id = item.id,
                            titulo = item.titulo,

                        };
                        itens.Add(nova);
                    }
                    
                    ViewBag.albuns = db.musica_album.Where(a => a.id_provedor == id).ToList();
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

        public ActionResult CriarMusica(long id, long id_artista=0,bool musica_album=false,long id_album=0)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<genero_musical> categ = db.genero_musical.ToList();
                    ViewBag.categorias = new SelectList(categ, "id", "descricao");
                    ViewBag.autor = Session["nome"].ToString();
                    ViewBag.id_provedor = Session["idusario"];
                    ViewBag.id_artista = id_artista;
                    ViewBag.musica_album = musica_album;
                    ViewBag.id_album = id_album;
                    var musicas = db.artista_obra.Where(a => a.e_musico == true).ToList();
                   
                    ViewBag.artistas = musicas;
                }
            }
            catch (Exception)
            {

                return Redirect("Error/InternalServerError");
            }
            return View();
        }

        public ActionResult Salvar(musica model,long id_album=0, bool musica_album = false)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    if (model.id <= 0)
                    {
                        model.id_provedor = long.Parse(Session["idusario"].ToString());
                        model.id_artista_obra = model.id_artista_obra;
                        model.caminho_capa1 = "noimage.png";
                        var id = db.musicas.Add(model);
                        model.gratis = false;
                        model.id_album = model.id_album == 0 ? null : model.id_album;
                        model.pode_baixar = false;
                        model.inactiva = false;
                        db.SaveChanges();

                        model.id = id.id;
                        
                    }
                    else
                    {
                        var musica = db.musicas.Where(m => m.id == model.id).SingleOrDefault();
                        musica.gratis = false;
                        musica.gravadora = model.gravadora;
                        //musica.id_provedor = model.id_artista_obra;
                        musica.id_genero_musical = model.id_genero_musical;
                        musica.link = model.link;
                        musica.pode_baixar = false;
                        musica.preco_venda = model.preco_venda;
                        musica.preco_video = model.preco_video;
                        musica.produtor = model.produtor;
                        musica.titulo = model.titulo;
                        musica.album = model.album;
                        musica.ano = model.ano;
                        musica.artista = model.artista;
                        musica.duracao = model.duracao;
                        musica.e_album = model.e_album;
                        musica.formato = model.formato;
                        //musica.inactiva = model.inactiva ?? false;

                        db.SaveChanges();
                        model.id = musica.id;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException.Message);
                return Content("false");
            }
            return Content(model.id.ToString());
        }

        public ActionResult desactivarMusica(long id)
        {
            try
            {
                using (var db=new mussika_bdEntities())
                {
                    var musica = db.musicas.Where(m => m.id == id).SingleOrDefault();
                    musica.inactiva = true;
                    db.SaveChanges();
                }
                return Redirect("~/ProvedorMusica/Index?id="+Session["idusario"]);
            }
            catch (Exception)
            {

                return Redirect("~/Error/InternalServerError");
            }
        }

        public ActionResult desactivarMusicaAlbum(long id)
        {
            try
            {
                long id_album = 0;
                using (var db = new mussika_bdEntities())
                {
                    var musica = db.musicas.Where(m => m.id == id).SingleOrDefault();
                    musica.inactiva = true;
                    id_album = musica.id_album??0;
                    db.SaveChanges();
                }
                return Redirect("~/ProvedorMusica/VincularMusicas?id=" + id_album);
            }
            catch (Exception)
            {

                return Redirect("~/Error/InternalServerError");
            }
        }
        public ActionResult CarregarFotos(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var musica = db.musicas.Where(m => m.id == id).SingleOrDefault();
                ViewBag.id = id;
                ViewBag.nome = musica.artista_obra.nome;
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

        [HttpPost]
        public ActionResult UploadAudio(HttpPostedFileBase fileupload,long id)
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
                    string novo_nome = "musica_" + id_musica + DateTime.Now.ToString("ddMMyyyyHHmm") + ".mp3";
                    RemoverAudioMusica(musica.caminho_ficheiro, id_musica);
                    musica.caminho_ficheiro = novo_nome;

                    fileupload.SaveAs(Server.MapPath("~/Repository/Audio/" + novo_nome));
                    db.SaveChanges();
                }



            }
            return Redirect("~/ProvedorMusica/CarregarVideo?id=" + id_musica);
        }

        public ActionResult UploadMusica(long id)
        {
            using (var db = new mussika_bdEntities())
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

        public ActionResult EditarMusica(long id, bool musica_album = false, long id_album = 0)
        {
            using (var db = new mussika_bdEntities())
            {
                List<genero_musical> categ = db.genero_musical.ToList();
                ViewBag.categorias = new SelectList(categ, "id", "descricao");
                var musica = db.musicas.Where(m => m.id == id).SingleOrDefault();
                ViewBag.autor = musica.artista_obra.nome;
                ViewBag.autor_id = musica.artista_obra.id;
                ViewBag.id_provedor = Session["idusario"];
                ViewBag.id_album = id_album;
                ViewBag.musica_album = musica_album;
                return View(musica);
            }
        }
        public ActionResult CarregarVideo(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var musica = db.musicas.Where(m => m.id == id).SingleOrDefault();
                TempData["idmusica"] = musica.id;
                ViewBag.autor = musica.artista_obra.nome;
                return View(musica);
            }
        }

        public ActionResult SaveVideo(RestViewModel model)
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

                        var originalDirectory = new DirectoryInfo(string.Format("{0}Repository\\", Server.MapPath(@"\")));

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "video");

                        var fileName1 = Path.GetFileName(file.FileName);
                        model.foto_capa = fileName1;
                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (verificarVideo(model))
                        {
                            if (!isExists)
                                System.IO.Directory.CreateDirectory(pathString);

                            var path = string.Format("{0}\\{1}", pathString, file.FileName);

                            file.SaveAs(path);
                          

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

        private bool verificarVideo(RestViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var muica_ = db.musicas.Where(r => r.id == model.id).SingleOrDefault();
                 
                        if (!string.IsNullOrEmpty(muica_.link))
                        {
                            string fullPath = Request.MapPath("~/Repository/video/" + muica_.link);
                            if (System.IO.File.Exists(fullPath))
                            {
                                if (alterarCaminhoVideo(muica_.id))
                                {
                                    System.IO.File.Delete(fullPath);
                                }

                            }

                        }
                        muica_.link = model.foto_capa;

                        db.SaveChanges();
                        return true;
                    

                    return true;
                }
            }
            catch (Exception)
            {

                return false;
            }
        }

        private bool alterarCaminhoVideo(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var qua = db.musicas.Where(f => f.id == id).SingleOrDefault();
                    qua.link = "";
                    db.SaveChanges();
                }
                return true;
            }
            catch (Exception)
            {

                return false;
            }

        }

        public ActionResult CriarAlbum(long id_artista = 0)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<genero_musical> categ = db.genero_musical.ToList();
                    ViewBag.categorias = new SelectList(categ, "id", "descricao");
                    ViewBag.autor = Session["nome"].ToString();
                    ViewBag.id_provedor = Session["idusario"];
                    ViewBag.id_artista = id_artista;
                    var musicas = db.artista_obra.Where(a => a.e_musico == true).ToList();
                    ViewBag.artistas = musicas;
                }
            }
            catch (Exception)
            {

                return Redirect("Error/InternalServerError");
            }
            return View();
        }
        public ActionResult EditarAlbum(long id_album)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<genero_musical> categ = db.genero_musical.ToList();
                    ViewBag.categorias = new SelectList(categ, "id", "descricao");
                    ViewBag.autor = Session["nome"].ToString();
                    ViewBag.id_provedor = Session["idusario"];
                   
                    var musicas = db.artista_obra.Where(a => a.e_musico == true).ToList();
                    ViewBag.artistas = musicas;
                    var album = db.musica_album.Where(a => a.id == id_album).SingleOrDefault();
                    return View(album);
                }
            }
            catch (Exception)
            {

                return Redirect("Error/InternalServerError");
            }
          
        }

        public ActionResult SalvarAlbum(musica_album model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    if (model.id <= 0)
                    {
                        model.id_provedor = long.Parse(Session["idusario"].ToString());
                        model.id_artista = model.id_artista;
                        model.foto_capa = "noimage.png";
                        model.inactivo = false;
                        model.data_cadastro = DateTime.Now;
                        model.data_cadastro = DateTime.Now;
                        var id = db.musica_album.Add(model);
                        db.SaveChanges();

                        model.id = id.id;
                    }
                    else
                    {
                        var musica = db.musica_album.Where(m => m.id == model.id).SingleOrDefault();
                        musica.inactivo = false;
                        musica.gravadora = model.gravadora;                        
                        musica.id_genero = model.id_genero;
                        musica.preco = model.preco;
                        musica.produtor = model.produtor;
                        musica.nome = model.nome;
                        musica.ano_lancamento = model.ano_lancamento;
                        musica.quantidade_musicas = model.quantidade_musicas;
                        

                        db.SaveChanges();
                        model.id = musica.id;
                    }
                }
            }
            catch (Exception ex)
            {

                return Content("false");
            }
            return Content(model.id.ToString());
        }

        public ActionResult carregarFotoAlbum(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var musica = db.musica_album.Where(m => m.id == id).SingleOrDefault();
                ViewBag.id = id;
                ViewBag.nome = musica.nome;
                return View(musica);
            }

        }

        public ActionResult SaveUploadedFileAlbum(RestViewModel model)
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

                        if (verificarCapaAlbum(model))
                        {
                            if (!isExists)
                                System.IO.Directory.CreateDirectory(pathString);

                            var path = string.Format("{0}\\{1}", pathString, file.FileName);

                            //file.SaveAs(path);
                            if (reziseImageAlbum(file))
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
        public ActionResult RemoverFotoAlbum(string filename, long id)
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
                            if (alterarCaminhoAlbum(id))
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

        private bool alterarCaminhoAlbum(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var qua = db.musica_album.Where(f => f.id == id).SingleOrDefault();
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
        private bool verificarCapaAlbum(RestViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    musica_album muica_ = db.musica_album.Where(r => r.id == model.id).SingleOrDefault();
                    if (muica_ != null)
                    {
                        muica_.foto_capa = model.foto_capa;

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
        public bool reziseImageAlbum(HttpPostedFileBase fileupload)
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

        public ActionResult VincularMusicas(long id, int? page)
        {
            using (var db = new mussika_bdEntities())
            {
                List<musica> itens = null;
                var album = db.musica_album.Where(m => m.id == id).SingleOrDefault();
                ViewBag.id = id;
                ViewBag.nome = album.nome;
                ViewBag.id_artista = album.id_artista;
                ViewBag.id_album = album.id;

                itens = db.musicas.Where(q => q.id_album == id&&q.inactiva==false).ToList();
                int pageSize = 10;
                int pageNumber = (page ?? 1);
                return View(itens.ToPagedList(pageNumber, pageSize));
            }
        }
    }
}