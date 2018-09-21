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
                { throw new Exception("Ocurrió un error al tratar de obtener los tipos de contacto.", e); }
                return tipos;
            }
        }

        public string AgregarTipoContacto(string NuevoTipo)
        {
            try
            {

            }
            catch(Exception e)
            {
                throw new Exception("Ocurrió un error al intentar guardar el tipo de contacto \"" + NuevoTipo + "\" en la base de datos.", e);
            }
            return NuevoTipo;
        }

        public IEnumerable<ServicioEntrega> ServiciosEntrega {
            get
            {
                List<ServicioEntrega> servicios = new List<ServicioEntrega>();
                try
                {
                    foreach(DataRow dr in DbContext.TableQuery("SELECT * FROM ServicioEntrega").Rows)
                    { servicios.Add(DataRowToServicioEntrega(dr)); }
                }
                catch(Exception e)
                { throw new Exception("Ocurrió un error al tratar de obtener los servicios de entrega de la base de datos.", e); }
                return servicios;
            }
        }

        public ServicioEntrega AgregarServicioEntrega(string Nombre, string Descripcion)
        {
            ServicioEntrega servicio = new ServicioEntrega { Nombre = Nombre, Descripcion = Descripcion };
            try
            {
                DataTable dt = DbContext.TableQuery("sp_InsertServicioEntrega '" + Nombre + "' '" + Descripcion + "'");
                if (dt.Rows.Count > 0)
                {
                    servicio = DataRowToServicioEntrega(dt.Rows[0]);
                }
            }
            catch(Exception e)
            {
                throw new Exception("Ocurrió un error al intentar guardar el servicio de entrega \"" + Nombre + "\" en la base de datos.", e);
            }
            return servicio;
        }

        private ServicioEntrega DataRowToServicioEntrega(DataRow dr)
        {
            return new ServicioEntrega
            {
                ID = Convert.ToInt32(dr["ID"].ToString()),
                Nombre = dr["Nombre"].ToString(),
                Descripcion = dr["Descripcion"].ToString()
            };
        }
    }
}
