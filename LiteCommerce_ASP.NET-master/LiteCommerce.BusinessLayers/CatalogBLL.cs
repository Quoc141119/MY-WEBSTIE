using LiteCommerce.DataLayers;
using LiteCommerce.DataLayers.SqlSever;
using LiteCommerce.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiteCommerce.BusinessLayers
{
    /// <summary>
    /// Các chức năng quản lý nghiệp vụ liên quan đến
    /// quản lý dữ liệu chung của hệ thống như : nhà cung cấp , khách hàng , mặt hàng ....
    /// </summary>
    public static class CatalogBLL
    {
        /// <summary>
        /// Hàm phải được gọi để khởi tạo các chức năng tác nghiệp
        /// </summary>
        /// <param name="connectionString"></param>
        public static void Initialize(string connectionString)
        {
            SupplierDB = new DataLayers.SqlSever.SupplierDAL(connectionString);
            CustomerDB = new DataLayers.SqlSever.CustomerDAL(connectionString);
            ShipperDB = new DataLayers.SqlSever.ShipperDAL(connectionString);
            CategorieDB = new DataLayers.SqlSever.CategorieDAL(connectionString);
            EmployeeDB = new DataLayers.SqlSever.EmployeeDAL(connectionString);
            ChangePassDB = new DataLayers.SqlSever.ChangePassDAL(connectionString);
            ProductDB = new DataLayers.SqlSever.ProductDAL(connectionString);
            CountrieDB = new DataLayers.SqlSever.CountrieDAL(connectionString);
            ProductAttributeDB = new DataLayers.SqlSever.ProductAttributeDAL(connectionString);
            AttributeDB = new DataLayers.SqlSever.AttributeDAL(connectionString);
            OrderDB = new DataLayers.SqlSever.OrderDAL(connectionString);
            OrderDetailDB = new DataLayers.SqlSever.OrderDetailDAL(connectionString);
        }

       // Khai báo các thuộc tính giao tiếp với DAL
        private static ISupplierDAL SupplierDB { get; set; }

        private static ICustomerDAL CustomerDB { get; set; }

        private static IShipperDAL ShipperDB { get; set; }

        private static ICategorieDAL CategorieDB { get; set; }

        private static IEmployeeDAL EmployeeDB { get; set; }

        private static IChangePassDAL ChangePassDB { get; set; }

        private static IProductDAL ProductDB { get; set; }

        private static ICountrieDAL CountrieDB { get; set; }

        private static IProductAttributeDAL ProductAttributeDB { get; set; }

        private static IAttributeDAL AttributeDB { get; set; }

        private static IOrderDetailsDAL OrderDetailDB { get; set; }

        private static IOrderDAL OrderDB { get; set; }

        public static List<Attributes> ListOfAttributes()
        {
            return AttributeDB.List();
        }
        #region Supplier
        // Khai báo các chức năng xử lý nghiệp vụ
        /// <summary>
        /// Hiển thị suppliers
        /// </summary>
        /// <param name="page"></param>
        /// <param name="pageSize"></param>
        /// <param name="searchValue"></param>
        /// <param name="rowCount"></param>
        /// <returns></returns>
        public static List<Supplier> ListOfSuppliers(int page, int pageSize, string searchValue, out int rowCount)
        {
            if (page < 1)
                page = 1;
            if (pageSize < 0)
                pageSize = 20;
            rowCount = SupplierDB.Count(searchValue);
            return SupplierDB.List(page, pageSize, searchValue);      
        }

        public static List<Supplier> ListOfSuppliers()
        {
            return SupplierDB.List(1, -1, "");
        }

        /// <summary>
        /// lấy supplier by id
        /// </summary>
        /// <param name="supplierID"></param>
        /// <returns></returns>
        public static Supplier GetSupplier(int supplierID)
        {
            return SupplierDB.Get(supplierID);
        }
        
        /// <summary>
        /// thêm supplier
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static int AddSupplier(Supplier data)
        {
            return SupplierDB.Add(data);
        }

        /// <summary>
        /// cập nhật supplier
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static bool UpdateSupplier(Supplier data)
        {
            return SupplierDB.Update(data);
        }

        /// <summary>
        /// delete 1 hoặc nhiều supplier by id
        /// </summary>
        /// <param name="supplierIDs"></param>
        /// <returns></returns>
        public static int DeleteSuppliers(int[] supplierIDs)
        {
            return SupplierDB.Delete(supplierIDs);
        }
        #endregion

        #region Detail
        // Khai báo các chức năng xử lý nghiệp vụ
        /// <summary>
        /// Hiển thị suppliers
        /// </summary>
        /// <param name="page"></param>
        /// <param name="pageSize"></param>
        /// <param name="searchValue"></param>
        /// <param name="rowCount"></param>
        /// <returns></returns>
        public static List<OrderDetail> ListOfOrderDetails(int orderID)
        {
            List<OrderDetail> listDetails =  OrderDetailDB.List(orderID);
            foreach(var detail in listDetails)
            {
                detail.Product = ProductDB.Get(detail.ProductID);
            }
            return listDetails;
        }

        /// <summary>
        /// thêm supplier
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static int AddOrderDetail(OrderDetail data)
        {
            return OrderDetailDB.Add(data);
        }

        public static bool UpdateOrderDetail(OrderDetail data)
        {
            return OrderDetailDB.Update(data);
        }

        public static OrderDetail GetOrderDetail(int orderID, int productID)
        {
            return OrderDetailDB.Get(orderID, productID);
        }
        #endregion

        #region Country
        // Khai báo các chức năng xử lý nghiệp vụ
        /// <summary>
        /// Hiển thị suppliers
        /// </summary>
        /// <param name="page"></param>
        /// <param name="pageSize"></param>
        /// <param name="searchValue"></param>
        /// <param name="rowCount"></param>
        /// <returns></returns>
        public static List<Country> ListOfCountries(int page, int pageSize, string searchValue, out int rowCount)
        {
            if (page < 1)
                page = 1;
            if (pageSize < 0)
                pageSize = 20;
            rowCount = CountrieDB.Count(searchValue);
            return CountrieDB.List(page, pageSize, searchValue);
        }

        public static List<Country> ListOfCountries()
        {
            return CountrieDB.List(1, -1, "");
        }

        /// <summary>
        /// lấy supplier by id
        /// </summary>
        /// <param name="supplierID"></param>
        /// <returns></returns>
        public static Country GetCountry(int countryID)
        {
            return CountrieDB.Get(countryID);
        }

        /// <summary>
        /// thêm supplier
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static int AddCountry(Country data)
        {
            return CountrieDB.Add(data);
        }

        /// <summary>
        /// cập nhật supplier
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static bool UpdateCountry(Country data)
        {
            return CountrieDB.Update(data);
        }

        /// <summary>
        /// delete 1 hoặc nhiều supplier by id
        /// </summary>
        /// <param name="supplierIDs"></param>
        /// <returns></returns>
        public static int DeleteCountries(int[] countryIDs)
        {
            return CountrieDB.Delete(countryIDs);
        }
        #endregion

        #region Customer
        // Khai báo các chức năng xử lý nghiệp vụ
        /// <summary>
        /// Hiển thị customers
        /// </summary>
        /// <param name="page"></param>
        /// <param name="pageSize"></param>
        /// <param name="searchValue"></param>
        /// <param name="rowCount"></param>
        /// <returns></returns>
        public static List<Customer> ListOfCustomers(int page, int pageSize, string searchValue, string country, out int rowCount)
        {
            if (page < 1)
                page = 1;
            if (pageSize < 0)
                pageSize = 20;
            rowCount = CustomerDB.Count(searchValue, country);
            return CustomerDB.List(page, pageSize, searchValue, country);
        }

        public static List<Customer> ListOfCustomers()
        {
            return CustomerDB.List(1, -1, "", "");
        }

        public static Customer GetCustomer(string customerId)
        {
            return CustomerDB.Get(customerId);
        }

        public static int AddCustomer(Customer data)
        {
            return CustomerDB.Add(data);
        }

        public static bool UpdateCustomer(Customer data)
        {
            return CustomerDB.Update(data);
        }


        public static int DeleteCustomers(string[] customerIDs)
        {
            return CustomerDB.Delete(customerIDs);
        }
        #endregion

        #region Order
        // Khai báo các chức năng xử lý nghiệp vụ
        /// <summary>
        /// Hiển thị customers
        /// </summary>
        /// <param name="page"></param>
        /// <param name="pageSize"></param>
        /// <param name="searchValue"></param>
        /// <param name="rowCount"></param>
        /// <returns></returns>
        public static List<Order> ListOfOrders(int page, int pageSize, string searchValue, string status, out int rowCount)
        {
            if (page < 1)
                page = 1;
            if (pageSize < 0)
                pageSize = 20;
            rowCount = OrderDB.Count(searchValue, status);
            List<Order> listOrders = OrderDB.List(page, pageSize, searchValue, status);

            foreach(var order in listOrders)
            {
                order.Customer = CustomerDB.Get(order.CustomerID);
                order.Employee = EmployeeDB.Get(order.EmployeeID);
            }

            return listOrders;
        }

        public static Order GetOrder(int orderID)
        {
            return OrderDB.Get(orderID);
        }

        public static int AddOrder(Order data)
        {
            return OrderDB.Add(data);
        }

        public static bool UpdateOrder(int orderID, string status)
        {
            return OrderDB.Update(orderID, status);
        }


        public static int DeleteOrders(int[] orderIDs)
        {
            foreach(var orderID in orderIDs)
            {
                OrderDetailDB.Delete(orderID);
            }
            return OrderDB.Delete(orderIDs);
        }
        #endregion

        #region shippers
        // Khai báo các chức năng xử lý nghiệp vụ
        /// <summary>
        /// HIển thị shipper
        /// </summary>
        /// <param name="page"></param>
        /// <param name="pageSize"></param>
        /// <param name="searchValue"></param>
        /// <param name="rowCount"></param>
        /// <returns></returns>
        public static List<Shipper> ListOfShippers(int page, int pageSize, string searchValue, out int rowCount)
        {
            if (page < 1)
                page = 1;
            if (pageSize < 0)
                pageSize = 20;
            rowCount = ShipperDB.Count(searchValue);
            return ShipperDB.List(page, pageSize, searchValue);
        }

        public static List<Shipper> ListOfShippers()
        {
            return ShipperDB.List(1, -1, "");
        }

        public static Shipper GetShipper(int shipperId)
        {
            return ShipperDB.Get(shipperId);
        }

        public static int AddShipper(Shipper data)
        {
            return ShipperDB.Add(data);
        }

        public static bool UpdateShipper(Shipper data)
        {
            return ShipperDB.Update(data);
        }


        public static int DeleteShippers(int[] shipperIDs)
        {
            return ShipperDB.Delete(shipperIDs);
        }
        #endregion

        #region categories
        //Khai báo các chức năng xử lý nghiệp vụ
        public static List<Categorie> ListOfCategories(int page, int pageSize, string searchValue, out int rowCount)
        {
            if (page < 1)
                page = 1;
            if (pageSize < 0)
                pageSize = 20;
            rowCount = CategorieDB.Count(searchValue);
            return CategorieDB.List(page, pageSize, searchValue);

        }
        public static List<Categorie> ListOfCategories()
        {
            return CategorieDB.List(1, -1, "");
        }
        public static Categorie GetCategorie(int categoryId)
        {
            return CategorieDB.Get(categoryId);
        }


        public static int AddCategorie(Categorie data)
        {
            return CategorieDB.Add(data);
        }


        public static bool UpdateCategorie(Categorie data)
        {
            return CategorieDB.Update(data);
        }


        public static int DeleteCategories(int[] categoryIDs)
        {
            return CategorieDB.Delete(categoryIDs);
        }
        #endregion
        //khai báo các chức năng xử lý nghiệp vụ
        public static List<Employee> ListOfEmployees(int page, int pageSize, string searchValue, out int rowCount)
        {
            if (page < 1)
                page = 1;
            if (pageSize < 0)
                pageSize = 20;
            rowCount = EmployeeDB.Count(searchValue);
            return EmployeeDB.List(page, pageSize, searchValue);
        }

        public static List<Employee> ListOfEmployees()
        {
            return EmployeeDB.List(1, -1, "");
        }

        public static Employee GetEmployee(int employeeID)
        {
            return EmployeeDB.Get(employeeID);
        }

        public static int AddEmployee(Employee data)
        {
            return EmployeeDB.Add(data);
        }

        public static int DeleteEmployees(int[] employeeIDs)
        {
            return EmployeeDB.Delete(employeeIDs);
        }

        public static bool UpdateEmployee(Employee data)
        {
            return EmployeeDB.Update(data);
        }

        // change pass
        public static ChangePass GetEmployeeChange(int employeeId)
        {
            return ChangePassDB.Get(employeeId);
        }

        public static bool UpdatePass(ChangePass data)
        {
            return ChangePassDB.UpdatePass(data);
        }


        ///// product

        public static List<Product> ListOfProducts(int page, int pageSize, string searchValue, out int rowCount, int supplier, int category)
        {
            if (page < 1)
                page = 1;
            if (pageSize <= 0)
                pageSize = 20;
            rowCount = ProductDB.Count(searchValue);
            return ProductDB.List(page, pageSize, searchValue, supplier, category);
        }

        public static List<Product> ListOfProducts()
        {
            return ProductDB.List(1, -1, "", 0, 0);
        }

        //public static List<Product> ListOfProducts()
        //{
        //    return ProductDB.List(1, -1 , "");
        //}

        public static Product GetProduct(int productId)
        {
            return ProductDB.Get(productId);
        }

        public static int AddProduct(Product data)
        {
            return ProductDB.Add(data);
        }

        public static bool UpdateProduct(Product data)
        {
            return ProductDB.Update(data);
        }


        public static int DeleteProducts(int[] productIDs)
        {
            return ProductDB.Delete(productIDs);
        }

        // product attribute

        public static List<ProductAttribute> ListOfProductAttribute(int page, int pageSize, string searchValue, out int rowCount, int productId)
        {
            if (page < 1)
                page = 1;
            if (pageSize <= 0)
                pageSize = 20;
            rowCount = ProductAttributeDB.Count(searchValue, productId);
            return ProductAttributeDB.List(page, pageSize, searchValue, productId);
        }

        public static int AddProductAttribute(ProductAttribute data)
        {
            return ProductAttributeDB.Add(data);
        }

        public static bool UpdateProductAttribute(ProductAttribute data)
        {
            return ProductAttributeDB.Update(data);
        }


        public static int DeleteProductAttributes(int[] attrubuteIDs)
        {
            return ProductAttributeDB.Delete(attrubuteIDs);
        }

        public static ProductAttribute GetProductAttribute(int attributeID)
        {
            return ProductAttributeDB.Get(attributeID);
        }
    }
}
