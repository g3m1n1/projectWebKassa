using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using projectWebKassa.DAL;

namespace projectWebKassa.Controllers
{
    public class prijsController : Controller
    {
        private WebKassaContextContainer db = new WebKassaContextContainer();

        // GET: prijs
        public ActionResult Index()
        {
            var prijsSet = db.prijsSet.Include(p => p.product);
            return View(prijsSet.ToList());
        }

        // GET: prijs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            prijs prijs = db.prijsSet.Find(id);
            if (prijs == null)
            {
                return HttpNotFound();
            }
            return View(prijs);
        }

        // GET: prijs/Create
        public ActionResult Create()
        {
            ViewBag.productId = new SelectList(db.productSet, "ProductId", "Naam");
            return View();
        }

        // POST: prijs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PrijsId,productId,Prijs")] prijs prijs1)
        {

            if (ModelState.IsValid)
            {
                db.prijsSet.Add(prijs1);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.productId = new SelectList(db.productSet, "ProductId", "Naam");
            return View(prijs1);
        }

        // GET: prijs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            prijs prijs = db.prijsSet.Find(id);
            if (prijs == null)
            {
                return HttpNotFound();
            }
            ViewBag.productId = new SelectList(db.productSet, "ProductId", "Naam", prijs.productId);
            return View(prijs);
        }

        // POST: prijs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PrijsId,productId,Prijs")] prijs prijs1)
        {
            if (ModelState.IsValid)
            {
                db.Entry(prijs1).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.productId = new SelectList(db.productSet, "ProductId", "Naam");
            return View(prijs1);
        }

        // GET: prijs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            prijs prijs = db.prijsSet.Find(id);
            if (prijs == null)
            {
                return HttpNotFound();
            }
            return View(prijs);
        }

        // POST: prijs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            prijs prijs = db.prijsSet.Find(id);
            db.prijsSet.Remove(prijs);
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
