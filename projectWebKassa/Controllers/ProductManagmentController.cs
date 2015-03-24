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
    public class ProductManagmentController : Controller
    {

       
        // GET: ProductManagment
        public ActionResult Index()
        {
            
            return View();
        }
    }
}