using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Web.Mvc;
using ASP_Mussika.Models;
using PagedList;

namespace ASP_Mussika.Controllers
{
    public class RestauranteController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            try
            {
                if (Session["tipo"].ToString() == "3"|| Session["tipo"].ToString() == "4")
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
        // GET: Restaurante
        public ActionResult Index()
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<distrito> distritos_ = db.distritoes.ToList();
                    ViewBag.distritos = new SelectList(distritos_, "id", "nome");

                    List<restaurante_tipo> TipoRestaurantes_ = db.restaurante_tipo.ToList();
                    ViewBag.TipoRestaurantes = new SelectList(TipoRestaurantes_, "id", "tipo");

                };
            }
            catch (Exception)
            {

                throw;
            }
            return View();
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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "Restaurantes");

                        var fileName1 = Path.GetFileName(file.FileName);
                        model.foto_capa = fileName1;
                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (verificarRestaurante(model))
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

        public bool reziseImage(HttpPostedFileBase fileupload)
        {
            HttpPostedFileBase fileupload1 = fileupload;
            var originalDirectory = new DirectoryInfo(string.Format("{0}Repository\\images", Server.MapPath(@"\")));
            string pathString2 = System.IO.Path.Combine(originalDirectory.ToString(), "Restaurantes");
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

            bitMAP1.Save(Server.MapPath("~/Repository/images/Restaurantes/"+fileupload1.FileName));

            bitMAP1.Dispose();

            thumbnailGraph.Dispose();

            image.Dispose();


            string fullPath = Request.MapPath("~/Repository/images/tempImage/" + fileupload1.FileName);
            if (System.IO.File.Exists(fullPath))

            {

                System.IO.File.Delete(fullPath);
                return true;

            }else
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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "Restaurantes");

                        var fileName1 = Path.GetFileName(file.FileName);
                        model.foto_capa = fileName1;
                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (verificarRestaurante_2(model, fName))
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

        private bool verificarRestaurante(RestViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    restaurante restaurante_ = db.restaurantes.Where(r => r.id == model.id).SingleOrDefault();
                    if (restaurante_ != null)
                    {
                        restaurante_.foto_capa = model.foto_capa;

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

        private bool verificarRestaurante_2(RestViewModel model, string filename)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    restaurante restaurante_ = db.restaurantes.Where(r => r.id == model.id).SingleOrDefault();
                    if (restaurante_ != null)
                    {
                        restaurante_foto foto = new restaurante_foto()
                        {
                            activo = true,
                            caminho = filename,
                            id_restaurante = model.id,
                        };

                        db.restaurante_foto.Add(foto);
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

        public ActionResult verificarExistencia(string restaurante)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var restaurante_ = db.restaurantes.Where(r => r.nome.Trim().ToLower() == restaurante.Trim().ToLower() && r.activo == true).SingleOrDefault();
                    if (restaurante_ != null)
                    {
                        return Content("false");
                    }
                    return Content("true");
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        [ValidateInput(false)]
        public ActionResult finalizarCadastro(RestViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var restaurante_ = db.restaurantes.Where(r => r.nome.Trim().ToLower() == model.nome.Trim().ToLower()).SingleOrDefault();
                    if (restaurante_ != null)
                    {

                        return Content("existe");
                    }
                    long usuario = long.Parse(Session["idusario"].ToString());
                    string userTipo = Session["tipo"].ToString();
                    restaurante novo = new restaurante()
                    {
                        id_distrito = model.id_distrito,
                        nome = model.nome,
                        id_restaurante_tipo = model.id_restaurante_tipo,
                        email = model.email,
                        descricao = model.descricao,
                        endereco = model.endereco,
                        foto_capa = "noimage.png",
                        mapa = model.mapa,
                        telefone = model.telefone,
                        website = model.website,
                        activo = true,
                    };
                    if (userTipo == "4")
                    {
                        novo.id_provedor = usuario;
                    }
                    db.restaurantes.Add(novo);
                    db.SaveChanges();
                    return Content(novo.id.ToString());
                }
            }
            catch (Exception)
            {

                return Content("false");
            }

        }

        public ActionResult CarregarFotos(long idRestaurante)
        {
            RestViewModel model;
            try
            {

                using (var db = new mussika_bdEntities())
                {
                    var restaurante = db.restaurantes.Where(r => r.id == idRestaurante).SingleOrDefault();
                    model = new RestViewModel()
                    {
                        id = restaurante.id,
                        activo = (bool)restaurante.activo,
                        descricao = restaurante.descricao,
                        email = restaurante.email,
                        endereco = restaurante.endereco,
                        foto_capa = restaurante.foto_capa,
                        id_distrito = (int)restaurante.id_distrito,
                        id_restaurante_tipo = (int)restaurante.id_restaurante_tipo,
                        mapa = restaurante.mapa,
                        nome = restaurante.nome,
                        telefone = restaurante.telefone,
                        website = restaurante.website,
                    };

                };
            }
            catch (Exception)
            {

                return Redirect("/inicio/InternalServerError");
            }
            return View(model);
        }

        public ActionResult Restaurantes()
        {
            return View();
        }

        public List<RestViewModel> produtoList()
        {
            List<RestViewModel> listaProduto = new List<RestViewModel>();
            using (var db = new mussika_bdEntities())
            {
                var produtos = db.restaurantes.Where(p => p.activo == true).OrderByDescending(P => P.id);


                foreach (var model in produtos)
                {
                    RestViewModel ProVM = new RestViewModel()
                    {
                        id_distrito = (int)model.id_distrito,
                        nome = model.nome,
                        id_restaurante_tipo = (int)model.id_restaurante_tipo,
                        email = model.email,
                        descricao = model.descricao,
                        endereco = model.endereco,
                        foto_capa = model.foto_capa,
                        mapa = model.mapa,
                        telefone = model.telefone,
                        website = model.website,
                        activo = true,
                        nomeDistrito = model.distrito.nome,
                        id = model.id,
                        nomeRestauranteTipo = model.restaurante_tipo.tipo,
                    };
                    listaProduto.Add(ProVM);
                }
            }
            return listaProduto;


        }

        [HttpPost]
        public ActionResult carregarTabelaRestaurantesByAjax(int draw, int start, int length)
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
                var produtos = produtoList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<RestViewModel>;
                Func<RestViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome" ? c.nome :
                                          sortColumn == "nomeDistrito" ? c.nomeDistrito :
                                          sortColumn == "nomeRestauranteTipo" ? c.nomeRestauranteTipo.ToString() :
                                          sortColumn == "email" ? c.email.ToString() :

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

        public ActionResult AlterarImagens(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    restaurante model = db.restaurantes.Where(r => r.id == id).SingleOrDefault();

                    RestViewModel novo = new RestViewModel()
                    {
                        id_distrito = (int)model.id_distrito,
                        nome = model.nome,
                        id_restaurante_tipo = (int)model.id_restaurante_tipo,
                        email = model.email,
                        descricao = model.descricao,
                        endereco = model.endereco,
                        foto_capa = model.foto_capa,
                        mapa = model.mapa,
                        telefone = model.telefone,
                        website = model.website,
                        activo = true,
                        id = model.id,
                    };
                    string fullPath = Request.MapPath("~/Repository/images/Restaurantes/" + novo.foto_capa);
                    if (System.IO.File.Exists(fullPath))
                    {
                        FileInfo fi = new FileInfo(fullPath);
                        novo.size = fi.Length;


                    }
                    return View(novo);
                };
            }
            catch (Exception)
            {


            }
            return View();
        }

        public ActionResult carregarFotosRestaurante(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<RestFotoViewModel> listaFotos = new List<RestFotoViewModel>();
                    List<restaurante_foto> res_foto = db.restaurante_foto.Where(rf => rf.id_restaurante == id && rf.activo==true).ToList();

                    if (res_foto.Count > 0)
                    {
                        foreach (var item in res_foto)
                        {


                            RestFotoViewModel foto = new RestFotoViewModel()
                            {
                                activo = (bool)item.activo,
                                caminho = item.caminho,
                                id = item.id,
                                id_restaurante = (long)item.id_restaurante,

                            };
                            string fullPath = Request.MapPath("~/Repository/images/Restaurantes/" + item.caminho);
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

        public ActionResult RemoverFotoPerfil(string filename, long id)
        {
            try
            {
                if (!string.IsNullOrEmpty(filename))
                {
                    if (filename.Trim().ToLower() != "noimage.png")
                    {
                        using (var db = new mussika_bdEntities())
                        {
                            string fullPath = Request.MapPath("~/Repository/images/Restaurantes/" + filename);
                            if (System.IO.File.Exists(fullPath))
                            {
                                if (alterarCaminho(id))
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
                            string fullPath = Request.MapPath("~/Repository/images/Restaurantes/" + filename);
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

        private bool alterarCaminho(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var rp = db.restaurantes.Where(f => f.id == id).SingleOrDefault();
                    rp.foto_capa = "noimage.png";
                    db.SaveChanges();
                }
                return true;
            }
            catch (Exception)
            {

                return false;
            }

        }

        private bool alterarCaminhoVariasFotos(string filename)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var rp = db.restaurante_foto.Where(f => f.caminho.Trim().ToLower() == filename.Trim().ToLower()).SingleOrDefault();

                    db.restaurante_foto.Remove(rp);
                    db.SaveChanges();

                    return true;
                }

            }
            catch (Exception)
            {

                return false;
            }

        }

        public ActionResult RemoverFotos(string filename)
        {

            return Content("");
        }
        public ActionResult Editar(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<distrito> distritos_ = db.distritoes.ToList();
                    ViewBag.distritos = new SelectList(distritos_, "id", "nome");

                    List<restaurante_tipo> TipoRestaurantes_ = db.restaurante_tipo.ToList();
                    ViewBag.TipoRestaurantes = new SelectList(TipoRestaurantes_, "id", "tipo");

                    restaurante model = db.restaurantes.Where(r => r.id == id).SingleOrDefault();

                    RestViewModel novo = new RestViewModel()
                    {
                        id_distrito = (int)model.id_distrito,
                        nome = model.nome,
                        id_restaurante_tipo = (int)model.id_restaurante_tipo,
                        email = model.email,
                        descricao = model.descricao,
                        endereco = model.endereco,
                        foto_capa = model.foto_capa,
                        mapa = model.mapa,
                        telefone = model.telefone,
                        website = model.website,
                        activo = true,
                        id = model.id,
                    };
                    string fullPath = Request.MapPath("~/Repository/images/Restaurantes/" + novo.foto_capa);
                    if (System.IO.File.Exists(fullPath))
                    {
                        FileInfo fi = new FileInfo(fullPath);
                        novo.size = fi.Length;


                    }
                    return View(novo);
                };
            }
            catch (Exception)
            {


            }
            return View();

        }
        [ValidateInput(false)]
        public ActionResult SalvarAlteracoes(RestViewModel model)
        {
            try
            {
                using(var db=new mussika_bdEntities())
                {
                    restaurante edi = db.restaurantes.Where(r => r.id == model.id).SingleOrDefault();
                   List< restaurante> existe = db.restaurantes.Where(restaurante => restaurante.nome.Trim().ToLower() == model.nome.Trim().ToLower()).ToList();
                    if (existe.Count > 1)
                    {
                        return Content("existe");
                    }
                    edi.id_distrito = model.id_distrito;
                    edi.id_restaurante_tipo = model.id_restaurante_tipo;
                    edi.mapa = model.mapa;
                    edi.nome = model.nome;
                    edi.telefone = model.telefone;
                    edi.website = model.website;
                  
                    edi.descricao = model.descricao;
                    edi.email = model.email;
                    edi.endereco = model.endereco;

                    db.SaveChanges();
                    return Content("true");
                }
            }
            catch (Exception)
            {

                return Content("false");
            }
            
        }

        public ActionResult pratos(long id, int? page)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<restaurante_prato> itens = null;
                    ViewBag.autor = db.restaurantes.Where(p => p.id == id).SingleOrDefault();
                    ViewBag.id_autor = id;
                    itens = db.restaurante_prato.Where(q => q.id_resturante == id).ToList();
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

        public ActionResult CriarPrato(int id)
        {
            RestViewModel novo=null;
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<restaurante_prato_categoria> distritos_ = db.restaurante_prato_categoria.ToList();
                    ViewBag.categorias = new SelectList(distritos_, "id", "descricao");
                    restaurante model = db.restaurantes.Where(r => r.id == id).SingleOrDefault();

                    novo = new RestViewModel()
                    {
                        id_distrito = model.id_distrito??0,
                        nome = model.nome,
                        id_restaurante_tipo = model.id_restaurante_tipo??0,
                        email = model.email,
                        descricao = model.descricao,
                        endereco = model.endereco,
                        foto_capa = model.foto_capa,
                        mapa = model.mapa,
                        telefone = model.telefone,
                        website = model.website,
                        activo = true,
                        id = model.id,
                    };
                   
                   
                };
            }
            catch (Exception)
            {


            }
            return View(novo);
        }

        public ActionResult SalvarPratoRestaurante(restaurante_prato_view_model model)
        {
            long id = 0;
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    if (model.id <= 0)
                    {
                        restaurante_prato novo = new restaurante_prato()
                        {

                            data_cadastrro = DateTime.Now,
                            descricao = model.descricao,
                            foto_capa = "noimage.png",
                            id_resturante = model.id_resturante,
                            preco_venda = model.preco_venda,
                            inactivo = false,
                            nome = model.nome,
                            id__prato_categoria=model.id__prato_categoria,
                            peso=0,

                        };

                        db.restaurante_prato.Add(novo);
                        db.SaveChanges();
                        id = novo.id;
                    }
                    else
                    {
                        var evento = db.restaurante_prato.Where(e => e.id == model.id).SingleOrDefault();
                        evento.preco_venda = model.preco_venda;
                        evento.nome = model.nome;
                        evento.inactivo = model.inactivo;
                        evento.id__prato_categoria = model.id__prato_categoria;
                        evento.descricao = model.descricao;
                        evento.peso = 0;
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

        public ActionResult CarregarFotosRestaurantePrato(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var evento = db.restaurante_prato.Where(m => m.id == id).SingleOrDefault();
                ViewBag.id = evento.id_resturante;
                ViewBag.nome = evento.nome;
                return View(evento);
            }

        }

        public ActionResult SaveUploadedFileProduto(restaurante_prato model)
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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "Restaurantes");

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

                        string fullPath = Request.MapPath("~/Repository/images/Restaurantes/" + filename);
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
                    var qua = db.restaurante_prato.Where(f => f.id == id).SingleOrDefault();
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
        private bool verificarProduto(restaurante_prato model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    restaurante_prato evento_ = db.restaurante_prato.Where(r => r.id == model.id).SingleOrDefault();
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
            string pathString2 = System.IO.Path.Combine(originalDirectory.ToString(), "Restaurantes");
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

            bitMAP1.Save(Server.MapPath("~/Repository/images/Restaurantes/" + fileupload1.FileName));

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
                List<restaurante_prato_categoria> distritos_ = db.restaurante_prato_categoria.ToList();
                ViewBag.categorias = new SelectList(distritos_, "id", "descricao");

                var evento = db.restaurante_prato.Where(m => m.id == id).SingleOrDefault();

                return View(evento);
            }
        }
    }
}