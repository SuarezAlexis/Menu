using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Menu.Domain.Abstract
{
    public interface IPersistente
    {
        long ID { get; set; }
        IPersistente Guardar();

    }

}
