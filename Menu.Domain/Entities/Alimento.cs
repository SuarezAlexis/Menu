﻿using Menu.Domain.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Menu.Domain.Entities
{
    public class Alimento : IPersistente
    {
        public long ID { get; set; }
        public string Nombre { get; set; }
        public TipoAlimento Tipo { get; set; }
        public decimal Precio { get; set; }
        public int Porciones { get; set; }
        public TimeSpan Espera { get; set; }
        public string Descripcion { get; set; }
        public IEnumerable<Receta> Recetas { get; set; }
        public Usuario Usuario { get; set; }
        public decimal Calificacion { get; set; }
    
        public IPersistente Guardar()
        {
            return this;
        }

        public IEnumerable<Valoracion> Valoraciones()
        {
            return new List<Valoracion>();
        }
    }

    public class TipoAlimento
    {
        public short ID { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }

        public TipoAlimento Guardar()
        {
            return this;
        }

    }

    public class Receta
    {

    }

    public class Valoracion
    { }
}