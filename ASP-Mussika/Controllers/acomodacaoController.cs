
using ASP_Mussika.Models;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Web.Mvc;
using System.IO;
using PagedList;

namespace ASP_Mussika.Controllers
{
   
    public class acomodacaoController : Controller
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
        public ActionResult Index()
        {
            using (var db = new mussika_bdEntities())
            {
                List<distrito> distritos_ = db.distritoes.ToList();
                ViewBag.distritos = new SelectList(distritos_, "id", "nome");

                List<acomodacao_tipo> TipoAcomodacao_ = db.acomodacao_tipo.ToList();
                ViewBag.TipoAcomodacaos_ = new SelectList(TipoAcomodacao_, "id", "tipo");

            };
            return View();
        }

        public List<AcomodacaoViewModel> AcomodacaoList()
        {
            List<AcomodacaoViewModel> listaAcomodacao = new List<AcomodacaoViewModel>();

            using (var db = new mussika_bdEntities())
            {
                var acomodacoes = db.acomodacaos.Where(p => p.Inactivo == false).OrderByDescending(P => P.id); ;


                foreach (var model in acomodacoes)
                {
                    AcomodacaoViewModel ProVM = new AcomodacaoViewModel()
                    {
                        id_distrito = (int)model.id_distrito,
                        nome = model.nome,
                        id_acomodacao_tipo = (int)model.id_acomodacao_tipo,
                        email = model.email,
                        descricao = model.descricao,
                        endereco = model.endereco,
                        foto_capa = model.foto_capa,
                        mapa = model.mapa,
                        telefone = model.telefone,
                        website = model.website,
                        Inactivo =(model.Inactivo??false),
                        nomeDistrito = model.distrito.nome,
                        id = model.id,
                        nomeAcomodacaoTipo = model.acomodacao_tipo.tipo,
                    };
                    listaAcomodacao.Add(ProVM);
                }
            }
            return listaAcomodacao;


        }

        [HttpPost]
        public ActionResult carregarTabelaAcomodacaoByAjax(int draw, int start, int length)
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
                var produtos = AcomodacaoList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<AcomodacaoViewModel>;
                Func<AcomodacaoViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome" ? c.nome :
                                          sortColumn == "nomeDistrito" ? c.nomeDistrito :
                                          sortColumn == "nomeRestauranteTipo" ? c.nomeAcomodacaoTipo.ToString() :
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

        public ActionResult filtrarAcomodacoes(AcomodacaoViewModel model)
        {
            try
            {
                List<acomodacao> lista = null;
                List<AcomodacaoViewModel> listaFinal = new List<AcomodacaoViewModel>();
                using(var db=new mussika_bdEntities())
                {
                    lista = db.acomodacaos.ToList();
                    if (model.id_distrito != 0)
                    {
                        lista = lista.FindAll(a => a.id_distrito == model.id_distrito).ToList();
                    }
                    if (model.id_acomodacao_tipo != 0)
                    {
                        lista = lista.FindAll(a => a.id_acomodacao_tipo == model.id_acomodacao_tipo).ToList();
                    }
                  
                }

                foreach(var item in lista)
                {
                    AcomodacaoViewModel acomo = new AcomodacaoViewModel()
                    {
                        descricao = item.descricao,
                        email = item.email,
                        endereco = item.endereco,
                        foto_capa = item.foto_capa,
                        id_acomodacao_tipo = (int)item.id_acomodacao_tipo,
                        id_distrito = (int)item.id_distrito,
                        mapa = item.mapa,
                        nome = item.nome,
                        telefone = item.telefone,
                        website = item.website,
                        id = item.id,
                      
                    };
                    var nomeDit = procurarNomeDistrito((int)item.id_distrito);
                    var nomeAcom = procurarNomeTipoAcomodacao((int)item.id_acomodacao_tipo);

                    acomo.nomeAcomodacaoTipo = nomeAcom;
                    acomo.nomeDistrito = nomeDit;
                    listaFinal.Add(acomo);
                    
                }
                return Json(listaFinal, JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {

                return Content("false");
            }
        }

        private string procurarNomeTipoAcomodacao(int id_acomodacao_tipo)
        {
            using (var db = new mussika_bdEntities())
            {
                var tipo = db.acomodacao_tipo.Where(d => d.id == id_acomodacao_tipo).SingleOrDefault();
                return tipo.tipo;
            }
        }

        private string procurarNomeDistrito(int id_distrito)
        {
           using(var db=new mussika_bdEntities())
            {
                var distrito = db.distritoes.Where(d => d.id == id_distrito).SingleOrDefault();
                return distrito.nome;
            }
        }

        public ActionResult Criar()
        {
            using (var db = new mussika_bdEntities())
            {
                List<distrito> distritos_ = db.distritoes.ToList();
                ViewBag.distritos = new SelectList(distritos_, "id", "nome");

                List<acomodacao_tipo> TipoAcomodacao_ = db.acomodacao_tipo.ToList();
                ViewBag.TipoAcomodacaos_ = new SelectList(TipoAcomodacao_, "id", "tipo");

            };

            return View();
        }
        [ValidateInput(false)]
        public ActionResult finalizarCadastro(AcomodacaoViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    acomodacao acom = db.acomodacaos.Where(a => a.nome.Trim().ToLower() == model.nome.Trim().ToLower()).SingleOrDefault();
                    if (acom != null)
                    {
                        return Content("existe");
                    }
                    else
                    {
                        long usuario = long.Parse(Session["idusario"].ToString());
                        string userTipo = Session["tipo"].ToString();
                        acomodacao nova = new acomodacao()
                        {
                            descricao = model.descricao,
                            email = model.email,
                            endereco = model.endereco,
                            foto_capa = "noimage.png",
                            id_acomodacao_tipo = model.id_acomodacao_tipo,
                            id_distrito = model.id_distrito,
                            mapa = model.mapa,
                            nome = model.nome,
                            telefone = model.telefone,
                            website = model.website,
                            Inactivo = false,

                            
                        };
                        if (userTipo == "4")
                        {
                            nova.id_provedor = usuario;
                        }
                        db.acomodacaos.Add(nova);
                        db.SaveChanges();
                        return Content(nova.id.ToString());
                    }
                }
            }
            catch (Exception)
            {
                return Content("false");
                
            }
           
        }

        public ActionResult CarregarFotos(long id)
        {
            AcomodacaoViewModel model1=null;
            try
            {

                using (var db = new mussika_bdEntities())
                {
                    var model = db.acomodacaos.Where(r => r.id == id).SingleOrDefault();
                    model1 = new AcomodacaoViewModel()
                    {
                        descricao = model.descricao,
                        email = model.email,
                        endereco = model.endereco,
                        foto_capa = model.foto_capa,
                        id_acomodacao_tipo =(int) model.id_acomodacao_tipo,
                        id_distrito =(int) model.id_distrito,
                        mapa = model.mapa,
                        nome = model.nome,
                        telefone = model.telefone,
                        website = model.website,
                        id = model.id,
                    };

                };
            }
            catch (Exception)
            {

                return Content("false");
            }
            return View(model1);
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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "Acomodacoes");

                        var fileName1 = Path.GetFileName(file.FileName);
                        model.foto_capa = fileName1;
                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (verificarAcomodacao(model))
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
        public ActionResult RemoverFotoAcomodacao(string filename, long id)
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

                        string fullPath = Request.MapPath("~/Repository/images/Acomodacoes/" + filename);
                        if (System.IO.File.Exists(fullPath))
                        {
                            if (alterarCaminhoAcomodacao(id))
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

        private bool alterarCaminhoAcomodacao(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var qua = db.acomodacaos.Where(f => f.id == id).SingleOrDefault();
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

        private bool verificarAcomodacao(RestViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    acomodacao acomodacao_ = db.acomodacaos.Where(r => r.id == model.id).SingleOrDefault();
                    if (acomodacao_ != null)
                    {
                        acomodacao_.foto_capa = model.foto_capa;

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
            string pathString2 = System.IO.Path.Combine(originalDirectory.ToString(), "Acomodacoes");
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

            bitMAP1.Save(Server.MapPath("~/Repository/images/Acomodacoes/" + fileupload1.FileName));

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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "Acomodacoes");

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

        public ActionResult CarregarFotosAcomodacao(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<AcomFotoViewModel> listaFotos = new List<AcomFotoViewModel>();
                    List<acomodacao_foto> res_foto = db.acomodacao_foto.Where(rf => rf.id_acomodacao == id ).ToList();

                    if (res_foto.Count > 0)
                    {
                        foreach (var item in res_foto)
                        {


                            AcomFotoViewModel foto = new AcomFotoViewModel()
                            {
                               
                                caminho = item.caminho,
                                id = item.id,
                                id_acomodacao = (long)item.id_acomodacao,

                            };
                            string fullPath = Request.MapPath("~/Repository/images/Acomodacoes/" + item.caminho);
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
                            string fullPath = Request.MapPath("~/Repository/images/Acomodacoes/" + filename);
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
                    var rp = db.acomodacao_foto.Where(f => f.caminho.Trim().ToLower() == filename.Trim().ToLower()).SingleOrDefault();

                    db.acomodacao_foto.Remove(rp);                  
                    db.SaveChanges();

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
                    acomodacao acomodacao = db.acomodacaos.Where(r => r.id == model.id).SingleOrDefault();
                    if (acomodacao != null)
                    {
                        acomodacao_foto foto = new acomodacao_foto()
                        {
                            caminho = filename,
                            id_acomodacao = model.id,
                        };

                        db.acomodacao_foto.Add(foto);
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

        public ActionResult Quartos(long id, string sortOrder, string currentFilter, string searchString, int? page)
        {
            ViewBag.CurrentSort = sortOrder;
            ViewBag.NameSortParm = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            ViewBag.DateSortParm = sortOrder == "Date" ? "date_desc" : "Date";

            if (searchString != null)
            {
                page = 1;
            }
            else
            {
                searchString = currentFilter;
            }

            ViewBag.CurrentFilter = searchString;

            AcomodacaoViewModel model1 = null;
            List<acomodacao_quarto> quartos = null;
            try
            {
                

                using (var db = new mussika_bdEntities())
                {
                    var model = db.acomodacaos.Where(r => r.id == id).SingleOrDefault();
                    model1 = new AcomodacaoViewModel()
                    {
                        descricao = model.descricao,
                        email = model.email,
                        endereco = model.endereco,
                        foto_capa = model.foto_capa,
                        id_acomodacao_tipo = (int)model.id_acomodacao_tipo,
                        id_distrito = (int)model.id_distrito,
                        mapa = model.mapa,
                        nome = model.nome,
                        telefone = model.telefone,
                        website = model.website,
                        id=model.id,
                    };
                    ViewBag.Acomodacao = model;

                    quartos = db.acomodacao_quarto.Where(q => q.id_acomodacao == id).ToList();
                };
            }
            catch (Exception)
            {

                return Content("false");
            }
            int pageSize = 3;
            int pageNumber = (page ?? 1);
            return View(quartos.ToPagedList(pageNumber, pageSize));
          
            
        }

        public ActionResult CriarQuarto(long id)
        {
            AcomodacaoViewModel model1 = null;
            try
            {

                using (var db = new mussika_bdEntities())
                {
                    var model = db.acomodacaos.Where(r => r.id == id).SingleOrDefault();
                    model1 = new AcomodacaoViewModel()
                    {
                        descricao = model.descricao,
                        email = model.email,
                        endereco = model.endereco,
                        foto_capa = model.foto_capa,
                        id_acomodacao_tipo = (int)model.id_acomodacao_tipo,
                        id_distrito = (int)model.id_distrito,
                        mapa = model.mapa,
                        nome = model.nome,
                        telefone = model.telefone,
                        website = model.website,
                        id = model.id,
                    };

                };
            }
            catch (Exception)
            {

                return Content("false");
            }
            return View(model1);

        }
        [ValidateInput(false)]
        public ActionResult SalvarQuarto(QuartoViewModel model)
        {
            try
            {
                long id_quarto;
                using(var db=new mussika_bdEntities())
                {
                    
                        acomodacao_quarto nova = new acomodacao_quarto()
                        {
                            chk_ac = model.chk_ac,
                            chk_geleira = model.chk_geleira,
                            chk_minibar = model.chk_minibar,
                            chk_parqueamento = model.chk_parqueamento,
                            chk_televisao = model.chk_televisao,
                            chk_wifi = model.chk_wifi,
                            descricao = model.descricao,
                            custo_diaria = model.custo_diaria,
                            hospedes = model.hospedes,
                            id_acomodacao = model.id_acomodacao,
                            foto_capa = model.foto_capa,
                            quantidade = model.quantidade,
                            Inactivo = false,
                            observacoes=model.observacoes,
                            
                        
                            
                        };

                        db.acomodacao_quarto.Add(nova);
                        db.SaveChanges();
                        id_quarto = nova.id;

                       if(!checkFotoCapa(model.foto_capa))
                        {
                            nova.foto_capa = "noimage.png";
                            db.SaveChanges();
                        }
                    
                };
                return Content(id_quarto.ToString());
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

                bitMAP1.Save(Server.MapPath("~/Repository/images/Acomodacoes/" + fileName));

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

        public ActionResult SaveUploadedFileQuarto(RestViewModel model)
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
                        model.foto_capa = fileName1;
                        bool isExists = System.IO.Directory.Exists(pathString);

                       
                            if (!isExists) { 
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

        public ActionResult RemoverFotoTempQuarto(string filename, long id)
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

        public ActionResult EditarQuarto(long id)
        {
            QuartoViewModel model = null;
            try
            {

                using(var db=new mussika_bdEntities())
                {
                    var quarto = db.acomodacao_quarto.Where(q => q.id == id).SingleOrDefault();
                    model = new QuartoViewModel()
                    {
                        id=quarto.id,
                        id_acomodacao=(int)quarto.id_acomodacao,
                        chk_ac= (bool)quarto.chk_ac,
                        chk_geleira= (bool)quarto.chk_geleira,
                        chk_minibar= (bool)quarto.chk_minibar,
                        chk_parqueamento= (bool)quarto.chk_parqueamento,
                        chk_televisao= (bool)quarto.chk_televisao,
                        chk_wifi=(bool)quarto.chk_wifi,
                        descricao=quarto.descricao,
                        foto_capa=quarto.foto_capa,
                        hospedes=(int)quarto.hospedes,
                        quantidade=(int)quarto.quantidade,
                        custo_diaria=(decimal)quarto.custo_diaria,
                        Inactivo=(bool)(quarto.Inactivo?? false),
                        observacoes=quarto.observacoes,
                    };

                   
                }
                
            }
            catch (Exception)
            {

              
            }
            return View(model);
        }

        public ActionResult RemoverFotoQuarto(string filename, long id)
        {
            try
            {
                if (!string.IsNullOrEmpty(filename))
                {
                    if (filename.Trim().ToLower() != "noimage.png")
                    {
                        string fullPathTemp = Request.MapPath("~/Repository/images/tempImage/" + filename);
                        if (System.IO.File.Exists(fullPathTemp))
                        {

                            System.IO.File.Delete(fullPathTemp);

                        }

                        string fullPath = Request.MapPath("~/Repository/images/Acomodacoes/" + filename);
                            if (System.IO.File.Exists(fullPath))
                            {
                                if (alterarCaminho(id))
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

        private bool alterarCaminho(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var qua = db.acomodacao_quarto.Where(f => f.id == id).SingleOrDefault();
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
        [ValidateInput(false)]
        public ActionResult salvarAlteracoes(QuartoViewModel model)
        {
            try
            {
                using(var db=new mussika_bdEntities())
                {
                    //var ExisteQuarto = db.acomodacao_quarto.Where(q => q.descricao.Trim().ToLower() == model.descricao.Trim().ToLower()&&q.id!=model.id).SingleOrDefault();
                    //if (ExisteQuarto != null)
                    //{
                    //    return Content("existe");
                    //}

                    var quarto = db.acomodacao_quarto.Where(q => q.id == model.id).SingleOrDefault();
                    if (quarto != null)
                    {
                        quarto.descricao = model.descricao;
                        quarto.Inactivo = model.Inactivo;
                        quarto.observacoes = model.observacoes;
                        quarto.quantidade = model.quantidade;
                        quarto.quarto_foto = model.quarto_foto;
                        quarto.chk_ac = model.chk_ac;
                        quarto.chk_geleira = model.chk_geleira;
                        quarto.chk_minibar = model.chk_minibar;
                        quarto.chk_parqueamento = model.chk_parqueamento;
                        quarto.chk_televisao = model.chk_televisao;
                        quarto.chk_wifi = model.chk_wifi;
                        quarto.custo_diaria = model.custo_diaria;
                        
                        db.SaveChanges();
                        if (!string.IsNullOrEmpty(model.foto_capa))
                        {
                            if (model.foto_capa.Trim() != quarto.foto_capa.Trim())
                            {
                                if (!checkFotoCapa(model.foto_capa))
                                {
                                    quarto.foto_capa = "noimage.png";
                                    db.SaveChanges();
                                }
                                else
                                {
                                    quarto.foto_capa = model.foto_capa;
                                    db.SaveChanges();
                                }
                            }
                        }
                        

                    }
                    
                }
            }
            catch (Exception)
            {

                return Content("false");
            }
            return Content("true");
        }

        public ActionResult pageNotFound()
        {
            return View();
        }

        public ActionResult EditarAcomodacao(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                List<distrito> distritos_ = db.distritoes.ToList();
                ViewBag.distritos = new SelectList(distritos_, "id", "nome");

                List<acomodacao_tipo> TipoAcomodacao_ = db.acomodacao_tipo.ToList();
                ViewBag.TipoAcomodacaos_ = new SelectList(TipoAcomodacao_, "id", "tipo");

            };
            AcomodacaoViewModel model1 = null;
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var model = db.acomodacaos.Where(a => a.id == id).SingleOrDefault();
                        model1 = new AcomodacaoViewModel()
                        {
                            descricao = model.descricao,
                            email = model.email,
                            endereco = model.endereco,
                            foto_capa = model.foto_capa,
                            id_acomodacao_tipo = (int)model.id_acomodacao_tipo,
                            id_distrito = (int)model.id_distrito,
                            mapa = model.mapa,
                            nome = model.nome,
                            telefone = model.telefone,
                            website = model.website,
                            id = model.id,
                            Inactivo=model.Inactivo??false,
                            nomeAcomodacaoTipo=model.acomodacao_tipo.tipo,
                            nomeDistrito=model.distrito.nome,
                        };
                    } 
                
            }
            catch (Exception)
            {

                return RedirectToRoute(new { controller = "inicio", action = "InternalServerError" });
            }

            return View(model1);
        }
        [ValidateInput(false)]
        public ActionResult salvarAlteracoesAcomodacao(AcomodacaoViewModel model)
        {
           
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var acomodacao_ = db.acomodacaos.Where(a => a.id == model.id).SingleOrDefault();
                    acomodacao_.nome = model.nome;
                    acomodacao_.telefone = model.telefone;
                    acomodacao_.website = model.website;
                    acomodacao_.descricao = model.descricao;
                    acomodacao_.email = model.email;
                    acomodacao_.endereco = model.endereco;
                    acomodacao_.id_acomodacao_tipo = model.id_acomodacao_tipo;
                    acomodacao_.id_distrito = model.id_distrito;
                    acomodacao_.Inactivo = model.Inactivo;
                    acomodacao_.mapa = model.mapa;
                    db.SaveChanges();
                  
                }

            }
            catch (Exception)
            {

                return Content("false");
            }

            return Content(model.id.ToString());
        }
        // GET: acomodacao
        //public ActionResult listagem()
        //{
        //    List<distrito> model = new List<distrito>();

        //    //try
        //    //{

        //    //    using (var uow = new UnitOfWork(new dc_MussikaDataContext()))
        //    //    {
        //    //        model = uow.Distritos.GetAll().ToList();
        //    //    }

        //    //}
        //    //catch (Exception) { }

        //    return View(model);
        //}


        ////public ActionResult acomodacoes_partial(int id_distrito = 0, string nome = "", string indice = "0", string perpage = "6")
        ////{
        ////    int indc = int.Parse(indice);
        ////    int pp = int.Parse(perpage);


        ////    List<acomodacao> lista_acomodacoes = new List<acomodacao>();
        ////    List<acomodacao_ViewModel> model = new List<acomodacao_ViewModel>();

        ////    try
        ////    {
        ////        using (var uow = new UnitOfWork(new dc_MussikaDataContext()))
        ////        {
        ////            lista_acomodacoes = uow.Acomodacoes.GetAll().ToList();

        ////            if (id_distrito > 0)
        ////            {
        ////                lista_acomodacoes = lista_acomodacoes.Where(x => x.id_distrito == id_distrito).ToList();
        ////            }

        ////            if (!string.IsNullOrEmpty(nome))
        ////            {
        ////                lista_acomodacoes = lista_acomodacoes.Where(x => x.nome.ToLower().Trim().Contains(nome.ToLower().Trim())).ToList();
        ////            }

        ////            foreach (acomodacao s in lista_acomodacoes)
        ////            {
        ////                acomodacao_ViewModel sd = new acomodacao_ViewModel();
        ////                sd.id = s.id;
        ////                sd.nome = s.nome;
        ////                sd.endereco = s.endereco;
        ////                sd.telefone = s.telefone;
        ////                sd.email = s.email;
        ////                sd.descricao = GetPlainTextFromHtml(s.descricao);
        ////                if (sd.descricao.Length > 145)
        ////                {
        ////                    sd.descricao = sd.descricao.Substring(0, 145) + "...";
        ////                }
        ////                sd.id_distrito = (int)s.id_distrito;
        ////                sd.caminho_imagem = s.foto_capa.Trim();
        ////                //sd.classificao = 0;
        ////                model.Add(sd);
        ////            }
        ////        }

        ////    }
        ////    catch (Exception) { }

        ////    ViewBag.current_page = indice;
        ////    ViewBag.records_perpage = pp;
        ////    ViewBag.lista_acomodacoes = model;

        ////    return PartialView("~/Views/distritos/Partials/acomodacoes_partial.cshtml", model.Skip(indc).Take(pp).ToList());
        ////}


        ////public ActionResult perfil(long id)
        ////{
        ////    acomodacao_ViewModel model = new acomodacao_ViewModel();

        ////    try
        ////    {
        ////        using (var uow = new UnitOfWork(new dc_MussikaDataContext()))
        ////        {
        ////            acomodacao acd = new acomodacao();
        ////            acd = uow.Acomodacoes.Find(x => x.id == id).SingleOrDefault<acomodacao>();

        ////            model.id = acd.id;
        ////            model.nome = acd.nome;
        ////            model.endereco = acd.endereco;
        ////            model.telefone = acd.telefone;
        ////            model.email = acd.email;
        ////            model.descricao = acd.descricao;
        ////            model.caminho_imagem = acd.foto_capa;
        ////            model.website = acd.website;
        ////            model.linkmapa = acd.mapa;
        ////            model.distrito = acd.distrito.nome;
        ////            model.classificao = 0;
        ////            model.servicos = new List<string>();
        ////            model.fotos = new List<string>();
        ////            model.quartos = new List<QuartosAcomodacao_ViewModel>();

        ////            if (acd.acomodacao_servicos.ToList().Count > 0)
        ////            {
        ////                List<string> servicos = new List<string>();
        ////                foreach (acomodacao_servico ac in acd.acomodacao_servicos)
        ////                {

        ////                    servicos.Add(ac.descricao);
        ////                }
        ////                model.servicos = servicos;

        ////            }

        ////            if (acd.acomodacao_fotos.ToList().Count > 0)
        ////            {
        ////                List<string> fotos = new List<string>();
        ////                foreach (acomodacao_foto ac in acd.acomodacao_fotos)
        ////                {
        ////                    string cm = ac.caminho.Replace(" ", "");
        ////                    ac.caminho = cm;
        ////                    fotos.Add(ac.caminho.Trim());
        ////                }
        ////                model.fotos = fotos;
        ////            }

        ////            if (acd.acomodacao_quartos.ToList().Count > 0)
        ////            {
        ////                List<QuartosAcomodacao_ViewModel> quartos = new List<QuartosAcomodacao_ViewModel>();

        ////                foreach (acomodacao_quarto ac in acd.acomodacao_quartos)
        ////                {
        ////                    QuartosAcomodacao_ViewModel qt = new QuartosAcomodacao_ViewModel();
        ////                    qt.id = ac.id;
        ////                    qt.descricao = ac.descricao;
        ////                    qt.hospedes = (int)ac.hospedes;
        ////                    qt.custo_diaria = (float)ac.custo_diaria;
        ////                    qt.quantidade_quartos = (int)ac.quantidade;
        ////                    qt.caminho_imagem = ac.foto_capa;
        ////                    qt.id_acomodacao = (long)ac.id_acomodacao;
        ////                    quartos.Add(qt);
        ////                }

        ////                model.quartos = quartos;
        ////            }

        ////        }
        ////    }
        ////    catch (Exception) { }

        ////    return View(model);
        ////}

        ////public ActionResult disponibilidade_quarto(string scheckin = "", string scheckout = "", int id_distrito = 0, int id_acomodacao = 0, int id_tipo_acomodacao = 0, string indice = "0", string perpage = "6", bool chk_ac = false, bool chk_parqueamento = false, bool chk_televisao = false, bool chk_geleira = false, bool chk_wifi = false, bool chk_minibar = false)
        ////{

        ////    int indc = int.Parse(indice);
        ////    int pp = int.Parse(perpage);

        ////    List<QuartosAcomodacao_ViewModel> model = new List<QuartosAcomodacao_ViewModel>();

        ////    DateTime hoje = System.DateTime.Now.Date;
        ////    DateTime checkin = hoje;
        ////    DateTime checkout = hoje;

        ////    QuartoDisponibilidade_ViewModel QDs = new QuartoDisponibilidade_ViewModel();

        ////    try
        ////    {
        ////        using (var uow = new UnitOfWork(new dc_MussikaDataContext()))
        ////        {

        ////            if (id_acomodacao > 0 && id_distrito == 0)
        ////            {
        ////                id_distrito = (int)uow.Acomodacoes.Find(x => x.id == id_acomodacao).SingleOrDefault<acomodacao>().id_distrito;
        ////            }

        ////            if ((string.IsNullOrEmpty(scheckin) || string.IsNullOrEmpty(scheckout)))
        ////            {
        ////                checkin = hoje; checkout = hoje.AddDays(1);
        ////            }
        ////            else
        ////            {
        ////                checkin = DateTime.Parse(scheckin); checkout = DateTime.Parse(scheckout);
        ////            }

        ////            if (checkin < hoje || checkout < hoje)
        ////            {
        ////                checkin = hoje; checkout = hoje.AddDays(1);
        ////            }


        ////            //
        ////            List<acomodacao_quarto> LQuartos = uow.QuartosAcomodacao.GetAll().ToList();
        ////            List<acomodacao_quarto> LQuartos_ = uow.QuartosAcomodacao.GetAll().ToList();

        ////            if (id_tipo_acomodacao > 0) { LQuartos = LQuartos.Where(x => x.acomodacao.id_acomodacao_tipo == id_tipo_acomodacao).ToList(); }
        ////            if (id_distrito > 0) { LQuartos = LQuartos.Where(x => x.acomodacao.id_distrito == id_distrito).ToList(); }
        ////            if (id_acomodacao > 0) { LQuartos = LQuartos.Where(x => x.id_acomodacao == id_acomodacao).ToList(); }

        ////            if (chk_ac == true) { LQuartos = LQuartos.Where(x => x.chk_ac == true).ToList(); }
        ////            if (chk_geleira == true) { LQuartos = LQuartos.Where(x => x.chk_geleira == true).ToList(); }
        ////            if (chk_minibar == true) { LQuartos = LQuartos.Where(x => x.chk_minibar == true).ToList(); }
        ////            if (chk_parqueamento == true) { LQuartos = LQuartos.Where(x => x.chk_parqueamento == true).ToList(); }
        ////            if (chk_televisao == true) { LQuartos = LQuartos.Where(x => x.chk_televisao == true).ToList(); }
        ////            if (chk_wifi == true) { LQuartos = LQuartos.Where(x => x.chk_wifi == true).ToList(); }

        ////            //datas
        ////            List<DateTime> datas = new List<DateTime>();

        ////            for (var dt = checkin; dt <= checkout; dt = dt.AddDays(1))
        ////            {
        ////                datas.Add(dt);
        ////            }

        ////            foreach (acomodacao_quarto aq in LQuartos)
        ////            {
        ////                int tot_quartos = (int)aq.quantidade;
        ////                int tot_disponiveis = 0;
        ////                int tot_ocupados = 0;

        ////                int count = 0;

        ////                List<acomodacao_disponibilidade> disponibilidades = uow.AcomodacaoDisponibilidade.Find(x => x.id_acomodacao_quarto == aq.id).ToList();
        ////                foreach (acomodacao_disponibilidade ad in disponibilidades)
        ////                {
        ////                    foreach (DateTime dt in datas)
        ////                    {
        ////                        if (ad.checkin.Value.Date == dt.Date || (ad.checkout.Value.Date == dt.Date && datas.IndexOf(dt) + 1 < datas.Count))
        ////                        {
        ////                            count++;
        ////                        }
        ////                    }
        ////                    if (count > 0) { tot_ocupados++; }
        ////                }

        ////                tot_disponiveis = tot_quartos - tot_ocupados;

        ////                if (tot_disponiveis > 0)
        ////                {

        ////                    QuartosAcomodacao_ViewModel qa = new QuartosAcomodacao_ViewModel();
        ////                    qa.id = aq.id;
        ////                    qa.descricao = aq.descricao;
        ////                    qa.hospedes = (int)aq.hospedes;
        ////                    qa.custo_diaria = (float)aq.custo_diaria;
        ////                    qa.quantidade_quartos = (int)aq.quantidade;
        ////                    qa.quantidade_disponivel = tot_disponiveis;
        ////                    qa.caminho_imagem = aq.foto_capa;
        ////                    qa.chk_ac = (bool)aq.chk_ac;
        ////                    qa.chk_parqueamento = (bool)aq.chk_parqueamento;
        ////                    qa.chk_televisao = (bool)aq.chk_parqueamento;
        ////                    qa.chk_geleira = (bool)aq.chk_geleira;
        ////                    qa.chk_wifi = (bool)aq.chk_wifi;
        ////                    qa.chk_minibar = (bool)aq.chk_minibar;
        ////                    qa.id_acomodacao = (long)aq.id_acomodacao;
        ////                    qa.nome_acomodacao = aq.acomodacao.nome;
        ////                    model.Add(qa);

        ////                }
        ////            }
        ////            //


        ////            List<distrito> lista_distritos = uow.Distritos.GetAll().ToList();
        ////            List<acomodacao> lista_acomodacoes = uow.Acomodacoes.GetAll().ToList();
        ////            List<acomodacao_tipo> tipos_acomodacao = uow.TiposAcomodacao.GetAll().ToList();

        ////            QDs.chekin = checkin;
        ////            QDs.checkout = checkout;
        ////            QDs.Distritos = lista_distritos;
        ////            QDs.Acomodacoes = lista_acomodacoes;
        ////            QDs.TiposAcomodacao = tipos_acomodacao;
        ////            lista_acomodacoes.ForEach(x => QDs.Acomodacoes.Add(x));

        ////        }
        ////    }
        ////    catch (Exception) { }





        ////    ViewBag.QDs = QDs;
        ////    ViewBag.id_distrito = id_distrito;
        ////    ViewBag.id_acomodacao = id_acomodacao;

        ////    ViewBag.checkin = checkin.ToString("yyyy-MM-dd");
        ////    ViewBag.checkout = checkout.ToString("yyyy-MM-dd");

        ////    ViewBag.current_page = indice;
        ////    ViewBag.records_perpage = pp;
        ////    ViewBag.lista_registos = model;

        ////    ViewBag.check_ac = chk_ac.ToString();
        ////    ViewBag.check_parqueamento = chk_parqueamento.ToString();
        ////    ViewBag.check_televisao = chk_televisao.ToString();
        ////    ViewBag.check_geleira = chk_geleira.ToString();
        ////    ViewBag.check_wifi = chk_wifi.ToString();
        ////    ViewBag.check_minibar = chk_minibar.ToString();

        ////    return View(model.Skip(indc).Take(pp).ToList());
        ////}


        ////public ActionResult disponibilidade_lista_partial(string scheckin = "", string scheckout = "", int id_distrito = 0, int id_tipo_acomodacao = 0, string indice = "0", string perpage = "6", bool chk_ac = false, bool chk_parqueamento = false, bool chk_televisao = false, bool chk_geleira = false, bool chk_wifi = false, bool chk_minibar = false)
        ////{


        ////    int indc = int.Parse(indice);
        ////    int pp = int.Parse(perpage);

        ////    List<QuartosAcomodacao_ViewModel> model = new List<QuartosAcomodacao_ViewModel>();

        ////    DateTime checkin = new DateTime();
        ////    DateTime checkout = new DateTime();


        ////    try
        ////    {
        ////        using (var uow = new UnitOfWork(new dc_MussikaDataContext()))
        ////        {

        ////            try { checkin = DateTime.Parse(scheckin); checkout = DateTime.Parse(scheckout); } catch (Exception) { }

        ////            List<acomodacao_quarto> LQuartos = uow.QuartosAcomodacao.GetAll().ToList();
        ////            List<acomodacao_quarto> LQuartos_ = uow.QuartosAcomodacao.GetAll().ToList();

        ////            if (id_tipo_acomodacao > 0) { LQuartos = LQuartos.Where(x => x.acomodacao.id_acomodacao_tipo == id_tipo_acomodacao).ToList(); }
        ////            if (id_distrito > 0) { LQuartos = LQuartos.Where(x => x.acomodacao.id_distrito == id_distrito).ToList(); }

        ////            if (chk_ac == true) { LQuartos = LQuartos.Where(x => x.chk_ac == true).ToList(); }
        ////            if (chk_geleira == true) { LQuartos = LQuartos.Where(x => x.chk_geleira == true).ToList(); }
        ////            if (chk_minibar == true) { LQuartos = LQuartos.Where(x => x.chk_minibar == true).ToList(); }
        ////            if (chk_parqueamento == true) { LQuartos = LQuartos.Where(x => x.chk_parqueamento == true).ToList(); }
        ////            if (chk_televisao == true) { LQuartos = LQuartos.Where(x => x.chk_televisao == true).ToList(); }
        ////            if (chk_wifi == true) { LQuartos = LQuartos.Where(x => x.chk_wifi == true).ToList(); }

        ////            //datas
        ////            List<DateTime> datas = new List<DateTime>();

        ////            for (var dt = checkin; dt <= checkout; dt = dt.AddDays(1))
        ////            {
        ////                datas.Add(dt);
        ////            }

        ////            foreach (acomodacao_quarto aq in LQuartos)
        ////            {
        ////                int tot_quartos = (int)aq.quantidade;
        ////                int tot_disponiveis = 0;
        ////                int tot_ocupados = 0;

        ////                int count = 0;

        ////                List<acomodacao_disponibilidade> disponibilidades = uow.AcomodacaoDisponibilidade.Find(x => x.id_acomodacao_quarto == aq.id).ToList();
        ////                foreach (acomodacao_disponibilidade ad in disponibilidades)
        ////                {
        ////                    foreach (DateTime dt in datas)
        ////                    {
        ////                        if (ad.checkin.Value.Date == dt.Date || (ad.checkout.Value.Date == dt.Date && datas.IndexOf(dt) + 1 < datas.Count))
        ////                        {
        ////                            count++;
        ////                        }
        ////                    }
        ////                    if (count > 0) { tot_ocupados++; }
        ////                }

        ////                tot_disponiveis = tot_quartos - tot_ocupados;

        ////                if (tot_disponiveis > 0)
        ////                {

        ////                    QuartosAcomodacao_ViewModel qa = new QuartosAcomodacao_ViewModel();
        ////                    qa.id = aq.id;
        ////                    qa.descricao = aq.descricao;
        ////                    qa.hospedes = (int)aq.hospedes;
        ////                    qa.custo_diaria = (float)aq.custo_diaria;
        ////                    qa.quantidade_quartos = (int)aq.quantidade;
        ////                    qa.quantidade_disponivel = tot_disponiveis;
        ////                    qa.caminho_imagem = aq.foto_capa;
        ////                    qa.chk_ac = (bool)aq.chk_ac;
        ////                    qa.chk_parqueamento = (bool)aq.chk_parqueamento;
        ////                    qa.chk_televisao = (bool)aq.chk_parqueamento;
        ////                    qa.chk_geleira = (bool)aq.chk_geleira;
        ////                    qa.chk_wifi = (bool)aq.chk_wifi;
        ////                    qa.chk_minibar = (bool)aq.chk_minibar;
        ////                    qa.id_acomodacao = (long)aq.id_acomodacao;
        ////                    qa.nome_acomodacao = aq.acomodacao.nome;
        ////                    model.Add(qa);

        ////                }
        ////            }


        ////        }
        ////    }
        ////    catch (Exception) { }



        ////    ViewBag.current_page = indice;
        ////    ViewBag.records_perpage = pp;
        ////    ViewBag.lista_registos = model;

        ////    return PartialView("~/Views/acomodacao/Partials/disponibilidade_lista_partials_.cshtml", View(model.Skip(indc).Take(pp).ToList()));
        ////}




        ////public ActionResult pagamento(long id_quarto = 0)
        ////{
        ////    try
        ////    {
        ////        using (var uow = new UnitOfWork(new dc_MussikaDataContext()))
        ////        {
        ////            //acomodacao_quarto aq = uow.QuartosAcomodacao.Find(x => x.id == id_quarto).SingleOrDefault<acomodacao_quarto>();

        ////        }

        ////    }
        ////    catch (Exception) { }
        ////    return View();

        ////}

        //public ActionResult confirmacao_booking()
        //{
        //    return View();
        //}

        //public ActionResult factura()
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