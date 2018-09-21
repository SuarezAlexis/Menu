using System;
using System.Linq;
using System.Web.Mvc;
using Menu.Domain.Entities;
using System.Collections.Generic;

namespace Menu.Models
{
    public class NuevoPuntoVentaViewModel
    {
        public PuntoVenta PuntoVenta { get; set; }
        public IEnumerable<SelectListItem> Tipos { get; set; }
        public IEnumerable<SelectListItem> TiposContacto { get; set; }
        public IEnumerable<SelectListItem> ServiciosEntrega { get; set; }
    }
}