using LiteCommerce.BusinessLayers;
using LiteCommerce.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LiteComemerce.Admin.Controllers
{
    [Authorize(Roles = WebUserRoles.SALEMAN)]
    public class OrderController : Controller
    {
        // GET: Order
        public ActionResult Index(int page = 1, string searchValue = "", string status = "")
        {
            int pageSize = 10;
            int rowCount = 0;
            List<Order> ListOfOrders = CatalogBLL.ListOfOrders(page, pageSize, searchValue, status, out rowCount);

            var model = new Models.OrderPaginationResult()
            {
                Page = page,
                PageSize = pageSize,
                RowCount = rowCount,
                SearchValue = searchValue,
                Data = ListOfOrders
            };
            return View(model);
        }

        public ActionResult ListComfirm(int page = 1, string searchValue = "", string status = "comfirm")
        {
            int pageSize = 10;
            int rowCount = 0;
            List<Order> ListOfOrders = CatalogBLL.ListOfOrders(page, pageSize, searchValue, status, out rowCount);

            var model = new Models.OrderPaginationResult()
            {
                Page = page,
                PageSize = pageSize,
                RowCount = rowCount,
                SearchValue = searchValue,
                Data = ListOfOrders
            };
            return View(model);
        }

        public ActionResult ListCancel(int page = 1, string searchValue = "", string status = "cancel")
        {
            int pageSize = 10;
            int rowCount = 0;
            List<Order> ListOfOrders = CatalogBLL.ListOfOrders(page, pageSize, searchValue, status, out rowCount);

            var model = new Models.OrderPaginationResult()
            {
                Page = page,
                PageSize = pageSize,
                RowCount = rowCount,
                SearchValue = searchValue,
                Data = ListOfOrders
            };
            return View(model);
        }

        // GET: Detail
        public ActionResult Detail(string id)
        {
            var model = new Models.Details()
            {
                data = CatalogBLL.ListOfOrderDetails(Convert.ToInt32(id))
            }; 
            return View(model);
        }

        // GET: Detail
        public ActionResult Comfirm(string id)
        {
            CatalogBLL.UpdateOrder(Convert.ToInt32(id), "comfirm");
            return RedirectToAction("Index");
        }

        // GET: Detail
        public ActionResult Cancel(string id)
        {
            CatalogBLL.UpdateOrder(Convert.ToInt32(id), "cancel");
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Input(string id = "")
        {
            ViewBag.Title = "Add products";
            var model = new Models.Details()
            {
                data = CatalogBLL.ListOfOrderDetails(Convert.ToInt32(id)),
                orderID = Convert.ToInt32(id)
            };
            return View(model);
        }

        [HttpPost]
        public ActionResult Input(OrderDetail model)
        {
            model.Product = CatalogBLL.GetProduct(model.ProductID);
            model.UnitPrice = (model.Quantity * model.Product.UnitPrice) - (model.Quantity * model.Product.UnitPrice * model.Discount / 100);
            try
            {
                CatalogBLL.AddOrderDetail(model);
            }
            catch (Exception ex)
            {
                OrderDetail detail = CatalogBLL.GetOrderDetail(model.OrderID, model.ProductID);
                model.Quantity += detail.Quantity;
                model.UnitPrice += detail.UnitPrice;
                CatalogBLL.UpdateOrderDetail(model);
            }
            return RedirectToAction("Input", new { id = model.OrderID });
        }

        [HttpPost]
        public ActionResult Delete(int[] orderIDs = null)
        {
            if (orderIDs != null)
            {
                CatalogBLL.DeleteOrders(orderIDs);
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.Title = "Create New Order";
            Order newOrder = new Order()
            {
                OrderID = 0,
                EmployeeID = 0,
                RequiredDate = DateTime.UtcNow,
                ShippeDate = DateTime.UtcNow
            };
            return View(newOrder);
        }

        [HttpPost]
        public ActionResult Create(Order model)
        {
            if(model.CustomerID == null)
                ModelState.AddModelError("CustomerID", "CustomerID Expected");
            if (model.ShipAddress == null)
                ModelState.AddModelError("ShipAddress", "ShipAddress Expected");
            if (model.RequiredDate.CompareTo(DateTime.UtcNow) > 0)
                ModelState.AddModelError("RequiredDate", "RequiredDate Expected");
            if (model.ShippeDate.CompareTo(DateTime.UtcNow) > 0)
                ModelState.AddModelError("ShippeDate", "ShippeDate Expected");
            if (model.ShipCity == null)
                ModelState.AddModelError("ShipCity", "ShipCity Expected");
            if (model.ShipCountry == null)
                ModelState.AddModelError("ShipCountry", "ShipCountry Expected");
            if (model.ShipAddress == null)
                ModelState.AddModelError("ShipAddress", "ShipAddress Expected");
            if (model.EmployeeID == 0)
                ModelState.AddModelError("Employee", "EmployeeID Expected");

            model.OrderDate = DateTime.UtcNow;

            if (!ModelState.IsValid)
            {
                ViewBag.Title = "Create New Order";
                return View(model);
            }
            else
            {
                int orderID = CatalogBLL.AddOrder(model);
                return RedirectToAction("Input", new { id = orderID});
            }            
        }
    }
}