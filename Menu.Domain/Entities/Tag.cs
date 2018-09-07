using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using Menu.Domain.Abstract;

namespace Menu.Domain.Entities
{
    public class Tag
    {
        public long ID { get; set; }
        [MaxLength(50, ErrorMessage = "No puede contener más de 50 carácteres.")]
        public string Etiqueta { get; set; }
    }
}
