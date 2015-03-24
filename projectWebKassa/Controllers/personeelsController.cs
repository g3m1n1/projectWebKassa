using projectWebKassa.DAL;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace projectWebKassa.Controllers
{
    public class personeelsController : Controller
    {
        private WebKassaContextContainer db = new WebKassaContextContainer();

        // GET: personeels
        public ActionResult Index()
        {
            var personeelSet = db.personeelSet.Include(p => p.filiaalCode).Include(p => p.Functie);
            return View(personeelSet.ToList());
        }

        // GET: personeels/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            personeel personeel = db.personeelSet.Find(id);
            if (personeel == null)
            {
                return HttpNotFound();
            }
            return View(personeel);
        }

        // GET: personeels/Create
        public ActionResult Create()
        {
            ViewBag.filiaal_codeId = new SelectList(db.filiaal_codeSet, "FiliaalCodeId", "Naam");
            ViewBag.FunctieId = new SelectList(db.FunctieSet, "FunctieId", "Naam");
            return View();
        }

        // POST: personeels/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PersoneelId,filiaal_codeId,FunctieId,Voornaam,Tussenvoegsel,Achternaam,PostCode,Adres")] personeel personeel)
        {
            if (ModelState.IsValid)
            {
                db.personeelSet.Add(personeel);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.filiaal_codeId = new SelectList(db.filiaal_codeSet, "FiliaalCodeId", "Naam", personeel.filiaal_codeId);
            ViewBag.FunctieId = new SelectList(db.FunctieSet, "FunctieId", "Naam", personeel.FunctieId);
            return View(personeel);
        }

        // GET: personeels/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            personeel personeel = db.personeelSet.Find(id);
            if (personeel == null)
            {
                return HttpNotFound();
            }
            ViewBag.filiaal_codeId = new SelectList(db.filiaal_codeSet, "FiliaalCodeId", "Naam", personeel.filiaal_codeId);
            ViewBag.FunctieId = new SelectList(db.FunctieSet, "FunctieId", "Naam", personeel.FunctieId);
            return View(personeel);
        }

        // POST: personeels/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PersoneelId,filiaal_codeId,FunctieId,Voornaam,Tussenvoegsel,Achternaam,PostCode,Adres")] personeel personeel)
        {
            if (ModelState.IsValid)
            {
                db.Entry(personeel).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.filiaal_codeId = new SelectList(db.filiaal_codeSet, "FiliaalCodeId", "Naam", personeel.filiaal_codeId);
            ViewBag.FunctieId = new SelectList(db.FunctieSet, "FunctieId", "Naam", personeel.FunctieId);
            return View(personeel);
        }

        // GET: personeels/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            personeel personeel = db.personeelSet.Find(id);
            if (personeel == null)
            {
                return HttpNotFound();
            }
            return View(personeel);
        }

        // POST: personeels/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            personeel personeel = db.personeelSet.Find(id);
            db.personeelSet.Remove(personeel);
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