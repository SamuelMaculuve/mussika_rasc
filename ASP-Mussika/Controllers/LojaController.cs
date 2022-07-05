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
    public class LojaController : Controller
    {
        // GET: Loja
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult criar()
        {
            using (var db = new mussika_bdEntities())
            {
                List<distrito> distritos_ = db.distritoes.ToList();
                ViewBag.distritos = new SelectList(distritos_, "id", "nome");

                List<loja_tipo> Tipo = db.loja_tipo.ToList();
                ViewBag.tipo = new SelectList(Tipo, "id", "descricao");

            };
            return View();
        }

        public ActionResult salvar(LojaViewModel model)
        {
            //DateTime data_Evento = DateTime.Parse(model.data_evento_convertido);
            long id = 0;
            try
            {
                long ida = long.Parse(Session["idusario"].ToString());
                using (var db = new mussika_bdEntities())
                {
                    if (model.id <= 0)
                    {
                        loja novo = new loja()
                        {

                            data_cadastro = DateTime.Now,
                            id_provedor = ida,
                            descricao = model.descricao,
                            foto_capa = "noimage.png",
                            id_distrito = model.id_distrito,
                            id_tipo_loja = model.id_tipo_loja,
                            inactivo = false,
                            email = model.email,
                            telefone = model.telefone,
                            bairro = model.bairro,
                            nome = model.nome,

                        };

                        db.lojas.Add(novo);
                        db.SaveChanges();
                        id = novo.id;
                    }
                    else
                    {
                        var evento = db.lojas.Where(e => e.id == model.id).SingleOrDefault();
                        evento.id_distrito = model.id_distrito;
                        evento.inactivo = model.inactivo;
                        evento.bairro = model.bairro;
                        evento.nome = model.nome;
                        evento.id_provedor = ida;
                        evento.telefone = model.telefone;
                        evento.email = model.email;
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
                var evento = db.lojas.Where(m => m.id == id).SingleOrDefault();
                ViewBag.id = id;
                ViewBag.nome = evento.nome;
                return View(evento);
            }

        }

        public ActionResult SaveUploadedFile(loja model)
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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "lojas");

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
        public ActionResult RemoverFotoEvento(string filename, long id)
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

                        string fullPath = Request.MapPath("~/Repository/images/lojas/" + filename);
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
                    var qua = db.lojas.Where(f => f.id == id).SingleOrDefault();
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
        private bool verificarMusica(loja model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    loja evento_ = db.lojas.Where(r => r.id == model.id).SingleOrDefault();
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
            string pathString2 = System.IO.Path.Combine(originalDirectory.ToString(), "lojas");
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

            bitMAP1.Save(Server.MapPath("~/Repository/images/lojas/" + fileupload1.FileName));

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

        public List<LojaViewModel> turismoList()
        {
            List<LojaViewModel> listaArtigos = new List<LojaViewModel>();
            long provedor = long.Parse(Session["idusario"].ToString());
            using (var db = new mussika_bdEntities())
            {
                var artigos = db.lojas.Where(P => P.id_provedor== provedor); ;


                foreach (var model in artigos)
                {
                    LojaViewModel ProVM = new LojaViewModel()
                    {
                        id = model.id,
                        data_cadastro = DateTime.Now,
                        descricao = model.descricao,
                        foto_capa = "noimage.png",
                        id_distrito = (int)model.id_distrito,
                        inactivo = (bool)model.inactivo,
                        email = model.email,
                        telefone = model.telefone,
                        tipo_loja = model.loja_tipo.descricao,
                        bairro = model.bairro,
                        nome = model.nome,
                        nome_distrito = model.distrito.nome,

                    };
                    listaArtigos.Add(ProVM);
                }
            }
            return listaArtigos;


        }

        [HttpPost]
        public ActionResult carregarTabelaTurismoByAjax(int draw, int start, int length)
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
                var produtos = turismoList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<LojaViewModel>;
                Func<LojaViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome" ? c.nome :
                                           sortColumn == "Bairro" ? c.bairro :
                                          sortColumn == "nome_distrito" ? c.nome_distrito



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

        public ActionResult EditarLoja(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                List<distrito> distritos_ = db.distritoes.ToList();
                ViewBag.distritos = new SelectList(distritos_, "id", "nome");

                List<loja_tipo> Tipo = db.loja_tipo.ToList();
                ViewBag.tipo = new SelectList(Tipo, "id", "descricao");
                var evento = db.lojas.Where(m => m.id == id).SingleOrDefault();

                return View(evento);
            }
        }

        public ActionResult Produtos(long id, int? page)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<loja_produto> itens = null;
                    ViewBag.autor = db.lojas.Where(p => p.id == id).SingleOrDefault();
                    ViewBag.id_autor = id;
                    itens = db.loja_produto.Where(q => q.id_loja == id).ToList();
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

        public ActionResult CriarProduto(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                List<produto_categoria> Tipo = db.produto_categoria.ToList();
                ViewBag.categoria = new SelectList(Tipo, "id", "descricao");

                ViewBag.autor = db.lojas.Where(a => a.id == id).SingleOrDefault();
            }
            return View();
        }

        public ActionResult SalvarProduto(loja_produto_view_model model)
        {
            long id = 0;
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    if (model.id <= 0)
                    {
                        loja_produto novo = new loja_produto()
                        {

                            data_cadastro = DateTime.Now,
                            descricao = model.descricao,
                            foto_capa = "noimage.png",
                            categoria = model.categoria,
                            e_servico = model.e_servico,
                            id_loja = model.id_loja,                            
                            preco_venda=model.preco_venda,
                            clicks=0,
                            inactivo = false,
                            peso=model.peso??0,
                            

                            nome = model.nome,

                        };

                        db.loja_produto.Add(novo);
                        db.SaveChanges();
                        id = novo.id;
                    }
                    else
                    {
                        var evento = db.loja_produto.Where(e => e.id == model.id).SingleOrDefault();
                        evento.categoria = model.categoria;
                        evento.e_servico = model.e_servico;
                        evento.preco_venda = model.preco_venda;
                        evento.nome = model.nome;
                        evento.inactivo = model.inactivo;
                        evento.peso = model.peso??0;
                       
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

        public ActionResult CarregarFotosProduto(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var evento = db.loja_produto.Where(m => m.id == id).SingleOrDefault();
                ViewBag.id = evento.id_loja;
                ViewBag.nome = evento.nome;
                return View(evento);
            }

        }

        public ActionResult SaveUploadedFileProduto(loja model)
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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "lojas");

                        var fileName1 = Path.GetFileName(file.FileName);
                        model.foto_capa = fileName1;
                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (verificarProduto(model))
                        {
                            if (!isExists)
                                System.IO.Directory.CreateDirectory(pathString);

                            var path = string.Format("{0}\\{1}", pathString, file.FileName);

                            //file.SaveAs(path);
                            if (reziseImageProduto(file))
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
        public ActionResult RemoverFotoProduto(string filename, long id)
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

                        string fullPath = Request.MapPath("~/Repository/images/lojas/" + filename);
                        if (System.IO.File.Exists(fullPath))
                        {
                            if (alterarCaminhoProduto(id))
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

        private bool alterarCaminhoProduto(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var qua = db.loja_produto.Where(f => f.id == id).SingleOrDefault();
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
        private bool verificarProduto(loja model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    loja_produto evento_ = db.loja_produto.Where(r => r.id == model.id).SingleOrDefault();
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
        public bool reziseImageProduto(HttpPostedFileBase fileupload)
        {
            HttpPostedFileBase fileupload1 = fileupload;
            var originalDirectory = new DirectoryInfo(string.Format("{0}Repository\\images", Server.MapPath(@"\")));
            string pathString2 = System.IO.Path.Combine(originalDirectory.ToString(), "lojas");
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

            bitMAP1.Save(Server.MapPath("~/Repository/images/lojas/" + fileupload1.FileName));

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

        public ActionResult EditarProduto(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                List<produto_categoria> Tipo = db.produto_categoria.ToList();
                ViewBag.categorias = new SelectList(Tipo, "id", "descricao");

                
                var evento = db.loja_produto.Where(m => m.id == id).SingleOrDefault();
                ViewBag.catPro = evento.categoria;
                return View(evento);
            }
        }
    }
}