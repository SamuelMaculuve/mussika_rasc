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
    public class SaudeController : Controller
    {
        // GET: Saude
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult gestao(int page = 1,string filtro="", string filtroFarmacia = "")
        {
            TempData["page"] = page;
            TempData["filtro"] = filtro;
            TempData["filtroFarmacia"] = filtroFarmacia;
           
            return View();
        }

        public List<HospitalViewModel> HospitaisList()
        {
            List<HospitalViewModel> listaArtigos = new List<HospitalViewModel>();
            long id_prov = long.Parse(Session["idusario"].ToString());
            using (var db = new mussika_bdEntities())
            {
                var artigos = db.hospitals.Where(P => P.id_provedor==id_prov); ;


                foreach (var model in artigos)
                {
                    HospitalViewModel ProVM = new HospitalViewModel()
                    {
                        id = model.id,

                        data_cadastro = DateTime.Now,
                        descricao = model.descricao,
                        foto_capa = "noimage.png",
                        id_distrito = (int)model.id_distrito,
                        inactivo = (bool)model.inactivo,
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
        public ActionResult carregarTabelaHospitaisByAjax(int draw, int start, int length)
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
                var produtos = HospitaisList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<HospitalViewModel>;
                Func<HospitalViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome" ? c.nome :
                                           sortColumn == "bairro" ? c.bairro :
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

        public ActionResult criar()
        {
            using (var db = new mussika_bdEntities())
            {
                List<distrito> distritos_ = db.distritoes.ToList();
                ViewBag.distritos = new SelectList(distritos_, "id", "nome");
                return View();
            }
        }

        public ActionResult salvar(HospitalViewModel model)
        {
            //DateTime data_Evento = DateTime.Parse(model.data_evento_convertido);
            long id = 0;
            long id_prov = long.Parse(Session["idusario"].ToString());
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    if (model.id <= 0)
                    {
                        hospital novo = new hospital()
                        {
                            id_provedor=id_prov,
                            data_cadastro = DateTime.Now,
                            descricao = model.descricao,
                            foto_capa = "noimage.png",
                            id_distrito = model.id_distrito,
                            inactivo = model.inactivo,
                            bairro = model.bairro,
                            nome = model.nome,

                        };

                        db.hospitals.Add(novo);
                        db.SaveChanges();
                        id = novo.id;
                    }
                    else
                    {
                        var evento = db.hospitals.Where(e => e.id == model.id).SingleOrDefault();
                        evento.id_distrito = model.id_distrito;
                        evento.inactivo = model.inactivo;
                        
                        evento.bairro = model.bairro;
                        evento.nome = model.nome;
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
                var evento = db.hospitals.Where(m => m.id == id).SingleOrDefault();
                ViewBag.id = id;
                ViewBag.nome = evento.nome;
                return View(evento);
            }

        }

        public ActionResult SaveUploadedFile(HospitalViewModel model)
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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "hospitais");

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
        public ActionResult RemoverFotoHospital(string filename, long id)
        {
            try
            {
                if (!string.IsNullOrEmpty(filename))
                {
                    if (filename.Trim().ToLower() != "noimage.png")
                    {

                        string fullPath = Request.MapPath("~/Repository/images/hospitais/" + filename);
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
                    var qua = db.hospitals.Where(f => f.id == id).SingleOrDefault();
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
        private bool verificarMusica(HospitalViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    hospital evento_ = db.hospitals.Where(r => r.id == model.id).SingleOrDefault();
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
            string pathString2 = System.IO.Path.Combine(originalDirectory.ToString(), "hospitais");
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

            bitMAP1.Save(Server.MapPath("~/Repository/images/hospitais/" + fileupload1.FileName));

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

        public ActionResult EditarEvento(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                List<distrito> distritos_ = db.distritoes.ToList();
                ViewBag.distritos = new SelectList(distritos_, "id", "nome");
                var evento = db.hospitals.Where(m => m.id == id).SingleOrDefault();

                return View(evento);
            }
        }

        public ActionResult criarClinica()
        {
            using (var db = new mussika_bdEntities())
            {
                List<distrito> distritos_ = db.distritoes.ToList();
                ViewBag.distritos = new SelectList(distritos_, "id", "nome");
                return View();
            }
        }

        public ActionResult salvarClinica(ClinicaViewModel model)
        {
            //DateTime data_Evento = DateTime.Parse(model.data_evento_convertido);
            long id = 0;
            long id_prov = long.Parse(Session["idusario"].ToString());
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    if (model.id <= 0)
                    {
                        clinica novo = new clinica()
                        {
                            id_provedor=id_prov,
                            data_cadastro = DateTime.Now,
                            descricao = model.descricao,
                            foto_capa = "noimage.png",
                            id_distrito = model.id_distrito,
                            inactivo = model.inactivo,
                            bairro = model.bairro,
                            nome = model.nome,
                            email = model.email,
                            telefone = model.telefone,
                            preco_consulta=model.preco_consulta,

                        };

                        db.clinicas.Add(novo);
                        db.SaveChanges();
                        id = novo.id;
                    }
                    else
                    {
                        var evento = db.clinicas.Where(e => e.id == model.id).SingleOrDefault();
                        evento.id_distrito = model.id_distrito;
                        evento.inactivo = model.inactivo;
                        evento.bairro = model.bairro;
                        evento.nome = model.nome;
                        evento.descricao = model.descricao;
                        evento.telefone = model.telefone;
                        evento.email = model.email;
                        evento.preco_consulta = model.preco_consulta;
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

        public ActionResult CarregarFotosClinica(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var evento = db.clinicas.Where(m => m.id == id).SingleOrDefault();
                ViewBag.id = id;
                ViewBag.nome = evento.nome;
                return View(evento);
            }

        }

        public ActionResult SaveUploadedFileClinica(clinica model)
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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "clinicas");

                        var fileName1 = Path.GetFileName(file.FileName);
                        model.foto_capa = fileName1;
                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (verificarClinica(model))
                        {
                            if (!isExists)
                                System.IO.Directory.CreateDirectory(pathString);

                            var path = string.Format("{0}\\{1}", pathString, file.FileName);

                            //file.SaveAs(path);
                            if (reziseImageClinica(file))
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
        public ActionResult RemoverFotoClinica(string filename, long id)
        {
            try
            {
                if (!string.IsNullOrEmpty(filename))
                {
                    if (filename.Trim().ToLower() != "noimage.png")
                    {

                        string fullPath = Request.MapPath("~/Repository/images/clinicas/" + filename);
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

        private bool alterarCaminhoClinica(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var qua = db.clinicas.Where(f => f.id == id).SingleOrDefault();
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
        private bool verificarClinica(clinica model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    clinica evento_ = db.clinicas.Where(r => r.id == model.id).SingleOrDefault();
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
        public bool reziseImageClinica(HttpPostedFileBase fileupload)
        {
            HttpPostedFileBase fileupload1 = fileupload;
            var originalDirectory = new DirectoryInfo(string.Format("{0}Repository\\images", Server.MapPath(@"\")));
            string pathString2 = System.IO.Path.Combine(originalDirectory.ToString(), "clinicas");
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

            bitMAP1.Save(Server.MapPath("~/Repository/images/clinicas/" + fileupload1.FileName));

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

        public ActionResult Clinicas(int? page)
        {
            page = int.Parse(TempData["page"].ToString());
            string filter = TempData["filtro"].ToString();
            long id_prov = long.Parse(Session["idusario"].ToString());
            ViewBag.filtro = filter.Trim();

            List<ClinicaViewModel> listaFinal = new List<ClinicaViewModel>();
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<clinica> itens = null;
                    //ViewBag.autor = db.artista_obra.Where(p => p.id == id).SingleOrDefault();
                    //ViewBag.id_autor = id;
                    if (string.IsNullOrEmpty(filter))
                    {
                        itens = db.clinicas.Where(o => o.id_provedor==id_prov).ToList();
                    }
                    else
                    {
                        itens = db.clinicas.Where(f=>f.nome.Trim().ToLower().Contains(filter.Trim().ToLower())&& f.id_provedor==id_prov).OrderByDescending(o => o.id).ToList();
                    }
                    
                    foreach (var item in itens)
                    {
                        ClinicaViewModel cli = new ClinicaViewModel()
                        {
                            bairro = item.bairro,
                            data_cadastro = (DateTime)item.data_cadastro,
                            descricao = item.descricao,
                            email = item.email,
                            foto_capa = item.foto_capa,
                            id = item.id,
                            id_distrito = (int)item.id_distrito,
                            inactivo = (bool)item.inactivo,
                            nome = item.nome,
                            nome_distrito = item.distrito.nome,
                            telefone = item.telefone,
                        };
                        listaFinal.Add(cli);
                    }
                    int pageSize = 7;
                    int pageNumber = (page ?? 1);
                    return PartialView("_Clinicas", listaFinal.ToPagedList(pageNumber, pageSize));

                }
            }
            catch (Exception)
            {

                return Redirect("/Error/InternalServerError");
            }
        }

        public ActionResult EditarClinica(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                List<distrito> distritos_ = db.distritoes.ToList();
                ViewBag.distritos = new SelectList(distritos_, "id", "nome");
                var evento = db.clinicas.Where(m => m.id == id).SingleOrDefault();

                return View(evento);
            }
        }

        public ActionResult Farmacias(int? page)
        {
            page = int.Parse(TempData["page"].ToString());
            string filter = TempData["filtroFarmacia"].ToString();
            ViewBag.filtro2 = filter.Trim();

            List<FarmaciaViewModel> listaFinal = new List<FarmaciaViewModel>();
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<farmacia> itens = null;
                    long id_prov = long.Parse(Session["idusario"].ToString());
                    //ViewBag.autor = db.artista_obra.Where(p => p.id == id).SingleOrDefault();
                    //ViewBag.id_autor = id;
                    if (string.IsNullOrEmpty(filter))
                    {
                        itens = db.farmacias.Where(o => o.id_provedor==id_prov).ToList();
                    }
                    else
                    {
                        itens = db.farmacias.Where(f => f.nome.Trim().ToLower().Contains(filter.Trim().ToLower())&& f.id_provedor==id_prov).OrderByDescending(o => o.id).ToList();
                    }

                    foreach (var item in itens)
                    {
                        FarmaciaViewModel cli = new FarmaciaViewModel()
                        {
                            bairro = item.bairro,
                            data_cadastro = (DateTime)item.data_cadastro,
                            descricao = item.descricao,
                            email = item.email,
                            foto_capa = item.foto_capa,
                            id = item.id,
                            id_distrito = (int)item.id_distrito,
                            inactivo = (bool)item.inactivo,
                            nome = item.nome,
                            nome_distrito = item.distrito.nome,
                            telefone = item.telefone,
                        };
                        listaFinal.Add(cli);
                    }
                    int pageSize = 7;
                    int pageNumber = (page ?? 1);
                    return PartialView("_Farmacias", listaFinal.ToPagedList(pageNumber, pageSize));

                }
            }
            catch (Exception)
            {

                return Redirect("/Error/InternalServerError");
            }
        }

        public ActionResult criarFarmacia()
        {
            using (var db = new mussika_bdEntities())
            {
                List<distrito> distritos_ = db.distritoes.ToList();
                ViewBag.distritos = new SelectList(distritos_, "id", "nome");
                return View();
            }
        }

        public ActionResult salvarFarmacia(FarmaciaViewModel model)
        {
            //DateTime data_Evento = DateTime.Parse(model.data_evento_convertido);
            long id = 0;
            long id_prov = long.Parse(Session["idusario"].ToString());
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    if (model.id <= 0)
                    {
                        farmacia novo = new farmacia()
                        {
                            id_provedor=id_prov,
                            data_cadastro = DateTime.Now,
                            descricao = model.descricao,
                            foto_capa = "noimage.png",
                            id_distrito = model.id_distrito,
                            inactivo = model.inactivo,
                            bairro = model.bairro,
                            nome = model.nome,
                            email = model.email,
                            telefone = model.telefone,

                        };

                        db.farmacias.Add(novo);
                        db.SaveChanges();
                        id = novo.id;
                    }
                    else
                    {
                        var evento = db.farmacias.Where(e => e.id == model.id).SingleOrDefault();
                        evento.id_distrito = model.id_distrito;
                        evento.inactivo = model.inactivo;
                        
                        evento.bairro = model.bairro;
                        evento.nome = model.nome;
                        evento.descricao = model.descricao;
                        evento.telefone = model.telefone;
                        evento.email = model.email;
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

        public ActionResult CarregarFotosFarmacia(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var evento = db.farmacias.Where(m => m.id == id).SingleOrDefault();
                ViewBag.id = id;
                ViewBag.nome = evento.nome;
                return View(evento);
            }

        }

        public ActionResult SaveUploadedFileFarmacia(clinica model)
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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "farmacias");

                        var fileName1 = Path.GetFileName(file.FileName);
                        model.foto_capa = fileName1;
                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (verificarFarmacia(model))
                        {
                            if (!isExists)
                                System.IO.Directory.CreateDirectory(pathString);

                            var path = string.Format("{0}\\{1}", pathString, file.FileName);

                            //file.SaveAs(path);
                            if (reziseImageFarmacia(file))
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
        public ActionResult RemoverFotoFarmacia(string filename, long id)
        {
            try
            {
                if (!string.IsNullOrEmpty(filename))
                {
                    if (filename.Trim().ToLower() != "noimage.png")
                    {

                        string fullPath = Request.MapPath("~/Repository/images/farmacias/" + filename);
                        if (System.IO.File.Exists(fullPath))
                        {
                            if (alterarCaminhoFarmacia(id))
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

        private bool alterarCaminhoFarmacia(long id)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    var qua = db.farmacias.Where(f => f.id == id).SingleOrDefault();
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
        private bool verificarFarmacia(clinica model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    farmacia evento_ = db.farmacias.Where(r => r.id == model.id).SingleOrDefault();
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
        public bool reziseImageFarmacia(HttpPostedFileBase fileupload)
        {
            HttpPostedFileBase fileupload1 = fileupload;
            var originalDirectory = new DirectoryInfo(string.Format("{0}Repository\\images", Server.MapPath(@"\")));
            string pathString2 = System.IO.Path.Combine(originalDirectory.ToString(), "farmacias");
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

            bitMAP1.Save(Server.MapPath("~/Repository/images/farmacias/" + fileupload1.FileName));

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

        public ActionResult EditarFarmacia(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                List<distrito> distritos_ = db.distritoes.ToList();
                ViewBag.distritos = new SelectList(distritos_, "id", "nome");
                var evento = db.farmacias.Where(m => m.id == id).SingleOrDefault();

                return View(evento);
            }
        }

        public ActionResult farmaciaProduto(long id, int? page)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    List<farmacia_produto> itens = null;
                    ViewBag.autor = db.farmacias.Where(p => p.id == id).SingleOrDefault();
                    ViewBag.id_autor = id;
                    itens = db.farmacia_produto.Where(q => q.id_farmacia == id).ToList();
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

        public ActionResult CriarProdutoFarmacia(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                ViewBag.autor = db.farmacias.Where(a => a.id == id).SingleOrDefault();
            }
            return View();
        }

        public ActionResult SalvarProdutoFarmacia(farmacia_produto_view_model model)
        {
            long id = 0;
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    if (model.id <= 0)
                    {
                        farmacia_produto novo = new farmacia_produto()
                        {

                            data_cadastro = DateTime.Now,
                            descricao = model.descricao,
                            foto_capa = "noimage.png",                          
                            id_farmacia = model.id_farmacia,
                            preco_venda = model.preco_venda,                           
                            inactivo = false,
                            nome = model.nome,
                            peso=0,

                        };

                        db.farmacia_produto.Add(novo);
                        db.SaveChanges();
                        id = novo.id;
                    }
                    else
                    {
                        var evento = db.farmacia_produto.Where(e => e.id == model.id).SingleOrDefault();                      
                        evento.preco_venda = model.preco_venda;
                        evento.nome = model.nome;
                        evento.inactivo = model.inactivo;
                        evento.peso = 0;

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

        public ActionResult CarregarFotosProdutoFarmacia(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var evento = db.farmacia_produto.Where(m => m.id == id).SingleOrDefault();
                ViewBag.id = evento.id_farmacia;
                ViewBag.nome = evento.nome;
                return View(evento);
            }

        }

        public ActionResult SaveUploadedFileProduto(farmacia model)
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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "farmacias");

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

                        string fullPath = Request.MapPath("~/Repository/images/farmacias/" + filename);
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
                    var qua = db.farmacia_produto.Where(f => f.id == id).SingleOrDefault();
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
        private bool verificarProduto(farmacia model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    farmacia_produto evento_ = db.farmacia_produto.Where(r => r.id == model.id).SingleOrDefault();
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
            string pathString2 = System.IO.Path.Combine(originalDirectory.ToString(), "farmacias");
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

            bitMAP1.Save(Server.MapPath("~/Repository/images/farmacias/" + fileupload1.FileName));

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
               

                var evento = db.farmacia_produto.Where(m => m.id == id).SingleOrDefault();
               
                return View(evento);
            }
        }
    }
}