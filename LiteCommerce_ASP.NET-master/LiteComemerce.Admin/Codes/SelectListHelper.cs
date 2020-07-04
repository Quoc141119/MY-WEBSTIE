using LiteCommerce.BusinessLayers;
using LiteCommerce.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LiteComemerce.Admin
{
    public class SelectListHelper
    {
        /// <summary>
        /// selectlist các quốc gia
        /// </summary>
        /// <returns></returns>
        public static List<SelectListItem> Countries(bool allowSelectAll = true)
        {
            List<SelectListItem> list = new List<SelectListItem>();
            if (allowSelectAll)
            {
                list.Add(new SelectListItem() { Value = "", Text = "-- All Countries --" });
            }
            List<Country> data = CatalogBLL.ListOfCountries();
            foreach (var country in data)
            {
                list.Add(new SelectListItem() { Value = country.CountryName, Text = country.CountryName });
            }

            return list;

        }

        public static List<SelectListItem> Categories(bool allowSelectAll = true)
        {
            List<SelectListItem> list = new List<SelectListItem>();
            if (allowSelectAll)
            {
                list.Add(new SelectListItem() { Value = "0", Text = "--All Categories--" });
            }
            // lấy ds category db
            List<Categorie> data = CatalogBLL.ListOfCategories();
            foreach(var category in data)
            {
                list.Add(new SelectListItem() { Value = category.CategoryID.ToString() , Text = category.CategoryName });
            }
            
            return list;

        }

        public static List<SelectListItem> Suppliers(bool allowSelectAll = true)
        {
            List<SelectListItem> list = new List<SelectListItem>();
            if (allowSelectAll)
            {
                list.Add(new SelectListItem() { Value = "0", Text = "--All Suppliers--" });
            }
            List<Supplier> data = CatalogBLL.ListOfSuppliers();
            foreach (var supplier in data)
            {
                list.Add(new SelectListItem() { Value = supplier.SupplierID.ToString(), Text = supplier.CompanyName });
            }
            return list;

        }

        public static List<SelectListItem> Attributes(bool allowSelectAll = true)
        {
            List<SelectListItem> list = new List<SelectListItem>();
            if (allowSelectAll)
            {
                list.Add(new SelectListItem() { Value = "0", Text = "--All AttributeName--" });
            }
            List<Attributes> data = CatalogBLL.ListOfAttributes();
            foreach (var att in data)
            {
                list.Add(new SelectListItem() { Value = att.AttributeName, Text = att.AttributeName });
            }
            return list;

        }

        public static List<SelectListItem> Customers()
        {
            List<SelectListItem> list = new List<SelectListItem>();
            List<Customer> data = CatalogBLL.ListOfCustomers();
            foreach (var cus in data)
            {
                list.Add(new SelectListItem() { Value = cus.CustomerID, Text = cus.CompanyName });
            }
            return list;

        }

        public static List<SelectListItem> Shippers()
        {
            List<SelectListItem> list = new List<SelectListItem>();
            List<Shipper> data = CatalogBLL.ListOfShippers();
            foreach (var shi in data)
            {
                list.Add(new SelectListItem() { Value = Convert.ToString(shi.ShipperID), Text = shi.CompanyName });
            }
            return list;

        }

        public static List<SelectListItem> Employees()
        {
            List<SelectListItem> list = new List<SelectListItem>();
            List<Employee> data = CatalogBLL.ListOfEmployees();
            foreach (var emp in data)
            {
                list.Add(new SelectListItem() { Value = Convert.ToString(emp.EmployeeID), Text = emp.FirstName + emp.LastName });
            }
            return list;

        }

        public static List<SelectListItem> Products()
        {
            List<SelectListItem> list = new List<SelectListItem>();
            List<Product> data = CatalogBLL.ListOfProducts();
            foreach (var pro in data)
            {
                list.Add(new SelectListItem() { Value = Convert.ToString(pro.ProductID), Text = pro.ProductName });
            }
            return list;

        }
    }
}