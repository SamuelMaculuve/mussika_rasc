using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASP_Mussika.Models;

namespace ASP_Mussika.Controllers
{
    public class TransporteController : Controller
    {
        // GET: Transporte
        public ActionResult Index()
        {
            long usuario = long.Parse(Session["idusario"].ToString());
            using (var db = new mussika_bdEntities())
            {
                var transportadoras = db.transportadoras.Where(a => a.id_provedor == usuario).ToList();
                var tipo_carga = db.transportadora_tipo_carga.ToList();
                ViewBag.transportadoras = transportadoras;
                ViewBag.tipo_carga = tipo_carga;

            }
            return View();
        }

        public ActionResult Criar()
        {
            using (var db = new mussika_bdEntities())
            {
                var tipo_carga = db.transportadora_tipo_carga.ToList();
                ViewBag.tipo_carga = tipo_carga;
            }
            return View();
        }

        public ActionResult Salvar(transportadora_view_model model)
        {
            long usuario = long.Parse(Session["idusario"].ToString());
            using (var db = new mussika_bdEntities())
            {
                transportadora nova = new transportadora()
                {
                    inactivo = false,
                    nome = model.nome,
                    preco = model.preco,
                    id_provedor = usuario,

                };
                var id_trans = db.transportadoras.Add(nova);
                db.SaveChanges();
                transportadora_parametro novo_paramatro = new transportadora_parametro()
                {
                    id_transportadora = id_trans.id_transportadora,
                    distancia_maxima = model.distancia_maxima,
                    distancia_minima = model.distancia_minima,
                    id_tipo_carga = model.id_tipo_carga,
                    sensivel = model.sensivel,
                    valor = model.preco,
                    percentagem_sensivel = model.percentagem_sensivel,
                    peso_grande = model.peso_grande,
                    peso_medio = model.peso_medio,
                   peso_max_carga_grande=model.peso_max_carga_grande??0,
                   peso_max_carga_media=model.peso_max_carga_media??0,
                   peso_max_carga_pequena=model.peso_max_carga_pequena??0,
                };
                db.transportadora_parametro.Add(novo_paramatro);
                db.SaveChanges();
            }

            return Content("ok");
        }

        public ActionResult SalvarAlteracoes(transportadora_view_model model)
        {
            long usuario = long.Parse(Session["idusario"].ToString());
            using (var db = new mussika_bdEntities())
            {
                var transp = db.transportadoras.Where(a => a.id_transportadora == model.id_transportadora).SingleOrDefault();
                transp.nome = model.nome;
                transp.preco = model.preco;

                var parametro = db.transportadora_parametro.Where(a => a.id_transportadora == transp.id_transportadora).SingleOrDefault();
                parametro.distancia_maxima = model.distancia_maxima;
                parametro.distancia_minima = model.distancia_minima;
                parametro.id_tipo_carga = model.id_tipo_carga;
                parametro.sensivel = model.sensivel;
                parametro.valor = model.preco;
                parametro.percentagem_sensivel = model.percentagem_sensivel;
                parametro.peso_grande = model.peso_grande;
                parametro.peso_medio = model.peso_medio;
                parametro.peso_max_carga_grande = model.peso_max_carga_grande??0;
                parametro.peso_max_carga_media = model.peso_max_carga_media??0;
                parametro.peso_max_carga_pequena = model.peso_max_carga_pequena??0;
                
                
                db.SaveChanges();
            }

            return Content("ok");
        }


        public ActionResult Editar(int id)
        {
            using (var db = new mussika_bdEntities())
            {
                var tipo_carga = db.transportadora_tipo_carga.ToList();
                ViewBag.tipo_carga = tipo_carga;
                var trans = db.transportadoras.Where(a => a.id_transportadora == id).SingleOrDefault();
                var parametro = db.transportadora_parametro.Where(a => a.id_transportadora == id).SingleOrDefault();
                ViewBag.paramtero = parametro;
                ViewBag.sensivel = parametro.sensivel.ToString().ToLower();
                return View(trans);
            }
        }

        public ActionResult CarregarParametro(long id_transporte)
        {
            using (var db = new mussika_bdEntities())
            {
                var parametro = db.transportadora_parametro.Where(a => a.id_transportadora == id_transporte).SingleOrDefault();
                transportadora_parametro pay = new transportadora_parametro()
                {
                    distancia_maxima = parametro.distancia_maxima,
                    distancia_minima = parametro.distancia_minima,
                    valor = parametro.valor,
                    percentagem_sensivel=parametro.percentagem_sensivel,
                    peso_grande=parametro.peso_grande,
                    peso_medio=parametro.peso_medio,
                    peso_max_carga_pequena=parametro.peso_max_carga_pequena,
                    peso_max_carga_media=parametro.peso_max_carga_media,
                    peso_max_carga_grande=parametro.peso_max_carga_grande,
                };
                if (parametro == null)
                {
                    return Content("false");
                }
                return Json(pay, JsonRequestBehavior.AllowGet);
            }

        }
    }
}