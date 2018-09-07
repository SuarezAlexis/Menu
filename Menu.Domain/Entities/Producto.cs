using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using Menu.Domain.Abstract;

namespace Menu.Domain.Entities
{
    public class Producto
    {
        public long ID { get; set; }
        [MaxLength(50, ErrorMessage = "No puede contener más de 50 carácteres.")]
        public string Nombre { get; set; }
        [MaxLength(256, ErrorMessage = "No puede contener más de 256 carácteres.")]
        public string Descripcion { get; set; }
        public Categoria Categoria { get; set; }
        public IEnumerable<ProductoPV> PuntosVenta{ get; set; }
    }

    public class Categoria
    {
        public int ID { get; set; }
        [MaxLength(20, ErrorMessage = "No puede contener más de 20 carácteres.")]
        public string Nombre { get; set; }
        [MaxLength(128, ErrorMessage = "No puede contener más de 128 carácteres.")]
        public string Descripcion { get; set; }
    }

    public class ProductoPV
    {
        public long ID { get; set; }
        public Producto Producto { get; set; }
        public PuntoVenta PuntoVenta { get; set; }
        public decimal Precio { get; set; }
        [MaxLength(128, ErrorMessage = "No puede contener más de 128 carácteres.")]
        public string Detalles { get; set; }
    }
}
