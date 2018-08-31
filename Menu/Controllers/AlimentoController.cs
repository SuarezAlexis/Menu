using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Collections.Generic;
using Menu.Models;
using Menu.Domain.Entities;

namespace Menu.Controllers
{
    public class AlimentoController : Controller
    {
        public ActionResult Menu()
        {
            return View();
        }

        public PartialViewResult NuevoAlimento()
        {
            NuevoAlimentoViewModel Model = new NuevoAlimentoViewModel
            {
                Alimento = new Alimento(),
                UserLists = new List<string>(),
                Tabs = new List<TabViewModel>()
            };
            return PartialView(Model);
        }

        public JsonResult Imagen(string imageData)
        {
            if(imageData.Length > 0)
            {            
                imageData = imageData.Replace("data:image/jpeg;base64,","");
                string path = Path.Combine(Server.MapPath("~/Content/uploads"), "archivo.jpg");
                using (FileStream fs = new FileStream(path, FileMode.Create))
                {
                    using (BinaryWriter bw = new BinaryWriter(fs))
                    {
                        bw.Write(Convert.FromBase64String(imageData));
                        bw.Close();
                    }
                }
                return Json(new { message = "Correct upload.", success = true, fileName = "archivo.jpg" });
            }
            else
            {
                return Json(new { message = "Empty file.", success = false });
            }
        }
    }
}