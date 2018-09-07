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
                Tipos = Repo.TiposPV,
                TiposContacto = Repo.TiposContacto
                
            };
            return PartialView(Model);
        }
    }
}