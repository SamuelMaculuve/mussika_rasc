using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using ASP_Mussika.Models;
using PagedList;

namespace ASP_Mussika.Controllers
{
    public class arte_culturaController : Controller
    {
        // GET: arte_cultura
        public ActionResult listagem(int? page, int categoria = 0, int id = 0)
        {
            List<arteCulturaViewModel> model = new List<arteCulturaViewModel>();
            try
            {

                using (var db = new mussika_bdEntities())
                {
                    ViewBag.categoria = categoria;
                    ViewBag.id_artista = id;
                    ViewBag.categorias = db.categoria_obra_arte.ToList();
                    List<obra_arte> obras = null;
                    if (categoria != 0)
                    {
                        obras = db.obra_arte.Where(o => o.id_categoria_obra == categoria && o.id_artista_obra == id).ToList();
                    }
                    else
                    {
                        obras = db.obra_arte.Where(o => o.id_artista_obra == id).ToList();
                    }

                    foreach (var item in obras)
                    {
                        arteCulturaViewModel model_ = new arteCulturaViewModel()
                        {
                            autor = item.artista_obra.nome,
                            autoria_producao = item.autoria_producao,
                            caminho_imagem = item.caminho_imagem,
                            dimensoes = item.dimensoes,
                            fotografo = item.fotografo,
                            id = item.id,
                            id_artista_obra = (long)item.id_artista_obra,
                            id_categoria_obra = (int)item.id_categoria_obra,
                            nome_categoria_obra = item.categoria_obra_arte.descricao,
                            informacao_tecnica = item.informacao_tecnica,
                            materia = item.materia,
                            proprietario = item.proprietario,
                            suporte = item.suporte,
                            tecnica = item.tecnica,
                            titulo = item.titulo,
                            nome_distrito = item.artista_obra.distrito.nome,
                            preco_venda=item.preco_venda??0,
                            ano=item.ano,



                        };
                        if (item.informacao_tecnica != null)
                        {
                            if (item.informacao_tecnica.Length > 100) { model_.informacao_tecnica = item.informacao_tecnica.Substring(0, 200); } else { model_.informacao_tecnica = item.informacao_tecnica; }
                        }
                        model.Add(model_);

                    }
                }
            }
            catch (Exception)
            {

                return Redirect("/Error/InternalServerError");
            }
            int pageSize = 3;
            int pageNumber = (page ?? 1);
            return View(model.ToPagedList(pageNumber, pageSize));

        }

        public ActionResult Perfil(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var item = db.obra_arte.Where(a => a.id == id).SingleOrDefault();
                    arteCulturaViewModel model_ = new arteCulturaViewModel()
                    {
                        autor = item.artista_obra.nome,
                        autoria_producao = item.autoria_producao,
                        caminho_imagem = item.caminho_imagem,
                        dimensoes = item.dimensoes,
                        fotografo = item.fotografo,
                        id = item.id,
                        id_artista_obra = item.id_artista_obra??0,
                        id_categoria_obra = item.id_categoria_obra??0,
                        nome_categoria_obra = item.categoria_obra_arte.descricao,
                        informacao_tecnica = item.informacao_tecnica,
                        materia = item.materia,
                        proprietario = item.proprietario,
                        suporte = item.suporte,
                        tecnica = item.tecnica,
                        titulo = item.titulo,
                        nome_distrito = item.artista_obra.distrito.nome,
                        preco_venda=item.preco_venda??0,

                    };
                   
                    List<obra_arte_imagem> imagens_ = db.obra_arte_imagem.Where(f => f.id_obra_arte == id).ToList();
                    ViewBag.imagens = imagens_;

                    long usuario = 0;
                    if (Session["idusario"] != null)
                    {
                        usuario = long.Parse(Session["idusario"].ToString());
                    }
                    compra obra = db.compras.Where(m => m.id_produto == id && m.id_usuario == usuario && m.oque_e == "arteCultura").SingleOrDefault();
                    if (obra != null)
                    {
                        ViewBag.comprou = true;
                    }
                    else
                    {
                        ViewBag.comprou = false;
                    }
                    ViewBag.artigos_similares = db.obra_arte.Where(a => a.id_categoria_obra == item.id_categoria_obra).Take(10).ToList();
                    return View(model_);
                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }

        public ActionResult comprar(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var item = db.obra_arte.Where(a => a.id == id).SingleOrDefault();
                    arteCulturaViewModel model_ = new arteCulturaViewModel()
                    {
                        autor = item.artista_obra.nome,
                        autoria_producao = item.autoria_producao,
                        caminho_imagem = item.caminho_imagem,
                        dimensoes = item.dimensoes,
                        fotografo = item.fotografo,
                        id = item.id,
                        id_artista_obra = (long)item.id_artista_obra,
                        id_categoria_obra = (int)item.id_categoria_obra,
                        nome_categoria_obra = item.categoria_obra_arte.descricao,
                        informacao_tecnica = item.informacao_tecnica,
                        materia = item.materia,
                        proprietario = item.proprietario,
                        suporte = item.suporte,
                        tecnica = item.tecnica,
                        titulo = item.titulo,
                        nome_distrito = item.artista_obra.distrito.nome,


                    };

                    return View(model_);

                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }

        public ActionResult Artistas(int? page, string filtro = "", int categoria = 0)
        {
            List<artista_obra> cantores = new List<artista_obra>();
            ViewBag.filtro = filtro;
            ViewBag.categoria = categoria;
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    ViewBag.categorias = db.categoria_obra_arte.ToList();

                    if (string.IsNullOrEmpty(filtro))
                    {
                        if (categoria > 0)
                        {
                            var obra_arte = db.obra_arte.Where(h => h.id_categoria_obra == categoria).ToList();
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
                            cantores = db.artista_obra.Where(c => c.e_musico == false).ToList();
                        }

                    }
                    else
                    {
                        if (categoria != 0)
                        {
                            var obra_arte = db.obra_arte.Where(h => h.id_categoria_obra == categoria).ToList();
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
                            cantores = db.artista_obra.Where(h =>  h.nome.Trim().ToLower().Contains(filtro.Trim().ToLower())).ToList();
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

        public ActionResult gestao()
        {
            return View();
        }

        public ActionResult CriarAutor()
        {
            using (var db = new mussika_bdEntities())
            {
                List<distrito> distritos_ = db.distritoes.ToList();
                ViewBag.distritos = new SelectList(distritos_, "id", "nome");

            };
            return View();

        }

        public ActionResult SaveUploadedFileAutor(AutorArteViewModel model)
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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "tempImage");

                        var fileName1 = Path.GetFileName(file.FileName);
                        model.fotografia = fileName1;
                        bool isExists = System.IO.Directory.Exists(pathString);


                        if (!isExists)
                        {
                            System.IO.Directory.CreateDirectory(pathString);
                            var path = string.Format("{0}\\{1}", pathString, file.FileName);

                            file.SaveAs(path);
                            isSavedSuccessfully = file.FileName;
                        }
                        else
                        {
                            var path = string.Format("{0}\\{1}", pathString, file.FileName);

                            file.SaveAs(path);
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

        public ActionResult RemoverFotoTempAutor(string filename, long id)
        {
            try
            {
                if (!string.IsNullOrEmpty(filename))
                {
                    if (filename.Trim().ToLower() != "noimage.png")
                    {

                        string fullPath = Request.MapPath("~/Repository/images/tempImage/" + filename);
                        if (System.IO.File.Exists(fullPath))
                        {

                            System.IO.File.Delete(fullPath);

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
        public ActionResult RemoverFotoAutor(string filename, long id)
        {
            try
            {
                if (!string.IsNullOrEmpty(filename))
                {
                    if (filename.Trim().ToLower() != "noimage.png")
                    {
                        string fullPath2 = Request.MapPath("~/Repository/images/tempImage/" + filename);
                        if (System.IO.File.Exists(fullPath2))
                        {

                            System.IO.File.Delete(fullPath2);

                        }
                        string fullPath = Request.MapPath("~/Repository/images/ArteCultura/" + filename);
                        if (System.IO.File.Exists(fullPath))
                        {

                            System.IO.File.Delete(fullPath);
                            alterarCaminhoFotoAutor(id);



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
        private bool alterarCaminhoFotoAutor(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var qua = db.artista_obra.Where(f => f.id == id).SingleOrDefault();
                    qua.fotografia = "noimage.png";
                    db.SaveChanges();
                }
                return true;
            }
            catch (Exception)
            {

                return false;
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
                    long usuario = long.Parse(Session["idusario"].ToString());
                    string userTipo = Session["tipo"].ToString();
                    artista_obra nova = new artista_obra()
                    {
                        descricao = model.descricao,
                        id_distrito = model.id_distrito,
                        fotografia = model.fotografia,
                        nome = model.nome,
                        telefone = model.telefone,
                        e_musico = false,
                    };
                    if (userTipo == "4")
                    {
                        nova.id_provedor = usuario;
                    }
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

        public List<AutorArteViewModel> AutorList()
        {
            List<AutorArteViewModel> listaAutores = new List<AutorArteViewModel>();

            using (var db = new mussika_bdEntities())
            {
                var autores = db.artista_obra.Where(a => a.e_musico == false).OrderByDescending(P => P.id); ;


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

        public ActionResult EditarAutor(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var autor = db.artista_obra.Where(a => a.id == id).SingleOrDefault();
                    List<distrito> distritos_ = db.distritoes.ToList();
                    ViewBag.distritos = new SelectList(distritos_, "id", "nome");
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

        public ActionResult Obras(int id, int? page)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<obra_arte> itens = null;
                    ViewBag.autor = db.artista_obra.Where(p => p.id == id).SingleOrDefault();
                    ViewBag.id_autor = id;
                    itens = db.obra_arte.Where(q => q.id_artista_obra == id).ToList();
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

        public ActionResult criarObra(long id)
        {

            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<categoria_obra_arte> categ = db.categoria_obra_arte.ToList();
                    ViewBag.categorias = new SelectList(categ, "id", "descricao");
                    ViewBag.autor = db.artista_obra.Where(a => a.id == id).SingleOrDefault();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return View();
        }

        public bool reziseImage(HttpPostedFileBase fileupload)
        {
            HttpPostedFileBase fileupload1 = fileupload;
            var originalDirectory = new DirectoryInfo(string.Format("{0}Repository\\images", Server.MapPath(@"\")));
            string pathString2 = System.IO.Path.Combine(originalDirectory.ToString(), "ArteCultura");
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

            bitMAP1.Save(Server.MapPath("~/Repository/images/ArteCultura/" + fileupload1.FileName));

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
        public ActionResult SaveUploadedFile(obra_arte model)
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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "ArteCultura");

                        var fileName1 = Path.GetFileName(file.FileName);
                        model.caminho_imagem = fileName1;
                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (verificarObra(model))
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

        private bool verificarObra(obra_arte model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    obra_arte arte = db.obra_arte.Where(r => r.id == model.id).SingleOrDefault();
                    if (arte != null)
                    {
                        arte.caminho_imagem = model.caminho_imagem;

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

        public ActionResult SalvarObra(arteCulturaViewModel model)
        {
            long id = 0;
            long id_provedor = long.Parse(Session["idusario"].ToString());
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    obra_arte nova = new obra_arte()
                    {
                        autor = model.autor,
                        autoria_producao = model.autoria_producao,
                        dimensoes = model.dimensoes,
                        fotografo = model.fotografo,
                        id_artista_obra = model.id_artista_obra,
                        id_categoria_obra = model.id_categoria_obra,
                        id_provedor = id_provedor,
                        informacao_tecnica = model.informacao_tecnica,
                        materia = model.materia,
                        preco_venda = model.preco_venda,
                        proprietario = model.proprietario,
                        suporte = model.suporte,
                        tecnica = model.tecnica,
                        titulo = model.titulo,
                        ano = model.ano,
                        peso=model.peso,



                    };
                    if (model.id <= 0)
                    {

                        nova.caminho_imagem = "noimage.png";
                       
                        var obra_ = db.obra_arte.Add(nova);
                        db.SaveChanges();

                        id = obra_.id;
                    }
                    else
                    {
                        var obra = db.obra_arte.Where(o => o.id == model.id).SingleOrDefault();
                        obra.id_categoria_obra = model.id_categoria_obra;
                        obra.autor = model.autor;
                        obra.autoria_producao = model.autoria_producao;
                        obra.dimensoes = model.dimensoes;
                        obra.informacao_tecnica = model.informacao_tecnica;
                        obra.materia = model.materia;
                        obra.preco_venda = model.preco_venda;
                        obra.proprietario = model.proprietario;
                        obra.suporte = model.suporte;
                        obra.tecnica = model.tecnica;
                        obra.titulo = model.titulo;
                        obra.ano = model.ano;
                        obra.peso = model.peso;

                        db.SaveChanges();
                        id = obra.id;

                    }
                }
            }
            catch (Exception)
            {

                return Content("false");
            }
            return Content(id.ToString());
        }

        public ActionResult carregarFotos(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var obra = db.obra_arte.Where(o => o.id == id).SingleOrDefault();
                    return View(obra);
                }
            }
            catch (Exception)
            {

                return Redirect("/Error/InternalServerError");
            }
        }

        public ActionResult carregarObra(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var obra = db.obra_arte.Where(o => o.id == id).SingleOrDefault();
                    return View(obra);
                }
            }
            catch (Exception)
            {

                return Redirect("/Error/InternalServerError");
            }
        }

        public ActionResult SaveObra(RestViewModel model)
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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "obras");

                        var fileName1 = Path.GetFileName(file.FileName);
                        model.foto_capa = fileName1;
                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (verificarObraPDF(model))
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

        private bool verificarObraPDF(RestViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var obra = db.obra_arte.Where(r => r.id == model.id).SingleOrDefault();

                    if (!string.IsNullOrEmpty(obra.caminho_pdf))
                    {
                        string fullPath = Request.MapPath("~/Repository/obras/" + obra.caminho_pdf);
                        if (System.IO.File.Exists(fullPath))
                        {
                            if (alterarCaminhoObraPDF(obra.id))
                            {
                                System.IO.File.Delete(fullPath);
                            }

                        }

                    }
                    obra.caminho_pdf = model.foto_capa;

                    db.SaveChanges();
                    return true;


                }
            }
            catch (Exception)
            {

                return false;
            }
        }

        private bool alterarCaminhoObraPDF(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var obra = db.obra_arte.Where(f => f.id == id).SingleOrDefault();
                    obra.caminho_pdf = "";
                    db.SaveChanges();
                }
                return true;
            }
            catch (Exception)
            {

                return false;
            }

        }

        public ActionResult RemoverFotoObrapdf(string filename, long id)
        {
            try
            {
                if (!string.IsNullOrEmpty(filename))
                {
                    if (filename.Trim().ToLower() != "noimage.png")
                    {


                        string fullPath = Request.MapPath("~/Repository/images/obras/" + filename);
                        if (System.IO.File.Exists(fullPath))
                        {
                            if (alterarCaminhoObraPDF(id))
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
        public ActionResult SaveUploadedFileVarias(RestViewModel model)
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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "ArteCultura");

                        var fileName1 = Path.GetFileName(file.FileName);
                        model.foto_capa = fileName1;
                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (verificarObra_2(model, fName))
                        {
                            if (!isExists)
                                System.IO.Directory.CreateDirectory(pathString);

                            var path = string.Format("{0}\\{1}", pathString, file.FileName);
                            //file.SaveAs(path);
                            //isSavedSuccessfully = file.FileName;

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
                return Json(new { Message = isSavedSuccessfully });
            }
            else
            {
                return Json(new { Message = "Error in saving file" });
            }
        }

        private bool verificarObra_2(RestViewModel model, string filename)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    obra_arte obra = db.obra_arte.Where(r => r.id == model.id).SingleOrDefault();
                    if (obra != null)
                    {
                        obra_arte_imagem foto = new obra_arte_imagem()
                        {
                            caminho_imagem = filename,
                            id_obra_arte = model.id,
                        };

                        db.obra_arte_imagem.Add(foto);
                        db.SaveChanges();
                        return true;
                    }

                    return true;
                }
            }
            catch (Exception ex)
            {

                return false;
            }
        }
        public ActionResult RemoverFotoObra(string filename, long id)
        {
            try
            {
                if (!string.IsNullOrEmpty(filename))
                {
                    if (filename.Trim().ToLower() != "noimage.png")
                    {
                        //string fullPathTemp = Request.MapPath("~/Repository/images/tempImage/" + filename);
                        //if (System.IO.File.Exists(fullPathTemp))
                        //{

                        //    System.IO.File.Delete(fullPathTemp);

                        //}

                        string fullPath = Request.MapPath("~/Repository/images/ArteCultura/" + filename);
                        if (System.IO.File.Exists(fullPath))
                        {
                            if (alterarCaminhoObra(id))
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
        private bool alterarCaminhoObra(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var qua = db.obra_arte.Where(f => f.id == id).SingleOrDefault();
                    qua.caminho_imagem = "noimage.png";
                    db.SaveChanges();
                }
                return true;
            }
            catch (Exception)
            {

                return false;
            }

        }

        public ActionResult RemoverFotosVarias(string filename, long id)
        {
            try
            {
                if (!string.IsNullOrEmpty(filename))
                {
                    if (filename.Trim().ToLower() != "noimage.png")
                    {
                        using (var db = new mussika_bdEntities())
                        {
                            string fullPath = Request.MapPath("~/Repository/images/ArteCultura/" + filename);
                            if (System.IO.File.Exists(fullPath))
                            {
                                if (alterarCaminhoVariasFotos(filename))
                                {
                                    System.IO.File.Delete(fullPath);
                                }



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
        private bool alterarCaminhoVariasFotos(string filename)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var rp = db.obra_arte_imagem.Where(f => f.caminho_imagem.Trim().ToLower() == filename.Trim().ToLower()).SingleOrDefault();

                    db.obra_arte_imagem.Remove(rp);
                    db.SaveChanges();

                    return true;
                }

            }
            catch (Exception ex)
            {

                return false;
            }

        }
        public ActionResult CarregarFotosObra(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<arte_obra_foto_view_model> listaFotos = new List<arte_obra_foto_view_model>();
                    List<obra_arte_imagem> lista = db.obra_arte_imagem.Where(rf => rf.id_obra_arte == id).ToList();

                    if (lista.Count > 0)
                    {
                        foreach (var item in lista)
                        {


                            arte_obra_foto_view_model foto = new arte_obra_foto_view_model()
                            {

                                caminho_imagem = item.caminho_imagem,
                                id = item.id,
                                id_obra_arte = (long)item.id_obra_arte,

                            };
                            string fullPath = Request.MapPath("~/Repository/images/ArteCultura/" + item.caminho_imagem);
                            if (System.IO.File.Exists(fullPath))
                            {
                                FileInfo fi = new FileInfo(fullPath);
                                foto.size = fi.Length;
                                listaFotos.Add(foto);
                            }
                        };
                    }



                    return Json(listaFotos, JsonRequestBehavior.AllowGet);
                }

            }
            catch (Exception)
            {


            }
            return View();
        }

        public ActionResult EditarObra(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                List<categoria_obra_arte> categ = db.categoria_obra_arte.ToList();
                ViewBag.categorias = new SelectList(categ, "id", "descricao");
                var obra = db.obra_arte.Where(o => o.id == id).SingleOrDefault();
                ViewBag.autor = db.artista_obra.Where(a => a.id == obra.id_artista_obra).SingleOrDefault();

                return View(obra);
            }


        }
        public ActionResult Cinema()
        {
            return View();
        }
    }
}