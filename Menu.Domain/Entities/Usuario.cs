using System.IO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Menu.Domain.Entities
{
    public class Usuario
    {
        public long ID { get; set; }
        public string UserName { get; set; }
        public string Nombre { get; set; }
        public string Correo { get; set; }
        public string DirFoto { get; set; }
        public DateTime UltimaActividad { get; set; }
        public int Puntuacion { get; set; }
    }
}
