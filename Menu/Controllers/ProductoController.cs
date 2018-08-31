using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Menu.Models;
using Menu.Domain.Entities;

namespace Menu.Controllers
{
    public class ProductoController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult NuevoProducto()
        {
            NuevoProductoViewModel Model = new NuevoProductoViewModel
            { Categorias = new List<Categoria>() };
            return PartialView(Model);
        }
    }
}