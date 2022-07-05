using ASP_Mussika.Models;
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
    public class FilmeController : Controller
    {
        // GET: Filme
        public ActionResult Index()
        {
            return View();
        }

        public List<FilmeViewModel> FilmeList()
        {
            List<FilmeViewModel> listaArtigos = new List<FilmeViewModel>();

            using (var db = new mussika_bdEntities())
            {
                var filmes = db.filmes.OrderByDescending(P => P.id); ;


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

        public ActionResult Criar()
        {
            
            return View();
        }

        public ActionResult Salvar(FilmeViewModel model)
        {
           
            long id = 0;
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    if (model.id <= 0)
                    {
                        filme novo = new filme()
                        {
                           distribuidor=model.distribuidor,
                           ano_producao=model.ano_producao,
                           cor=model.cor,
                           direcao=model.direcao,
                           elenco=model.elenco,
                           idioma=model.idioma,
                           minutos=model.minutos,
                           nacionalidade=model.nacionalidade,
                           orcamento=model.orcamento,
                           sinopse=model.sinopse,
                           tipo_filme=model.tipo_filme,
                           titulo_original=model.titulo_original,
                           inactivo=model.inactivo,
                           preco=model.preco,
                           link_trailer=model.link_trailer,
                           foto_capa="noimage.png"
                           
                           
                        };

                        db.filmes.Add(novo);
                        db.SaveChanges();
                        id = novo.id;
                    }
                    else
                    {
                        var evento = db.filmes.Where(e => e.id == model.id).SingleOrDefault();
                        evento.direcao = model.direcao;
                        evento.distribuidor = model.distribuidor;
                        evento.ano_producao = model.ano_producao;
                        evento.cor = model.cor;
                        evento.elenco = model.elenco;
                        evento.idioma = model.idioma;
                        evento.minutos = model.minutos;
                        evento.nacionalidade = model.nacionalidade;
                        evento.sinopse = model.sinopse;
                        evento.tipo_filme = model.tipo_filme;
                        evento.titulo_original = model.titulo_original;
                        evento.orcamento = model.orcamento;
                        evento.inactivo = model.inactivo;
                        evento.preco = model.preco;
                        evento.link_trailer = model.link_trailer;
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

        public ActionResult AddCategorias(long id)
        {
            try
            {
                using(var db=new mussika_bdEntities())
                {
                    var filme = db.filmes.Where(f => f.id == id).SingleOrDefault();

                    var cat_filme = db.filme_categoria.ToList();
                    ViewBag.categorias = cat_filme;
                    return View(filme);

                   
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<item_categoria_view_model> item_categoriaList(long id)
        {
            List<item_categoria_view_model> listaArtigos = new List<item_categoria_view_model>();

            using (var db = new mussika_bdEntities())
            {
                var filmes = db.item_filme_categoria.Where(i=>i.id_filme==id&& i.inactivo==false).OrderByDescending(P => P.id);


                foreach (var model in filmes)
                {
                    item_categoria_view_model ProVM = new item_categoria_view_model()
                    {
                        id = model.id,
                       id_filme=model.id_filme??0,
                       id_categoria=model.id_categoria??0,
                       nome=model.filme_categoria.descricao,
                    };
                    listaArtigos.Add(ProVM);
                }
            }
            return listaArtigos;


        }

        [HttpPost]
        public ActionResult carregarTabelaItemsByAjax(int draw, int start, int length,long id)
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
                var produtos = item_categoriaList(id);
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<item_categoria_view_model>;
                Func<item_categoria_view_model, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome" ? c.nome 
                                         
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

        public  ActionResult VincularCategoria(long id_filme, long id_categoria)
        {
            try
            {
                using(var db=new mussika_bdEntities())
                {
                    var cat = db.item_filme_categoria.Where(i => i.id_filme == id_filme && i.id_categoria == id_categoria && i.inactivo==false).SingleOrDefault();
                    if (cat != null)
                    {
                        return Content("existe");
                    }
                    else
                    {
                        item_filme_categoria novo = new item_filme_categoria()
                        {
                            id_categoria = id_categoria,
                            id_filme = id_filme,
                            inactivo=false,
                        };
                        db.item_filme_categoria.Add(novo);
                        db.SaveChanges();
                        return Content("true");
                    }
                }
            }
            catch (Exception)
            {

                return Content("true");
            }
     
        }

        public ActionResult ApagarItem(long id_categoria, long id_filme)
        {
            try
            {
                using(var db=new mussika_bdEntities())
                {
                    var item = db.item_filme_categoria.Where(i => i.id == id_categoria).SingleOrDefault();
                    db.item_filme_categoria.Remove(item);
                    db.SaveChanges();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Redirect("/Filme/AddCategorias?id=" + id_filme);
        }

        public ActionResult CarregarFotos(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var filme = db.filmes.Where(f => f.id == id).SingleOrDefault();

                var cat_filme = db.filme_categoria.ToList();
                ViewBag.categorias = cat_filme;
                return View(filme);


            }

        }

        public ActionResult SaveUploadedFile(FilmeViewModel model)
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

                        if (verificarFilme(model))
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
        public ActionResult RemoverFotoFilme(string filename, long id)
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

                        string fullPath = Request.MapPath("~/Repository/images/cinema/" + filename);
                        if (System.IO.File.Exists(fullPath))
                        {
                            if (alterarCaminhoFilme(id))
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

        private bool alterarCaminhoFilme(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var qua = db.filmes.Where(f => f.id == id).SingleOrDefault();
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
        private bool verificarFilme(FilmeViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    filme evento_ = db.filmes.Where(r => r.id == model.id).SingleOrDefault();
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
            int maxWidth = 420;

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

        public ActionResult EditarFilme(long id)
        {
           
                using (var db = new mussika_bdEntities())
                {
                    var filme = db.filmes.Where(f => f.id == id).SingleOrDefault();

                    var cat_filme = db.filme_categoria.ToList();
                    ViewBag.categorias = cat_filme;
                    return View(filme);


                }

                
            
        }
    }
}