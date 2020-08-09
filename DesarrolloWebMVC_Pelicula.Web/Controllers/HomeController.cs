using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DesarrolloWebMVC_Pelicula.Web.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            Models.RegistroPelicula rp = new Models.RegistroPelicula();

            return View(rp.RecuperarTodos());
            
        }

        public ActionResult Grabar()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Grabar(FormCollection collection)
        {

            Models.RegistroPelicula rp = new Models.RegistroPelicula();
            
            Models.Pelicula peli = new Models.Pelicula
            {
                Codigo = int.Parse(collection["Codigo"].ToString()),
                Titulo = collection["Titulo"].ToString(),
                Director = collection["Director"].ToString(),
                ActorPrincipal = collection["ActorPrincipal"].ToString(),
                numActores = int.Parse(collection["numActores"].ToString()),
                Duracion = float.Parse(collection["Duracion"].ToString()),
                Estreno = int.Parse(collection["Estreno"].ToString())
            };

            rp.GrabarPelicula(peli);
            return RedirectToAction("Index");
        }


        public ActionResult Borrar(int cod)
        {
            Models.RegistroPelicula peli = new Models.RegistroPelicula();
            peli.Borrar(cod);
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Modificacion(int cod)
        {
            
            Models.RegistroPelicula peli = new Models.RegistroPelicula();
            Models.Pelicula rpt = peli.Recuperar( cod );
            rpt = peli.Recuperar(cod);
            return View(rpt);
            

        }
        [HttpPost]
        public ActionResult Modificacion(FormCollection collection)
        {
            Models.RegistroPelicula peli = new Models.RegistroPelicula();
            Models.Pelicula rpt = new Models.Pelicula
            {
                Codigo = int.Parse(collection["Codigo"].ToString()),
                Titulo = collection["Titulo"].ToString(),
                Director = collection["Director"].ToString(),
                ActorPrincipal = collection["ActorPrincipal"].ToString(),
                numActores = int.Parse(collection["numActores"].ToString()),
                Duracion = float.Parse(collection["Duracion"].ToString()),
                Estreno = int.Parse(collection["Estreno"].ToString()) 
            };
            
            peli.Modificar(rpt);
            return RedirectToAction("Index");
        }
    }
}