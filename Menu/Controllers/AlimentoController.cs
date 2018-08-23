using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Menu.Models;

namespace Menu.Controllers
{
    public class AlimentoController : Controller
    {

        public PartialViewResult NuevoAlimento()
        {
            NuevoAlimentoViewModel Model = new NuevoAlimentoViewModel();
            return PartialView("Detalle",Model);
        }
    }
}