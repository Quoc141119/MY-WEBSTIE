using LiteCommerce.BusinessLayers;
using LiteCommerce.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LiteComemerce.Admin.Controllers
{
    [Authorize(Roles = WebUserRoles.MANAGERDATA)]
    public class CountryController : Controller
    {
        // GET: Suppliers
        public ActionResult Index(int page = 1, string searchValue = "")
        {
            //int pageSize = 3; 
            //int rowCount = 0;
            //List<Supplier> model = CatalogBLL.ListOfSuppliers(page,pageSize,searchValue, out rowCount);
            //ViewBag.rowCount = rowCount;           
            //return View(model);

            int pageSize = 3;
            int rowCount = 0;
            List<Country> ListOfCountries = CatalogBLL.ListOfCountries(page, pageSize, searchValue, out rowCount);

            var model = new Models.CountryPaginationResult()
            {
                Page = page,
                PageSize = pageSize,
                RowCount = rowCount,
                SearchValue = searchValue,
                Data = ListOfCountries
            };
            return View(model);
        }

        [HttpGet]
        public ActionResult Input(string id = "")
        {
            try
            {
                if (string.IsNullOrEmpty(id))
                {
                    ViewBag.Title = "Creat new Country";
                    Country newCountry = new Country()
                    {
                        CountryID = 0,
                    };
                    return View(newCountry);
                }
                else
                {
                    ViewBag.Title = "Edit a Country";
                    Country editCountry = CatalogBLL.GetCountry(Convert.ToInt32(id));
                    if (editCountry == null)
                        return RedirectToAction("Index");
                    return View(editCountry);
                }
            }
            catch (Exception ex)
            {
                return Content(ex.Message + ": " + ex.StackTrace);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Input(Country model)
        {

            //TODO: Kiểm tra tính hợp lệ của dữ liệu được nhập
            if (string.IsNullOrEmpty(model.CountryName))
                ModelState.AddModelError("CountryName", "CountryName Expected");

            if (!ModelState.IsValid)
            {
                ViewBag.Title = model.CountryID == 0 ? "Create new Country" : "Edit Country";
                return View(model);
            }
            //TODO: Lưu dữ liệu vao DB 


            if (model.CountryID == 0)
            {
                CatalogBLL.AddCountry(model);
            }
            else
            {
                CatalogBLL.UpdateCountry(model);
            }
            return RedirectToAction("Index");


        }

        /// <summary>
        /// xóa suppliers by id
        /// </summary>
        /// <param name="supplierIDs"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Delete(int[] countryIDs = null)
        {
            if (countryIDs != null)
            {
                CatalogBLL.DeleteCountries(countryIDs);
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }
    }
}