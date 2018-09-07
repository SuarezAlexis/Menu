using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Menu.Domain.Entities;

namespace Menu.Models
{
    public class NuevoPuntoVentaViewModel
    {
        public PuntoVenta PuntoVenta { get; set; }
        public IEnumerable<TipoPV> Tipos { get; set; }
        public IEnumerable<string> TiposContacto { get; set; }
    }
}