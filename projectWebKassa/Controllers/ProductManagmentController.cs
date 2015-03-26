using projectWebKassa.DAL;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
namespace projectWebKassa.Controllers
{
    public class ProductManagmentController : Controller
    {
        private WebKassaContextContainer db = new WebKassaContextContainer();
        // GET: ProductManagment
        public ActionResult Index()
        {

            return View();
        }

        public ActionResult PrijsIndex()
        {
            var prijsSet = db.prijsSet.Include(p => p.product);
            return View(prijsSet.ToList());
        }

    }
}