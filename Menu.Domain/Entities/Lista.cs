using Menu.Domain.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Menu.Domain.Entities
{
    public class Lista
    {
        public long ID { get; set; }
        public string Nombre { get; set; }
        private List<Alimento> alimentos { get; set; }
        public IEnumerable<Alimento> Alimentos { get { return this.alimentos; } }
        public string Descripcion { get; set; }
        public bool Privada { get; set; }

        public void Agregar(Alimento item)
        { this.alimentos.Add(item); }

        public bool Quitar(Alimento item)
        { return this.alimentos.Remove(item); }
    }
}
