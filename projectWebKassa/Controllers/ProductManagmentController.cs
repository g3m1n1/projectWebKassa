using System.Web.Mvc;

namespace projectWebKassa.Controllers
{
    public class ProductManagmentController : Controller
    {
        // GET: ProductManagment
        public ActionResult Index()
        {
            return View("PrijsIndex");
        }

    }
}