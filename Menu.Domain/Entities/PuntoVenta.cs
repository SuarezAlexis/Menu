using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Globalization;
using System.ComponentModel.DataAnnotations;
using Menu.Domain.Abstract;

namespace Menu.Domain.Entities
{
    public class PuntoVenta
    {


        public long ID { get; set; }
        [MaxLength(50, ErrorMessage = "No puede contener más de 50 carácteres.")]
        public string Nombre { get; set; }
        public TipoPV Tipo { get; set; }
        public IEnumerable<Tag> Tags { get; set; }
        [Display(Name ="Servicios de entrega")]
        public IEnumerable<ServicioEntrega> ServiciosEntrega { get; set; }
        public bool ServicioEntrega { get { return ServiciosEntrega != null && ServiciosEntrega.Count() > 0; } }
        public IEnumerable<Contacto> Contactos { get; set; }
        public IEnumerable<Ubicacion> Ubicaciones { get; set; }
        public IEnumerable<ProductoPV> Productos { get; }

        public ProductoPV AgregarProducto(ProductoPV Producto)
        {
            return new ProductoPV();
        }
    }

    public class TipoPV
    {
        [MaxLength(30, ErrorMessage = "No puede contener más de 30 carácteres.")]
        public string TipoPuntoVenta { get; set; }
    }

    public class Horario
    {
        private int inicio { get; set; }
        private int fin { get; set; }
        public DiasHorario dias { get; set; }
        
    }

    public class DiasHorario
    {
        private byte dias { get; set; }

        public bool Hoy() { return (dias & (1 << (int)DateTime.Now.DayOfWeek)) != 0; }
        public bool[] toArray()
        {
            return new bool[] 
            {
                (dias & (1 << 0)) != 0,
                (dias & (1 << 1)) != 0,
                (dias & (1 << 2)) != 0,
                (dias & (1 << 3)) != 0,
                (dias & (1 << 4)) != 0,
                (dias & (1 << 5)) != 0,
                (dias & (1 << 6)) != 0,
            };
        }
        public Dictionary<DayOfWeek,bool> toDictionary()
        {
            return new Dictionary<DayOfWeek, bool>()
            { 
                { DayOfWeek.Sunday, (dias & (1 << 0)) != 0 },
                { DayOfWeek.Monday, (dias & (1 << 0)) != 0 },
                { DayOfWeek.Tuesday, (dias & (1 << 0)) != 0 },
                { DayOfWeek.Wednesday, (dias & (1 << 0)) != 0 },
                { DayOfWeek.Thursday, (dias & (1 << 0)) != 0 },
                { DayOfWeek.Friday, (dias & (1 << 0)) != 0 },
                { DayOfWeek.Saturday, (dias & (1 << 0)) != 0 }
            };
        }
        public string toShortString()
        {//Arreglo inválido si está vacío u ocupa el octavo bit.
            if (dias != 0 && 128 > dias)
            { //Se inicializan variables:
                string result = String.Empty;
                int i = 1; //Marca dia de inicio. Comenzar por lunes
                int j = 7; //Marca el día de fin. 7 indica que es la primera iteración.

                while (j != 6 && j != 0) //Iterar mientras no haya recorrido toda la semana.
                { //Si es sábado significa que probó con domingo y no estaba activado, 
                  //si es domingo significa que sí estaba activado y llegó al final de la semana.
                  //Encontrar primer bit encendido
                    while ((dias & (1 << i)) == 0) //Iterar mientras esté apagado el iésimo bit. 
                    { i = i == 6 ? 0 : i == 0 ? j : i + 1; } //i=sabado => i=domingo; 
                                                             //i=domingo => marcar fin de ciclo, j se quedó en un bit encendido;
                                                             //de otro modo i++

                    if (i == j) //fin de ciclo? <= ultima iteración.
                        return result;
                    if (j != 7) //Si no es la primera iteración agrega coma.
                        result += String.IsNullOrEmpty(result) ? String.Empty : ", ";

                    result += DiaSemana2Letras(i); //Agregar dato al resultado

                    if (i == 0) //Dia de inicio es domingo => no hubo otro bit encendido
                        return result;

                    //Encontrar ultimo bit encendido consecutivo.
                    j = i; //Comenzar por primer bit encendido encontrado.
                    while ((dias & (1 << j)) != 0) //Iterar mientras esté encendido el j-ésimo bit
                    { j = j == 6 ? 0 : j == 0 ? 7 : j + 1; } //j=sabado => j=domingo;
                                                             //j=domingo => marcar fin de ciclo, 7 siempre estará apagado;
                                                             //de otro modo j++;
                    j = j > 0 ? j > 6 ? 0 : j - 1 : j = 6; //Colocar valor del dia anterior: 
                                                           //j>6 => domingo, j>0 => j-1, j=0 => sábado.
                    if (j > i || j == 0) //Si j != i: Hay más de 1 día encendido
                        result += "-" + DiaSemana2Letras(j); //Agregar dato como intervalo.
                    i = j + 1; //Continuar a partir del siguiente día.
                }
                return result;
            }
            else
            { return String.Empty; }
        }
        public string toString()
        {
            if (dias != 0 && 128 > dias)
            { 
                string result = String.Empty;
                int i = 1; 
                int j = 7; 

                while (j != 6 && j != 0) 
                { 
                    while ((dias & (1 << i)) == 0)
                    { i = i==6 ? 0 : i==0 ? j : i+1; } 

                    if (i == j)
                        return result;
                    if (j != 7) 
                        result += String.IsNullOrEmpty(result) ? String.Empty : ", ";

                    result += DiaSemana(i);

                    if (i == 0) 
                        return result;

                    j = i;
                    while ((dias & (1 << j)) != 0)
                    { j = j==6 ? 0 : j==0 ? 7 : j+1; } 

                    j = j>0 ? j>6 ? 0 : j-1 : 6; 
                    if ( j>i || j==0) 
                        result += " a " + DiaSemana(j); 
                    i = j + 1; 
                }

                int idx = result.LastIndexOf(',');
                if(idx != -1)
                {
                    StringBuilder sb = new StringBuilder(result);
                    sb.Remove(idx,1);
                    sb.Insert(idx, " y");
                    return sb.ToString();
                }
                return result;
            }
            else
            { return String.Empty; }
        }

        private static string DiaSemana2Letras(int day)
        {
            CultureInfo spanish = new CultureInfo("es-MX");
            string dia = spanish.DateTimeFormat.DayNames[day].Substring(0, 2);
            return dia[0].ToString().ToUpper() + dia.Substring(1);
        }
        private static string DiaSemana(int day)
        {
            CultureInfo spanish = new CultureInfo("es-MX");
            string dia = spanish.DateTimeFormat.DayNames[day];
            return dia = dia[0].ToString().ToUpper() + dia.Substring(1);
        }
    }

    public class ServicioEntrega
    {
        public int ID { get; set; }
        [MaxLength(20, ErrorMessage = "No puede contener más de 20 carácteres.")]
        public string Nombre { get; set; }
        [MaxLength(128, ErrorMessage = "No puede contener más de 128 carácteres.")]
        public string Descripcion { get; set; }
    }

    public class Contacto
    {
        public long ID { get; set; }
        [MaxLength(15, ErrorMessage = "No puede contener más de 15 carácteres.")]
        public string Tipo { get; set; }
        [MaxLength(25, ErrorMessage = "No puede contener más de 25 carácteres.")]
        public string Dato { get; set; }
    }

    public class Ubicacion
    {
        public long ID { get; set; }
        public PuntoVenta PuntoVenta { get; set; }
        [MaxLength(128, ErrorMessage = "No puede contener más de 128 carácteres")]
        public string Direccion { get; set; }
        public decimal Latitud { get; set; }
        public decimal Longitud { get; set; }
        [MaxLength(256, ErrorMessage = "No puede contener más de 256 carácteres")]
        public string Descripcion { get; set; }
    }
}
