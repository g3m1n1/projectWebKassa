using projectWebKassa.DAL;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace projectWebKassa.Controllers
{
    public class FunctiesController : Controller
    {
        private WebKassaContextContainer db = new WebKassaContextContainer();

        // GET: Functies
        public ActionResult Index()
        {
            return View(db.FunctieSet.ToList());
        }

        // GET: Functies/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Functie functie = db.FunctieSet.Find(id);
            if (functie == null)
            {
                return HttpNotFound();
            }
            return View(functie);
        }

        // GET: Functies/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Functies/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Naam,Beginschaal,Eindschaal")] Functie functie)
        {
            if (ModelState.IsValid)
            {
                db.FunctieSet.Add(functie);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(functie);
        }

        // GET: Functies/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Functie functie = db.FunctieSet.Find(id);
            if (functie == null)
            {
                return HttpNotFound();
            }
            return View(functie);
        }

        // POST: Functies/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Naam,Beginschaal,Eindschaal")] Functie functie)
        {
            if (ModelState.IsValid)
            {
                db.Entry(functie).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(functie);
        }

        // GET: Functies/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Functie functie = db.FunctieSet.Find(id);
            if (functie == null)
            {
                return HttpNotFound();
            }
            return View(functie);
        }

        // POST: Functies/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Functie functie = db.FunctieSet.Find(id);
            db.FunctieSet.Remove(functie);
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