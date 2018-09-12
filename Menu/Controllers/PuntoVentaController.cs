using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Menu.Models;
using Menu.Domain.Entities;
using Menu.Domain.Abstract;

namespace Menu.Controllers
{
    public class PuntoVentaController : Controller
    {
        private IPuntoVentaRepository Repo { get; set; }

        public PuntoVentaController(IPuntoVentaRepository PuntoVentaRepository)
        {
            Repo = PuntoVentaRepository;
        }

        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult NuevoPV()
        {
            NuevoPuntoVentaViewModel Model = new NuevoPuntoVentaViewModel
            {
                PuntoVenta = new PuntoVenta(),
                Tipos = TiposPV(Repo.TiposPV),
                TiposContacto = TiposContacto(Repo.TiposContacto)
                
            };
            return PartialView(Model);
        }

        private IEnumerable<SelectListItem> TiposContacto(IEnumerable<string> tipos)
        {
            List<SelectListItem> lista = new List<SelectListItem>();
            foreach(string t in tipos)
            { lista.Add(new SelectListItem { Text = t }); }
            return lista;
        }
        private IEnumerable<SelectListItem> TiposPV(IEnumerable<TipoPV> tipos)
        {
            List<SelectListItem> lista = new List<SelectListItem>();
            foreach (TipoPV t in tipos) { lista.Add(new SelectListItem { Text = t.TipoPuntoVenta }); }
            return lista;
        }
    }
}