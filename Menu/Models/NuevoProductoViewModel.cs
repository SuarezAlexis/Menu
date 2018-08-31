using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Menu.Domain.Entities;

namespace Menu.Models
{
    public class NuevoProductoViewModel
    {
        public Producto Producto { get; set; }
        public HttpPostedFileBase Imagen { get; set; }
        public IEnumerable<Categoria> Categorias { get; set; }
    }
}