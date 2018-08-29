using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Menu.Domain.Entities;

namespace Menu.Models
{
    public class NuevoAlimentoViewModel
    {
        public Alimento Alimento { get; set; }
        public HttpPostedFileBase Imagen { get; set; }
        public IEnumerable<string> UserLists { get { return new List<string>(); } set { } }
        public IEnumerable<TabViewModel> Tabs { get { return new List<TabViewModel>(); } set { } }
    }
}