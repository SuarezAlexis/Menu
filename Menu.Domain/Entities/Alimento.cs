﻿using Menu.Domain.Abstract;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace Menu.Domain.Entities
{
    public class Alimento
    {
        public long ID { get; set; }

        [MaxLength(50, ErrorMessage = "Debe tener máximo 50 caracteres" )]
        public string Nombre { get; set; }
        public TipoAlimento Tipo { get; set; }
        public decimal Precio { get; set; }
        public int Porciones { get; set; }
        public short Espera { get; set; }
        public IEnumerable<Receta> Recetas { get; set; }
        public Usuario Usuario { get; set; }
        public Privacidad Privacidad { get; set; }
        public decimal Calificacion { get; set; }
        public string Imagen { get; set; }

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

    }

    public class Receta
    {

    }

    public class Valoracion
    { }

    public enum Privacidad
    {
        Privado,
        Publico
    }
}
