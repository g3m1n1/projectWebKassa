using projectWebKassa.DAL;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace projectWebKassa.Controllers
{
    public class FiliaalsController : Controller
    {
        private WebKassaContextContainer db = new WebKassaContextContainer();

        // GET: Filiaals
        public ActionResult Index()
        {
            var filiaal_codeSet = db.filiaal_codeSet.Include(f => f.Adre);
            return View(filiaal_codeSet.ToList());
        }

        // GET: Filiaals/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Filiaal filiaal = db.filiaal_codeSet.Find(id);
            if (filiaal == null)
            {
                return HttpNotFound();
            }
            return View(filiaal);
        }

        // GET: Filiaals/Create
        public ActionResult Create()
        {
            ViewBag.AdresAdresId = new SelectList(db.Adres, "AdresId", "Straat");
            return View();
        }

        // POST: Filiaals/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "FiliaalCodeId,Naam,AdresAdresId")] Filiaal filiaal)
        {
            if (ModelState.IsValid)
            {
                db.filiaal_codeSet.Add(filiaal);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AdresAdresId = new SelectList(db.Adres, "AdresId", "Straat", filiaal.AdresAdresId);
            return View(filiaal);
        }

        // GET: Filiaals/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Filiaal filiaal = db.filiaal_codeSet.Find(id);
            if (filiaal == null)
            {
                return HttpNotFound();
            }
            ViewBag.AdresAdresId = new SelectList(db.Adres, "AdresId", "Straat", filiaal.AdresAdresId);
            return View(filiaal);
        }

        // POST: Filiaals/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "FiliaalCodeId,Naam,AdresAdresId")] Filiaal filiaal)
        {
            if (ModelState.IsValid)
            {
                db.Entry(filiaal).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AdresAdresId = new SelectList(db.Adres, "AdresId", "Straat", filiaal.AdresAdresId);
            return View(filiaal);
        }

        // GET: Filiaals/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Filiaal filiaal = db.filiaal_codeSet.Find(id);
            if (filiaal == null)
            {
                return HttpNotFound();
            }
            return View(filiaal);
        }

        // POST: Filiaals/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Filiaal filiaal = db.filiaal_codeSet.Find(id);
            db.filiaal_codeSet.Remove(filiaal);
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