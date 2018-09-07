using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using Menu.Domain.Abstract;
using Menu.Domain.Entities;

namespace Menu.Domain.Concrete
{
    public class PuntoVentaRepository : IPuntoVentaRepository
    {
        private IDbContext DbContext { get; set; }

        /// <summary>
        /// Constructor que solicita objeto DbContext genérico
        /// </summary>
        /// <param name="DbContextParam">Contexto de base de datos genérico</param>
        public PuntoVentaRepository(IDbContext DbContextParam)
        {
            DbContext = DbContextParam;
        }

        public IEnumerable<TipoPV> TiposPV
        {
            get
            {
                List<TipoPV> tipos = new List<TipoPV>();
                try
                {
                    foreach(DataRow dr in DbContext.TableQuery("SELECT * FROM TipoPuntoVenta").Rows)
                    { tipos.Add(new TipoPV { TipoPuntoVenta = dr["TipoPuntoVenta"].ToString() }); }
                }
                catch(Exception e)
                { throw new Exception("Ocurrió un error al tratar de obtener los tipos de punto de venta.", e); }
                return tipos;
            }
        }

        public TipoPV AgregarTipoPV(string NuevoTipo)
        {
            return new TipoPV { TipoPuntoVenta = String.Empty };
        }

        public IEnumerable<string> TiposContacto
        {
            get
            {
                List<string> tipos = new List<string>();
                try
                {
                    foreach (DataRow dr in DbContext.TableQuery("SELECT * FROM TipoContacto").Rows)
                    { tipos.Add(dr["TipoContacto"].ToString()); }
                }
                catch(Exception e)
                { throw new Exception("Ocurrió un error al tratar de obtener los tipos de contacto.",e); }
                return tipos;
            }
        }

        public string AgregarTipoContacto(string NuevoTipo)
        {
            return String.Empty;
        }
    }
}
