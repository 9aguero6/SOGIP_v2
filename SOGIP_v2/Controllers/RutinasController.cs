using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SOGIP_v2.Models;

namespace SOGIP_v2.Controllers
{
    public class RutinasController : Controller
    {
        private ApplicationDbContext db = new ApplicationDbContext();

        // GET: Rutinas
        public ActionResult Index()
        {
            return View(db.Rutinas.ToList());
        }
    
        // GET: Rutinas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Rutina rutina = db.Rutinas.Find(id);
            if (rutina == null)
            {
                return HttpNotFound();
            }
            return View(rutina);
        }

        //Busar el usuario por cédula. NO ME SIRVIÓ
        [HttpPost]
        public JsonResult FindUser(string cedula)
        {
            var User = db.Roles.Single(x => x.Name == "Administrador");
            return new JsonResult {Data=User, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        public ActionResult Create()
        {
            var getAtletas = db.Users.ToList();

            SelectList listaAtletas = new SelectList(getAtletas, "Cedula", "Nombre1");
            ViewBag.Atletas = listaAtletas;
            return View();
        }
        public ActionResult Ejercicio(int? idRutina)
        {
            Rutina rutina = db.Rutinas.Find(idRutina);
            int i = rutina.RutinaId;
            string n = i.ToString();
            ViewData["rutina"] = n;

            return View();

        }
        [HttpPost]
        public JsonResult Ejercicio(List<Conjunto_Ejercicio> ejercicios) //AGREGAR EL ID DE LA RUTINA
        {
            var status = false;
            //Busco el id de la rutina.
            string data = "2";
            int d = int.Parse(data);
            Rutina rutina = new Rutina();
            rutina = db.Rutinas.Single(x => x.RutinaId == d);

            //Asigno ejercicios a la rutina
            if (rutina != null)
            {
                for(int i=0; i<ejercicios.Count; i++)
                {
                    Conjunto_Ejercicio conjunto = new Conjunto_Ejercicio()
                    {
                        ConjuntoEjercicioRutina = rutina,
                        NombreEjercicio = ejercicios[i].NombreEjercicio,
                        Serie1 = ejercicios[i].Serie1,
                        Repeticion1 = ejercicios[i].Repeticion1,
                        Peso1 = ejercicios[i].Peso1,
                        Serie2 = ejercicios[i].Serie2,
                        Repeticion2 = ejercicios[i].Repeticion2,
                        Peso2 = ejercicios[i].Peso2,
                        Serie3 = ejercicios[i].Serie3,
                        Repeticion3 = ejercicios[i].Repeticion3,
                        Peso3 = ejercicios[i].Peso3
                    };
                    db.Conjunto_Ejercicios.Add(conjunto);
                }
                db.SaveChanges();

               
            }
            return new JsonResult { Data = new { status = status } };
        }



        public ActionResult ListaEjercicio(int ? idRutina)
        {
            var getEjercicio = db.Conjunto_Ejercicios.Where(x => x.ConjuntoEjercicioRutina.RutinaId == idRutina).ToList();
  
            return View(getEjercicio);
        }
        public ActionResult loaddata()
        {
            //int idRutina = int.Parse(data);
            var getEjercicio = db.Conjunto_Ejercicios.ToList();
            return Json(new {getEjercicio = getEjercicio},JsonRequestBehavior.AllowGet);
        }
        public ActionResult DetailsEjercicio(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Conjunto_Ejercicio conjunto_Ejercicio = db.Conjunto_Ejercicios.Find(id);
            if (conjunto_Ejercicio == null)
            {
                return HttpNotFound();
            }
            return View(conjunto_Ejercicio);
        }
        public ActionResult EditEjercicio(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Conjunto_Ejercicio conjunto_Ejercicio = db.Conjunto_Ejercicios.Find(id);
            if (conjunto_Ejercicio == null)
            {
                return HttpNotFound();
            }
            return View(conjunto_Ejercicio);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditEjercicio([Bind(Include = "Conjunto_EjercicioId,NombreEjercicio,Serie1,Repeticion1,Peso1,Serie2,Repeticion2,Peso2,Serie3,Repeticion3,Peso3")] Conjunto_Ejercicio conjunto_Ejercicio)
        {
            if (ModelState.IsValid)
            {
                db.Entry(conjunto_Ejercicio).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(conjunto_Ejercicio);
        }

        // GET: Conjunto_Ejercicio/Delete/5
        public ActionResult DeleteEjercicio(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Conjunto_Ejercicio conjunto_Ejercicio = db.Conjunto_Ejercicios.Find(id);
            if (conjunto_Ejercicio == null)
            {
                return HttpNotFound();
            }
            return View(conjunto_Ejercicio);
        }

        // POST: Conjunto_Ejercicio/Delete/5
        [HttpPost, ActionName("DeleteEjercicio")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmedEjercicio(int id)
        {
            Conjunto_Ejercicio conjunto_Ejercicio = db.Conjunto_Ejercicios.Find(id);
            db.Conjunto_Ejercicios.Remove(conjunto_Ejercicio);
            db.SaveChanges();
            return RedirectToAction("ListaEjercicio");
        }

    [HttpPost]
        public ActionResult Create(string atletaSeleccionado, Rutina rutinaCreate)
        {

            ApplicationUser user = new ApplicationUser();

          

            user = db.Users.Single(x => x.Cedula == atletaSeleccionado);

            if (user != null)
            {
               

                Rutina rutina = new Rutina()
                {
                    Usuario = user,
                    
                    RutinaFecha = rutinaCreate.RutinaFecha,

                    RutinaObservaciones = rutinaCreate.RutinaObservaciones
                };
          
             
                db.Rutinas.Add(rutina);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(rutinaCreate);
        }


    // GET: Rutinas/Edit/5
    public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Rutina rutina = db.Rutinas.Find(id);
            if (rutina == null)
            {
                return HttpNotFound();
            }
            return View(rutina);
        }

        // POST: Rutinas/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "RutinaId,RutinaFecha,RutinaObservaciones")] Rutina rutina)
        {
            if (ModelState.IsValid)
            {
                db.Entry(rutina).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(rutina);
        }

        // GET: Rutinas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Rutina rutina = db.Rutinas.Find(id);
            if (rutina == null)
            {
                return HttpNotFound();
            }
            return View(rutina);
        }

        // POST: Rutinas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Rutina rutina = db.Rutinas.Find(id);
            db.Rutinas.Remove(rutina);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
