using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Menu.Domain.Entities;

namespace Menu.Domain.Abstract
{
    public interface IPuntoVentaRepository
    {
        IEnumerable<TipoPV> TiposPV { get; }
        TipoPV AgregarTipoPV(string NuevoTipo);
        IEnumerable<string> TiposContacto { get; }
        string AgregarTipoContacto(string NuevoTipo);
        IEnumerable<ServicioEntrega> ServiciosEntrega { get; }
        ServicioEntrega AgregarServicioEntrega(string Nombre, string Descripcion);
    }
}
