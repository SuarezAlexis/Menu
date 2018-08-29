using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Menu.Models
{
    public class TabViewModel
    {
        public string TabLabel { get; set; }
        public string TabId { get; set; }
        public string PartialView { get; set; }
        public object Model { get; set; }
        public bool isActive { get; set; }
    }
}