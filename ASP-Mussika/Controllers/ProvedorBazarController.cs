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
    public class ProvedorBazarController : Controller
    {
        // GET: ProvedorBazar
        public ActionResult Index(long id)
        {
            long ida = long.Parse(Session["idusario"].ToString());
            return View();
        }

        public List<ArtigoViewModel> ArtigoList()
        {
            List<ArtigoViewModel> listaArtigos = new List<ArtigoViewModel>();
            long id_prov = long.Parse(Session["idusario"].ToString());
            using (var db = new mussika_bdEntities())
            {
                var artigos = db.artigoes.Where(p => p.id_provedorr == id_prov).OrderByDescending(P => P.id); ;


                foreach (var model in artigos)
                {
                    ArtigoViewModel ProVM = new ArtigoViewModel()
                    {
                        atracao_internacional = (bool)model.atracao_internacional,
                        bairro = model.bairro,
                        data_cadastro = DateTime.Now,
                        descricao = model.descricao,
                        e_servico = (bool)model.e_servico,
                        foto_capa = model.foto_capa,
                        genero = model.genero,
                        id_categoria_artigo = (int)model.id_categoria_artigo,
                        id_distrito = (int)model.id_distrito,
                        Inactivo = false,
                        marca_registada = (bool)model.marca_registada,
                        nome = model.nome,
                        observacoes = model.observacoes,
                        portofolio = model.portofolio,
                        preco_max = (decimal)model.preco_max,
                        preco_min = (decimal)model.preco_min,
                        preco_venda = (decimal)model.preco_venda,
                        id = model.id,
                        nomeDistrito = model.distrito.nome,
                        nomeCategoria = model.categoria_artigo.descricao,
                    };
                    listaArtigos.Add(ProVM);
                }
            }
            return listaArtigos;


        }

        [HttpPost]
        public ActionResult carregarTabelaArtigosByAjax(int draw, int start, int length)
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
                var produtos = ArtigoList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<ArtigoViewModel>;
                Func<ArtigoViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome" ? c.nome :
                                          sortColumn == "nomeDistrito" ? c.nomeDistrito :
                                          sortColumn == "nomeCategoria" ? c.nomeCategoria.ToString() :
                                          sortColumn == "preco_min" ? c.preco_min.ToString() :

                                          sortColumn == "preco_venda" ? c.preco_venda.ToString()


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

        public ActionResult CriarArtigo()
        {
            using (var db = new mussika_bdEntities())
            {
                List<categoria_artigo> categorias_ = db.categoria_artigo.ToList();
                ViewBag.categorias = new SelectList(categorias_, "id", "descricao");

                List<distrito> distritos_ = db.distritoes.ToList();
                ViewBag.distritos = new SelectList(distritos_, "id", "nome");
                var id= Session["idusario"];

            };

            return View();
        }

        [ValidateInput(false)]
        public ActionResult SalvarArtigo(ArtigoViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    long id_prov = long.Parse(Session["idusario"].ToString());
                    artigo novo = new artigo()
                    {
                        atracao_internacional = model.atracao_internacional,
                        bairro = model.bairro,
                        data_cadastro = DateTime.Now,
                        descricao = model.descricao,
                        e_servico = model.e_servico,
                        foto_capa = "noimage.png",
                        genero = model.genero,
                        id_provedorr= id_prov,
                        id_categoria_artigo = model.id_categoria_artigo,
                        id_distrito = model.id_distrito,
                        Inactivo = false,
                        marca_registada = model.marca_registada,
                        nome = model.nome,
                        observacoes = model.observacoes,
                        portofolio = model.portofolio,
                        preco_max = model.preco_max,
                        preco_min = model.preco_min,
                        preco_venda = model.preco_venda,
                        peso=model.peso,


                    };
                    db.artigoes.Add(novo);
                    db.SaveChanges();
                    return Content(novo.id.ToString());
                }

            }
            catch (Exception)
            {

                return Content("false");
            }

        }

        public ActionResult CarregarFotos(long id)
        {

            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var model = db.artigoes.Where(a => a.id == id).SingleOrDefault();
                    ArtigoViewModel model1 = new ArtigoViewModel()
                    {
                        atracao_internacional = (bool)model.atracao_internacional,
                        bairro = model.bairro,
                        data_cadastro = DateTime.Now,
                        descricao = model.descricao,
                        e_servico = (bool)model.e_servico,
                        foto_capa = model.foto_capa,
                        genero = model.genero,
                        id_categoria_artigo = (int)model.id_categoria_artigo,
                        id_distrito = (int)model.id_distrito,
                        Inactivo = false,
                        marca_registada = (bool)model.marca_registada,
                        nome = model.nome,
                        observacoes = model.observacoes,
                        portofolio = model.portofolio,
                        preco_max = (decimal)model.preco_max,
                        preco_min = (decimal)model.preco_min,
                        preco_venda = (decimal)model.preco_venda,
                        id = model.id,
                    };
                    return View(model1);
                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }

        }

        public ActionResult CarregarFotosArtigo(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<ArtigoFotoViewModel> listaFotos = new List<ArtigoFotoViewModel>();
                    List<artigo_imagem> res_foto = db.artigo_imagem.Where(rf => rf.id_artigo == id).ToList();

                    if (res_foto.Count > 0)
                    {
                        foreach (var item in res_foto)
                        {


                            ArtigoFotoViewModel foto = new ArtigoFotoViewModel()
                            {

                                caminho = item.caminho,
                                id = item.id,
                                id_artigo = (long)item.id_artigo,

                            };
                            string fullPath = Request.MapPath("~/Repository/images/Artigos/" + item.caminho);
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

        public ActionResult SaveUploadedFile(ArtigoViewModel model)
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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "Artigos");

                        var fileName1 = Path.GetFileName(file.FileName);
                        model.foto_capa = fileName1;
                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (verificarArtigo(model))
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

        private bool verificarArtigo(ArtigoViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    artigo artigo_ = db.artigoes.Where(r => r.id == model.id).SingleOrDefault();
                    if (artigo_ != null)
                    {
                        artigo_.foto_capa = model.foto_capa;

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
        public ActionResult RemoverFotoArtigo(string filename, long id)
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

                        string fullPath = Request.MapPath("~/Repository/images/Artigos/" + filename);
                        if (System.IO.File.Exists(fullPath))
                        {
                            if (alterarCaminhoArtigo(id))
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
        private bool alterarCaminhoArtigo(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var qua = db.artigoes.Where(f => f.id == id).SingleOrDefault();
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

        public bool reziseImage(HttpPostedFileBase fileupload)
        {
            HttpPostedFileBase fileupload1 = fileupload;
            var originalDirectory = new DirectoryInfo(string.Format("{0}Repository\\images", Server.MapPath(@"\")));
            string pathString2 = System.IO.Path.Combine(originalDirectory.ToString(), "Artigos");
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

            bitMAP1.Save(Server.MapPath("~/Repository/images/Artigos/" + fileupload1.FileName));

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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "Artigos");

                        var fileName1 = Path.GetFileName(file.FileName);
                        model.foto_capa = fileName1;
                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (verificarArtigo_2(model, fName))
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

        private bool verificarArtigo_2(RestViewModel model, string filename)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    artigo artigo_ = db.artigoes.Where(r => r.id == model.id).SingleOrDefault();
                    if (artigo_ != null)
                    {
                        artigo_imagem foto = new artigo_imagem()
                        {
                            caminho = filename,
                            id_artigo = model.id,
                        };

                        db.artigo_imagem.Add(foto);
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
                            string fullPath = Request.MapPath("~/Repository/images/Artigos/" + filename);
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
                    var rp = db.artigo_imagem.Where(f => f.caminho.Trim().ToLower() == filename.Trim().ToLower()).SingleOrDefault();

                    db.artigo_imagem.Remove(rp);
                    db.SaveChanges();

                    return true;
                }

            }
            catch (Exception)
            {

                return false;
            }

        }

        public ActionResult EditarArtigo(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<categoria_artigo> categorias_ = db.categoria_artigo.ToList();
                    ViewBag.categorias = new SelectList(categorias_, "id", "descricao");

                    List<distrito> distritos_ = db.distritoes.ToList();
                    ViewBag.distritos = new SelectList(distritos_, "id", "nome");

                    var model = db.artigoes.Where(a => a.id == id).SingleOrDefault();
                    ArtigoViewModel ProVM = new ArtigoViewModel()
                    {
                        atracao_internacional = (bool)model.atracao_internacional,
                        bairro = model.bairro,
                        data_cadastro = DateTime.Now,
                        descricao = model.descricao,
                        e_servico = (bool)model.e_servico,
                        foto_capa = model.foto_capa,
                        genero = model.genero,
                        id_categoria_artigo = (int)model.id_categoria_artigo,
                        id_distrito = (int)model.id_distrito,
                        Inactivo = (model.Inactivo ?? false),
                        marca_registada = (bool)model.marca_registada,
                        nome = model.nome,
                        observacoes = model.observacoes,
                        portofolio = model.portofolio,
                        preco_max = (decimal)model.preco_max,
                        preco_min = (decimal)model.preco_min,
                        preco_venda = (decimal)model.preco_venda,
                        id = model.id,
                        nomeDistrito = model.distrito.nome,
                        nomeCategoria = model.categoria_artigo.descricao,
                        peso=model.peso??0,

                    };
                    return View(ProVM);

                };
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }


        }
        [ValidateInput(false)]
        public ActionResult SalvarAlteracoesArtigo(ArtigoViewModel model)
        {
            try
            {
                long id_prov = long.Parse(Session["idusario"].ToString());
                using (var db = new mussika_bdEntities())
                {
                    var artigo = db.artigoes.Where(a => a.id == model.id).SingleOrDefault();
                    artigo.id_categoria_artigo = model.id_categoria_artigo;
                    artigo.id_distrito = model.id_distrito;
                    artigo.Inactivo = model.Inactivo;
                    artigo.marca_registada = model.marca_registada;
                    artigo.nome = model.nome;
                    artigo.observacoes = model.observacoes;
                    artigo.portofolio = model.portofolio;
                    artigo.id_provedorr = id_prov;
                    artigo.preco_venda = model.preco_venda;
                    artigo.atracao_internacional = model.atracao_internacional;
                    artigo.bairro = model.bairro;
                    artigo.descricao = model.descricao;
                    artigo.e_servico = model.e_servico;
                    artigo.genero = model.genero;
                    artigo.peso = model.peso;
                    

                    db.SaveChanges();
                    return Content("true");

                }
            }
            catch (Exception)
            {

                return Content("false");
            }

        }
    }
}