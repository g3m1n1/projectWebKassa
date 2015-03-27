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
    public class productsController : Controller
    {
        private WebKassaContextContainer db = new WebKassaContextContainer();

        // GET: products
        public ActionResult Index()
        {
            var productSet = db.productSet.Include(p => p.categorie);
            return View(productSet.ToList());
        }

        // GET: products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            product product = db.productSet.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: products/Create
        public ActionResult Create()
        {
            ViewBag.categorieId = new SelectList(db.categorieSet, "categorieId", "Naam");
            return View();
        }

        // POST: products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]



        public ActionResult Create([Bind(Include = "ProductId,categorieId,Naam")] product product)
        {
            if (ModelState.IsValid)
            {
                db.productSet.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.categorieId = new SelectList(db.categorieSet, "categorieId", "Naam", product.categorieId);
            return View(product);
        }

        // GET: products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            product product = db.productSet.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.categorieId = new SelectList(db.categorieSet, "categorieId", "Naam", product.categorieId);
            return View(product);
        }

        // POST: products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductId,categorieId,Naam")] product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.categorieId = new SelectList(db.categorieSet, "categorieId", "Naam", product.categorieId);
            return View(product);
        }

        // GET: products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            product product = db.productSet.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            product product = db.productSet.Find(id);
            db.productSet.Remove(product);
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
