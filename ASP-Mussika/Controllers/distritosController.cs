
using ASP_Mussika.Models;

using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;

namespace ASP_Mussika.Controllers
{
    public class distritosController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            try
            {
                if (Session["tipo"].ToString() == "3")
                {

                    base.OnActionExecuting(filterContext);
                }

                else
                {
                    filterContext.Result = new RedirectResult("~/inicio/principal");
                }
            }
            catch (Exception)
            {

                filterContext.Result = new RedirectResult("~/inicio/principal");
            }


        }
        public ActionResult Index()
        {
            return View();
        }

        public List<DistritoViewModel> DistritoList()
        {
            List<DistritoViewModel> listaArtigos = new List<DistritoViewModel>();

            using (var db = new mussika_bdEntities())
            {
                var distritos = db.distritoes.OrderByDescending(P => P.id); ;


                foreach (var model in distritos)
                {
                    DistritoViewModel ProVM = new DistritoViewModel()
                    {
                      activar_galeria=(bool)model.activar_galeria,
                      area=model.area,
                      codigo=model.codigo,
                      descricao=model.descricao,
                      foto_capa=model.foto_capa,
                      latitude=model.latitude,
                      linkmapa=model.linkmapa,
                      longitude=model.longitude,
                      nome=model.nome.ToUpper(),
                      populacao=model.populacao,
                      visitas=(long)model.visitas,
                      id=model.id,
                    };
                    listaArtigos.Add(ProVM);
                }
            }
            return listaArtigos;


        }

        [HttpPost]
        public ActionResult carregarTabelaDistritosByAjax(int draw, int start, int length)
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
                var produtos = DistritoList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<DistritoViewModel>;
                Func<DistritoViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome" ? c.nome :
                                          sortColumn == "area" ? c.area :
                                          sortColumn == "populacao" ? c.populacao.ToString() :
                                          sortColumn == "preco_min" ? c.longitude.ToString() :

                                          sortColumn == "preco_venda" ? c.latitude.ToString()


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

        public ActionResult criarDistrito()
        {
            return View();
        }

        [ValidateInput(false)]
        public ActionResult SalvarDistritos(DistritoViewModel model)
        {
            try
            {
                using(var db=new mussika_bdEntities())
                {
                    distrito novo = new distrito()
                    {
                        activar_galeria=false,
                        area=model.area,
                        codigo=model.codigo,
                        descricao=model.descricao,
                        foto_capa="noimage.png",
                        latitude=model.latitude,
                        linkmapa=model.linkmapa,
                        longitude=model.longitude,
                        nome=model.nome,
                        populacao=model.populacao,
                        visitas=0,
                    };
                    db.distritoes.Add(novo);
                    db.SaveChanges();
                    return Content(novo.id.ToString());
                };
            }
            catch (Exception)
            {

                return Content("false");
            }
           
        }

        public ActionResult CarregarFotos(int id)
        {
            using(var db=new mussika_bdEntities())
            {
                distrito distrito_ = db.distritoes.Where(d => d.id == id).SingleOrDefault();
                DistritoViewModel model = new DistritoViewModel()
                {
                    id = distrito_.id,
                    activar_galeria = (bool)distrito_.activar_galeria,
                    area = distrito_.area,
                    descricao = distrito_.descricao,
                    foto_capa = distrito_.foto_capa,
                    latitude = distrito_.latitude,
                    linkmapa = distrito_.linkmapa,
                    longitude = distrito_.longitude,
                    nome = distrito_.nome,
                    populacao = distrito_.populacao,
                    visitas = (long)distrito_.visitas,

                };

                return View(model);
            }
        }

        public ActionResult CarregarFotosArtigo(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<DistritoFotoViewModel> listaFotos = new List<DistritoFotoViewModel>();
                    List<distrito_foto> res_foto = db.distrito_foto.Where(rf => rf.id_distrito == id).ToList();

                    if (res_foto.Count > 0)
                    {
                        foreach (var item in res_foto)
                        {


                            DistritoFotoViewModel foto = new DistritoFotoViewModel()
                            {

                                caminho = item.caminho,
                                id = item.id,
                                id_distrito = (int)item.id_distrito,

                            };
                            string fullPath = Request.MapPath("~/Repository/images/distritos/" + item.caminho);
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

        public ActionResult SaveUploadedFile(DistritoViewModel model)
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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "distritos");

                        var fileName1 = Path.GetFileName(file.FileName);
                        model.foto_capa = fileName1;
                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (verificarDistrito(model))
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

        private bool verificarDistrito(DistritoViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    distrito distrito_ = db.distritoes.Where(r => r.id == model.id).SingleOrDefault();
                    if (distrito_ != null)
                    {
                        distrito_.foto_capa = model.foto_capa;

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
            string pathString2 = System.IO.Path.Combine(originalDirectory.ToString(), "distritos");
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

            bitMAP1.Save(Server.MapPath("~/Repository/images/distritos/" + fileupload1.FileName));

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

        public ActionResult RemoverFotoDistrito(string filename, long id)
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

                        string fullPath = Request.MapPath("~/Repository/images/distritos/" + filename);
                        if (System.IO.File.Exists(fullPath))
                        {
                            if (alterarCaminhoDistrito(id))
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

        private bool alterarCaminhoDistrito(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var qua = db.distritoes.Where(f => f.id == id).SingleOrDefault();
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
        ////////////////////////////////////////////////////////////////////
        public ActionResult SaveUploadedFileVarias(DistritoViewModel model)
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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "distritos");

                        var fileName1 = Path.GetFileName(file.FileName);
                        model.foto_capa = fileName1;
                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (verificarDistrito_2(model, fName))
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

        private bool verificarDistrito_2(DistritoViewModel model, string filename)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    distrito distrito_ = db.distritoes.Where(r => r.id == model.id).SingleOrDefault();
                    if (distrito_ != null)
                    {
                        distrito_foto foto = new distrito_foto()
                        {
                            caminho = filename,
                            id_distrito = model.id,
                        };

                        db.distrito_foto.Add(foto);
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
                            string fullPath = Request.MapPath("~/Repository/images/distritos/" + filename);
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
                    var rp = db.distrito_foto.Where(f => f.caminho.Trim().ToLower() == filename.Trim().ToLower()).SingleOrDefault();

                    db.distrito_foto.Remove(rp);
                    db.SaveChanges();

                    return true;
                }

            }
            catch (Exception)
            {

                return false;
            }

        }

        public ActionResult EditarDistrito(int id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    distrito distrito_ = db.distritoes.Where(d => d.id == id).SingleOrDefault();
                    DistritoViewModel model = new DistritoViewModel()
                    {
                        id = distrito_.id,
                        activar_galeria = (bool)distrito_.activar_galeria,
                        area = distrito_.area,
                        descricao = distrito_.descricao,
                        foto_capa = distrito_.foto_capa,
                        latitude = distrito_.latitude,
                        linkmapa = distrito_.linkmapa,
                        longitude = distrito_.longitude,
                        nome = distrito_.nome,
                        populacao = distrito_.populacao,
                        visitas = (long)distrito_.visitas,

                    };
                    var desc_ = new HtmlString(model.descricao);
                    ViewBag.descricao = (desc_.ToString());
                    return View(model);
                }
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
        }

        [ValidateInput(false)]
        public ActionResult SalvarAlteracoes(DistritoViewModel model)
        {
            try
            {
                using(var db=new mussika_bdEntities())
                {
                    var a = db.distritoes.Where(d => d.id == model.id).SingleOrDefault();
                    a.latitude = model.latitude;
                    a.linkmapa = model.linkmapa;
                    a.longitude = model.longitude;
                    a.nome = model.nome;
                    a.populacao = model.populacao;
                    a.descricao = model.descricao;
                    a.area = model.area;

                    db.SaveChanges();
                    return Content(a.id.ToString());
                };
                
                
            }
            catch (Exception)
            {

                return Content("false");
            }
           
        }

        // GET: distritos
        public ActionResult listar(string indice = "0", string perpage = "8")
        {

            int indc = int.Parse(indice);
            int pp = int.Parse(perpage);


            List<distrito> lista_distritos = new List<distrito>();

            try
            {
                using (var uow = new mussika_bdEntities())
                {

                    lista_distritos = uow.distritoes.ToList();
                }

            }
            catch (Exception) { }

            ViewBag.current_page = indice;
            ViewBag.records_perpage = perpage;
            ViewBag.lista_distritos = lista_distritos;



            return View(lista_distritos.Skip(indc).Take(pp).ToList());
        }

        public ActionResult perfil(int id = 0)
        {
            if (id == 0) { RedirectToAction("listar"); }

            DistritoViewModel model = new DistritoViewModel();

            List<string> galeria = new List<string>();

            try
            {

                using (var uow = new mussika_bdEntities())
                {
                    distrito ds = uow.distritoes.Where(x => x.id == id).SingleOrDefault<distrito>();

                    model.id = ds.id;
                    model.codigo = ds.codigo;
                    model.nome = ds.nome;
                    model.linkmapa = ds.linkmapa;
                    model.descricao = ds.descricao;
                    model.foto_capa = ds.foto_capa;

                    if (ds.foto_capa.ToList().Count > 0)
                    {
                        //foreach (distrito_foto df in ds.distrito_fotos)
                        //{
                        //    galeria.Add(df.caminho);
                        //}

                    }


                }

            }
            catch (Exception) { }

            ViewBag.galeria = galeria;
            return View(model);
        }

        //public ActionResult servicos(int id_distrito = 0)
        //{

        //    List<string> galeria = new List<string>();
        //    List<servico_categoria> categorias = new List<servico_categoria>();
        //    distrito ds = new distrito();

        //    try
        //    {

        //        using (var uow = new UnitOfWork(new dc_MussikaDataContext()))
        //        {
        //            ds = uow.Distritos.Find(x => x.id == id_distrito).SingleOrDefault<distrito>();
        //            categorias = uow.CategoriasServico.GetAll().ToList();

        //            if (ds.distrito_fotos.ToList().Count > 0)
        //            {
        //                foreach (distrito_foto df in ds.distrito_fotos)
        //                {
        //                    galeria.Add(df.caminho);
        //                }

        //            }

        //        }


        //    }
        //    catch (Exception) { }

        //    ViewBag.galeria = galeria;
        //    ViewBag.categorias = categorias;

        //    return View(ds);
        //}

        //public ActionResult servicos_partial(int id_distrito, int id_categoria = 0, string indice = "0", string perpage = "6")
        //{
        //    int indc = int.Parse(indice);
        //    int pp = int.Parse(perpage);


        //    List<servico> lista_servicos = new List<servico>();
        //    List<ServicosDistrito_ViewModel> model = new List<ServicosDistrito_ViewModel>();

        //    try
        //    {
        //        using (var uow = new UnitOfWork(new dc_MussikaDataContext()))
        //        {

        //            lista_servicos = uow.Servicos.Find(x => x.id_distrito == id_distrito).ToList();
        //            if (id_categoria > 0) { lista_servicos = lista_servicos.Where(x => x.id_servico_categoria == id_categoria).ToList(); }

        //            foreach (servico s in lista_servicos)
        //            {
        //                ServicosDistrito_ViewModel sd = new ServicosDistrito_ViewModel();
        //                sd.id = s.id;
        //                sd.nome = s.nome;
        //                sd.endereco = s.endereco;
        //                sd.telefone = s.telefone;
        //                sd.email = s.email;
        //                sd.idcategoria = (int)s.id_servico_categoria;
        //                sd.categoria = s.servico_categoria.nome;
        //                sd.iddistrito = (int)s.id_distrito;
        //                model.Add(sd);
        //            }
        //        }

        //    }
        //    catch (Exception) { }

        //    ViewBag.current_page = indice;
        //    ViewBag.records_perpage = pp;
        //    ViewBag.lista_distritos = model;

        //    return PartialView("~/Views/distritos/Partials/servicos_partial.cshtml", model.Skip(indc).Take(pp).ToList());
        //}

        //public ActionResult restaurantes(int id_distrito = 0)
        //{
        //    //List<string> galeria = new List<string>();
        //    //List<servico_categoria> categorias = new List<servico_categoria>();
        //    //distrito ds = new distrito();

        //    //try
        //    //{

        //    //    using (var uow = new UnitOfWork(new dc_MussikaDataContext()))
        //    //    {
        //    //        ds = uow.Distritos.Find(x => x.id == id_distrito).SingleOrDefault<distrito>();
        //    //        categorias = uow.CategoriasServico.GetAll().ToList();

        //    //        if (ds.distrito_fotos.ToList().Count > 0)
        //    //        {
        //    //            foreach (distrito_foto df in ds.distrito_fotos)
        //    //            {
        //    //                galeria.Add(df.caminho);
        //    //            }

        //    //        }

        //    //    }


        //    //}
        //    //catch (Exception) { }

        //    //ViewBag.galeria = galeria;
        //    //ViewBag.categorias = categorias;

        //    //return View(ds);
        //    return View();
        //}


        //public ActionResult acomodacoes(int id_distrito = 0)
        //{

        //    List<string> galeria = new List<string>();
        //    distrito ds = new distrito();

        //    try
        //    {

        //        using (var uow = new UnitOfWork(new dc_MussikaDataContext()))
        //        {
        //            ds = uow.Distritos.Find(x => x.id == id_distrito).SingleOrDefault<distrito>();


        //            if (ds.distrito_fotos.ToList().Count > 0)
        //            {
        //                foreach (distrito_foto df in ds.distrito_fotos)
        //                {
        //                    galeria.Add(df.caminho);
        //                }

        //            }

        //        }


        //    }
        //    catch (Exception) { }

        //    ViewBag.nome_distrito = ds.nome;
        //    ViewBag.galeria = galeria;


        //    return View(ds);
        //}

        //public ActionResult acomodacoes_partial(int id_distrito, int id_categoria = 0, string indice = "0", string perpage = "6")
        //{
        //    int indc = int.Parse(indice);
        //    int pp = int.Parse(perpage);


        //    List<acomodacao> lista_acomodacoes = new List<acomodacao>();
        //    List<acomodacao_ViewModel> model = new List<acomodacao_ViewModel>();

        //    try
        //    {
        //        using (var uow = new UnitOfWork(new dc_MussikaDataContext()))
        //        {

        //            lista_acomodacoes = uow.Acomodacoes.Find(x => x.id_distrito == id_distrito).ToList();


        //            foreach (acomodacao s in lista_acomodacoes)
        //            {
        //                acomodacao_ViewModel sd = new acomodacao_ViewModel();
        //                sd.id = s.id;
        //                sd.nome = s.nome;
        //                sd.endereco = s.endereco;
        //                sd.telefone = s.telefone;
        //                sd.email = s.email;
        //                sd.descricao = GetPlainTextFromHtml(s.descricao);
        //                if (sd.descricao.Length > 145)
        //                {
        //                    sd.descricao = sd.descricao.Substring(0, 145) + "...";
        //                }
        //                sd.id_distrito = (int)s.id_distrito;
        //                sd.caminho_imagem = s.foto_capa.Trim();
        //                //sd.classificao = 0;
        //                model.Add(sd);
        //            }
        //        }

        //    }
        //    catch (Exception) { }

        //    ViewBag.current_page = indice;
        //    ViewBag.records_perpage = pp;
        //    ViewBag.lista_acomodacoes = model;

        //    return PartialView("~/Views/distritos/Partials/acomodacoes_partial.cshtml", model.Skip(indc).Take(pp).ToList());
        //}

        //public ActionResult perfil_restaurante()
        //{

        //    return View();
        //}

        //public ActionResult perfil_acomodacao()
        //{

        //    return View();
        //}

        //public ActionResult acomodacao(string id)
        //{

        //    return View();
        //}



        //public ActionResult eventos(string id)
        //{
        //    return View();
        //}

        //public string GetPlainTextFromHtml(string htmlString)
        //{
        //    string htmlTagPattern = "<.*?>";
        //    var regexCss = new Regex("(\\<script(.+?)\\</script\\>)|(\\<style(.+?)\\</style\\>)", RegexOptions.Singleline | RegexOptions.IgnoreCase);
        //    htmlString = regexCss.Replace(htmlString, string.Empty);
        //    htmlString = Regex.Replace(htmlString, htmlTagPattern, string.Empty);
        //    htmlString = Regex.Replace(htmlString, @"^\s+$[\r\n]*", "", RegexOptions.Multiline);
        //    htmlString = htmlString.Replace("&nbsp;", string.Empty);

        //    htmlString = Server.HtmlDecode(htmlString);
        //    return htmlString;

        //}
    }
}