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
    public class TaxiController : Controller
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
        // GET: Taxi
        public ActionResult Index()
        {
            return View();
        }
        public List<TaxiViewModel> TaxisList()
        {
            List<TaxiViewModel> listaTaxis = new List<TaxiViewModel>();

            using (var db = new mussika_bdEntities())
            {
                var taxis = db.taxis.Where(t=>t.Inactivo==false).OrderByDescending(P => P.id); 


                foreach (var model in taxis)
                {
                    TaxiViewModel ProVM = new TaxiViewModel()
                    {

                        id = model.id,
                        Inactivo = (bool)model.Inactivo,
                        bairro = model.bairro,
                        condutor = model.condutor,
                        cor=model.cor,
                         foto_capa=model.foto_capa,
                        email=model.email,
                        marca=model.marca,
                        id_distrito=(int)model.id_distrito,
                        matricula=model.matricula,
                        nome=model.nome.ToUpper(),
                        nomeDistrito=model.distrito.nome.ToUpper(),
                        praca_fixa=model.praca_fixa,
                        proprietario=model.proprietario,
                        telefone=model.telefone,
                    };
                    listaTaxis.Add(ProVM);
                }
            }
            return listaTaxis;


        }

        [HttpPost]
        public ActionResult carregarTabelaTaxiByAjax(int draw, int start, int length)
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
                var produtos = TaxisList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<TaxiViewModel>;
                Func<TaxiViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome" ? c.nome :
                                          sortColumn == "nomeDistrito" ? c.nomeDistrito :
                                          sortColumn == "praca_fixa" ? c.praca_fixa :
                                          sortColumn == "condutor" ? c.condutor :

                                          sortColumn == "matricula" ? c.matricula


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

        public ActionResult criarTaxi()
        {
            using (var db = new mussika_bdEntities())
            {
                List<taxi_categoria> Tipo = db.taxi_categoria.ToList();
                ViewBag.categoria = new SelectList(Tipo, "id", "descricao");

                List<distrito> distritos_ = db.distritoes.ToList();
                ViewBag.distritos = new SelectList(distritos_, "id", "nome");


            };
            return View();
        }
        [ValidateInput(false)]
        public ActionResult SalvarTaxi(TaxiViewModel model)
        {
            try
            {
                using(var db=new mussika_bdEntities())
                {
                    taxi novo = new taxi()
                    {
                        bairro=model.bairro,
                        condutor=model.condutor,
                        cor=model.cor,
                        email=model.email,
                        foto_capa="noimage.png",
                        id_distrito=model.id_distrito,
                        Inactivo=false,
                        marca=model.marca,
                        matricula=model.matricula,
                        nome=model.nome,
                        praca_fixa=model.praca_fixa,
                        proprietario=model.proprietario,
                        telefone=model.telefone,
                        id_categoria=model.id_categoria,

                    };
                    db.taxis.Add(novo);
                    db.SaveChanges();
                    return Content(novo.id.ToString());
                }
            }
            catch (Exception)
            {

                return Content("false");
            }
        }

        public ActionResult CarregarFotos(int id)
        {
            using (var db = new mussika_bdEntities())
            {
                taxi model = db.taxis.Where(d => d.id == id).SingleOrDefault();
                TaxiViewModel model1 = new TaxiViewModel()
                {
                    bairro = model.bairro,
                    condutor = model.condutor,
                    cor = model.cor,
                    email = model.email,
                    foto_capa = model.foto_capa,
                    id_distrito = (int)model.id_distrito,
                    Inactivo = (bool)model.Inactivo,
                    marca = model.marca,
                    matricula = model.matricula,
                    nome = model.nome,
                    praca_fixa = model.praca_fixa,
                    proprietario = model.proprietario,
                    telefone = model.telefone,
                    id=model.id,

                };

                return View(model1);
            }
        }

        public ActionResult SaveUploadedFile(TaxiViewModel model)
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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "Taxis");

                        var fileName1 = Path.GetFileName(file.FileName);
                        model.foto_capa = fileName1;
                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (verificarTaxi(model))
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

        private bool verificarTaxi(TaxiViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    taxi taxi = db.taxis.Where(r => r.id == model.id).SingleOrDefault();
                    if (taxi != null)
                    {
                        taxi.foto_capa = model.foto_capa;

                        db.SaveChanges();
                        return true;
                    }else
                    {
                        return false;
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
            string pathString2 = System.IO.Path.Combine(originalDirectory.ToString(), "Taxis");
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

            bitMAP1.Save(Server.MapPath("~/Repository/images/Taxis/" + fileupload1.FileName));

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

        public ActionResult RemoverFotoTaxi(string filename, long id)
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

                        string fullPath = Request.MapPath("~/Repository/images/Taxis/" + filename);
                        if (System.IO.File.Exists(fullPath))
                        {
                            if (alterarCaminhoTaxi(id))
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

        private bool alterarCaminhoTaxi(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var qua = db.taxis.Where(f => f.id == id).SingleOrDefault();
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

        public ActionResult EditarTaxi(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                List<taxi_categoria> Tipo = db.taxi_categoria.ToList();
                ViewBag.categoria = new SelectList(Tipo, "id", "descricao");

                List<distrito> distritos_ = db.distritoes.ToList();
                ViewBag.distritos = new SelectList(distritos_, "id", "nome");

                taxi model = db.taxis.Where(d => d.id == id).SingleOrDefault();
                TaxiViewModel model1 = new TaxiViewModel()
                {
                    bairro = model.bairro,
                    condutor = model.condutor,
                    cor = model.cor,
                    email = model.email,
                    foto_capa = model.foto_capa,
                    id_distrito = (int)model.id_distrito,
                    Inactivo = (bool)model.Inactivo,
                    marca = model.marca,
                    matricula = model.matricula,
                    nome = model.nome,
                    praca_fixa = model.praca_fixa,
                    proprietario = model.proprietario,
                    telefone = model.telefone,
                    id = model.id,
                    id_categoria=model.id_categoria??0,

                };

                return View(model1);
            }
        }
        [ValidateInput(false)]
        public ActionResult salvarAlteracoes(TaxiViewModel model)
        {
            try
            {
                using(var db=new mussika_bdEntities())
                {
                    var taxi = db.taxis.Where(t => t.id == model.id).SingleOrDefault();
                    taxi.id_distrito = model.id_distrito;
                    taxi.Inactivo = model.Inactivo;
                    taxi.marca = model.marca;
                    taxi.matricula = model.matricula;
                    taxi.nome = model.nome;
                    taxi.praca_fixa = model.praca_fixa;
                    taxi.proprietario = model.proprietario;
                    taxi.proprietario = model.proprietario;
                    taxi.telefone = model.telefone;
                    taxi.bairro = model.bairro;
                    taxi.condutor = model.condutor;
                    taxi.cor = model.cor;
                    taxi.email = model.email;
                    taxi.id_categoria = model.id_categoria;
                    db.SaveChanges();
                    return Content (taxi.id.ToString());
                }
            }
            catch (Exception)
            {

                return Content("false");
            }
        }
    }
}