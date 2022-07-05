using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASP_Mussika.Models;

namespace ASP_Mussika.Controllers
{
    public class AdminEventoController : Controller
    {
        // GET: AdminEvento
        public ActionResult Index()
        {

            return View();
        }

        public ActionResult criar()
        {
            using (var db = new mussika_bdEntities())
            {
                List<evento_categoria> Tipo = db.evento_categoria.ToList();
                ViewBag.categoria = new SelectList(Tipo, "id", "descricao");

                List<distrito> distritos_ = db.distritoes.ToList();
                ViewBag.distritos = new SelectList(distritos_, "id", "nome");
                return View();
            }
        }

        public ActionResult salvar(EventoViewModel model)
        {
            //DateTime data_Evento = DateTime.Parse(model.data_evento_convertido);
            long id = 0;
            try
            {
                //DateTime deento = DateTime.Parse(model.data_evento_convertido);
                using(var db=new mussika_bdEntities())
                {
                    if (model.id <= 0)
                    {
                        long usuario = long.Parse(Session["idusario"].ToString());
                        string userTipo = Session["tipo"].ToString();
                        evento novo = new evento()
                        {
                            adiado = model.adiado,
                            data_cadastro = DateTime.Now,
                            //data_evento = DateTime.MinValue,
                            descricao = model.descricao,
                            foto_capa = "noimage.png",
                            id_distrito = model.id_distrito,
                            inactivo = model.inactivo,
                            local = model.local,
                            nome = model.nome,
                            realizado = model.realizado,
                            id_categoria=model.id_categoria,
                            preco_bilhete=model.preco_bilhete,
                            moderador=model.moderador,
                            part_assistente=model.part_assistente,
                            nr_participantes=model.nr_participantes,
                            orador=model.orador,
                            preco_bilhete_vip=model.preco_bilhete_vip,
                        };
                        if (userTipo == "4")
                        {
                            novo.id_provedor = usuario;
                        }
                        db.eventoes.Add(novo);
                        db.SaveChanges();
                        id = novo.id;
                    }
                    else
                    {
                        var evento = db.eventoes.Where(e => e.id == model.id).SingleOrDefault();
                        evento.id_distrito = model.id_distrito;
                        evento.inactivo = model.inactivo;
                        evento.local = model.local;
                        evento.nome = model.nome;
                        evento.realizado = model.realizado;
                        evento.adiado = model.adiado;
                        //evento.data_evento = DateTime.MinValue;
                        evento.descricao = model.descricao;
                        evento.id_categoria = model.id_categoria;
                        evento.preco_bilhete = model.preco_bilhete;
                        evento.preco_bilhete_vip = model.preco_bilhete_vip;
                        evento.orador = model.orador;
                        evento.part_assistente = model.part_assistente;
                        evento.nr_participantes = model.nr_participantes;
                        evento.moderador = model.moderador;
                        db.SaveChanges();
                        id = evento.id;
                    }
                }
            }
            catch (Exception ex)
            {

                return Content("false");
            }
            return Content(id.ToString());
        }

        public List<EventoViewModel> EventoList()
        {
            List<EventoViewModel> listaArtigos = new List<EventoViewModel>();

            using (var db = new mussika_bdEntities())
            {
                var artigos = db.eventoes.OrderByDescending(P => P.id); ;


                foreach (var model in artigos)
                {
                    EventoViewModel ProVM = new EventoViewModel()
                    {
                        id=model.id,
                        adiado =(bool) model.adiado,
                        data_cadastro = DateTime.Now,
                       //data_evento = (DateTime)model.data_evento,
                        data_evento_convertido= DateTime.Now.Date.ToString("MM-dd-yyyy"),
                        descricao = model.descricao,
                        foto_capa = "noimage.png",
                        id_distrito =(int) model.id_distrito,
                        inactivo = (bool)model.inactivo,
                        local = model.local,
                        nome = model.nome,
                        realizado = (bool)model.realizado,
                        nome_distrito=model.distrito.nome,
                    };
                    listaArtigos.Add(ProVM);
                }
            }
            return listaArtigos;


        }

        [HttpPost]
        public ActionResult carregarTabelaEventosByAjax(int draw, int start, int length)
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
                var produtos = EventoList();
                // 1. Searching  
                if (!string.IsNullOrEmpty(search))
                {
                    produtos = produtos.Where(u => u.nome.ToUpper().Contains(search.ToUpper())).ToList();
                }
                // 2. Get the total record count  
                recordsTotal = produtos.Count();
                // 3. Sorting  
                var filteredData = produtos as IEnumerable<EventoViewModel>;
                Func<EventoViewModel, string> orderingFunction = (c => sortColumn == "id" ? c.id.ToString() :
                                          sortColumn == "nome" ? c.nome :
                                           sortColumn == "local" ? c.local :
                                          sortColumn == "nome_distrito" ? c.nome_distrito :
                                          sortColumn == "data_evento" ? c.data_evento_convertido 
                                         

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

        public ActionResult CarregarFotos(long id)
        {
            using (var db = new mussika_bdEntities())
            {
                var evento = db.eventoes.Where(m => m.id == id).SingleOrDefault();
                ViewBag.id = id;
                ViewBag.nome = evento.nome;
                return View(evento);
            }

        }

        public ActionResult SaveUploadedFile(EventoViewModel model)
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

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "eventos");

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

                        string fullPath = Request.MapPath("~/Repository/images/eventos/" + filename);
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
                    var qua = db.eventoes.Where(f => f.id == id).SingleOrDefault();
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
        private bool verificarMusica(EventoViewModel model)
        {
            try
            {
                using (var db = new mussika_bdEntities())
                {
                    evento evento_ = db.eventoes.Where(r => r.id == model.id).SingleOrDefault();
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
            string pathString2 = System.IO.Path.Combine(originalDirectory.ToString(), "eventos");
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

            bitMAP1.Save(Server.MapPath("~/Repository/images/eventos/" + fileupload1.FileName));

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
                List<evento_categoria> Tipo = db.evento_categoria.ToList();
                ViewBag.categoria = new SelectList(Tipo, "id", "descricao");

                List<distrito> distritos_ = db.distritoes.ToList();
                ViewBag.distritos = new SelectList(distritos_, "id", "nome");
                var evento = db.eventoes.Where(m => m.id == id).SingleOrDefault();
             
                return View(evento);
            }
        }
    }
}