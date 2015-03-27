using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using projectWebKassa.DAL;
using projectWebKassa.BL;
using projectWebKassa.Models;

namespace projectWebKassa.Controllers
{
    public class ProductManagmentController : Controller
    {       
        // GET: ProductManagment
        public ActionResult Index()
        {
            ProductManagmentViewModel productmanagment = new ProductManagmentViewModel();
            List<CategorieViewModels> categorieLijst = new List<CategorieViewModels>();
            List<ProductViewModels> ProductLijst = new List<ProductViewModels>();
            List<PrijsViewModels> PrijsLijst = new List<PrijsViewModels>();
            ProductManagmentViewModel.ProductService productservice = new ProductManagmentViewModel.ProductService();

            categorieLijst = productservice.HaalAlleCategorieen();

            ViewBag.Catlijst = new SelectList(categorieLijst, "CategorieID", "CategorieNaam");

            ProductLijst = productservice.HaalAlleProductenPer(categorieLijst.FirstOrDefault().CategorieID);

            ViewBag.PrdLijst = new SelectList(ProductLijst, "ProductID", "ProductNaam");

            PrijsLijst = productservice.HaalAllePrijzenPer(ProductLijst.FirstOrDefault().ProductID);

            ViewBag.PrijsLijst = new SelectList(PrijsLijst, "VerkoopPrijsID", "PrijsID");

            productmanagment = new ProductManagmentViewModel()
            {
                CategorieenLijst = categorieLijst,
                ProductenLijst = ProductLijst,
                VerkoopPrijzenLijst = PrijsLijst
            };

            return View(productmanagment);
        }
        
        public ActionResult CategoriePerCadID(int CadID)
        {

        }
    }
}