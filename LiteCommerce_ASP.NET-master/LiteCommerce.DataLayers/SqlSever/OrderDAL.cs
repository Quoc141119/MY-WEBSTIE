using LiteCommerce.DomainModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiteCommerce.DataLayers.SqlSever
{
    public class OrderDAL : IOrderDAL
    {
        private string connectionString;

        /// <summary>
        /// COnstruct
        /// </summary>
        /// <param name="connectionString"></param>
        public OrderDAL(string connectionString)
        {
            this.connectionString = connectionString;
        }
        public int Count(string searchValue, string status)
        {
            int count = 0;
            if (!string.IsNullOrEmpty(searchValue))
            {
                searchValue = "%" + searchValue + "%";
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand();
                if(status != "")
                {
                    cmd.CommandText = @"select count(*) from Orders where (@searchValue = N'' 
                                                                or CustomerID like @searchValue) AND Status like @status";
                }
                else
                {
                    cmd.CommandText = @"select count(*) from Orders where (@searchValue = N'' 
                                                                or CustomerID like @searchValue) AND (Status is NULL or Status = N'cho xac nhan')";
                }
                
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                cmd.Parameters.AddWithValue("@searchValue", searchValue);
                cmd.Parameters.AddWithValue("@status", status);

                count = Convert.ToInt32(cmd.ExecuteScalar());

                connection.Close();
            }
            return count;

        }

        public List<Order> List(int page, int pagesize, string searchValue, string status)
        {
            List<Order> data = new List<Order>();
            if (!string.IsNullOrEmpty(searchValue))
            {
                searchValue = "%" + searchValue + "%";
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                //chuẩn bị câu lệnh
                SqlCommand cmd = new SqlCommand();
                if(status == "")
                {
                    cmd.CommandText = @"select * from (select *, ROW_NUMBER() over(order by CustomerID) as RowNumber
                                            from Orders
                                            where ((@searchValue = N'') or (CustomerID like @searchValue)) AND (Status is NULL or Status = N'cho xac nhan'))as t
                                            where t.RowNumber between (@page-1)*@pageSize+1 and @page*@pageSize
                                            order by t.RowNumber ";
                }
                else
                {
                    cmd.CommandText = @"select * from (select *, ROW_NUMBER() over(order by CustomerID) as RowNumber
                                            from Orders
                                            where ((@searchValue = N'') or (CustomerID like @searchValue)) AND Status = @status)as t
                                            where t.RowNumber between (@page-1)*@pageSize+1 and @page*@pageSize
                                            order by t.RowNumber ";
                }
                

                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                cmd.Parameters.AddWithValue("@page", page);
                cmd.Parameters.AddWithValue("@pageSize", pagesize);
                cmd.Parameters.AddWithValue("@searchValue", searchValue);
                cmd.Parameters.AddWithValue("@status", status);
                using (SqlDataReader dbReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    while (dbReader.Read())
                    {
                        data.Add(new Order()
                        {
                            CustomerID = Convert.ToString(dbReader["CustomerID"]),
                            EmployeeID = Convert.ToInt32(dbReader["EmployeeID"]),
                            Freight = Convert.ToDouble(dbReader["Freight"]),
                            OrderDate = Convert.ToDateTime(dbReader["OrderDate"]),
                            OrderID = Convert.ToInt32(dbReader["OrderID"]),
                            RequiredDate = Convert.ToDateTime(dbReader["RequiredDate"]),
                            ShipAddress = Convert.ToString(dbReader["ShipAddress"]),
                            ShipCity = Convert.ToString(dbReader["ShipCity"]),
                            ShipCountry = Convert.ToString(dbReader["ShipCountry"]),
                            ShippeDate = Convert.ToDateTime(dbReader["ShippedDate"]),
                            ShipperID = Convert.ToInt32(dbReader["ShipperID"]),
                            Status = Convert.ToString(dbReader["Status"])
                        });
                    }
                }
                
                connection.Close();
            }
            return data;
        }

        public Order Get(int orderID)
        {
            Order data = null;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = @"SELECT * FROM Orders WHERE OrderID = @orderID";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                cmd.Parameters.AddWithValue("@orderID", orderID);

                using (SqlDataReader dbReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    if (dbReader.Read())
                    {
                        data = new Order()
                        {
                            CustomerID = Convert.ToString(dbReader["CustomerID"]),
                            EmployeeID = Convert.ToInt32(dbReader["EmployeeID"]),
                            Freight = Convert.ToDouble(dbReader["Freight"]),
                            OrderDate = Convert.ToDateTime(dbReader["OrderDate"]),
                            OrderID = Convert.ToInt32(dbReader["OrderID"]),
                            RequiredDate = Convert.ToDateTime(dbReader["RequiredDate"]),
                            ShipAddress = Convert.ToString(dbReader["ShipAddress"]),
                            ShipCity = Convert.ToString(dbReader["ShipCity"]),
                            ShipCountry = Convert.ToString(dbReader["ShipCountry"]),
                            ShippeDate = Convert.ToDateTime(dbReader["ShippeDate"]),
                            ShipperID = Convert.ToInt32(dbReader["ShipperID"]),
                            Status = Convert.ToString(dbReader["Status"])
                        };
                    }
                }

                connection.Close();
            }
            return data;
        }

        public int Add(Order data)
        {
            int productId = 0;
            using (SqlConnection connection = new SqlConnection(this.connectionString))
            {
                connection.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = @"INSERT INTO Orders
                                          (
	                                          CustomerID,
	                                          EmployeeID,
                                              Freight,
	                                          OrderDate,
                                              RequiredDate,
                                              ShipAddress,
                                              ShipCity,
                                              ShipCountry,
                                              ShippedDate,
                                              ShipperID,
                                              Status
                                          )
                                          VALUES
                                          (
	                                          @CustomerID,
	                                          @EmployeeID,
                                              @Freight,
	                                          @OrderDate,
                                              @RequiredDate,
                                              @ShipAddress,
                                              @ShipCity,
                                              @ShipCountry,
                                              @ShippedDate,
                                              @ShipperID,
                                              @Status
                                          );
                                          SELECT @@IDENTITY;";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                cmd.Parameters.AddWithValue("@CustomerID", data.CustomerID);
                cmd.Parameters.AddWithValue("@EmployeeID", data.EmployeeID);
                cmd.Parameters.AddWithValue("@Freight", data.Freight);
                cmd.Parameters.AddWithValue("@OrderDate", data.OrderDate);
                cmd.Parameters.AddWithValue("@RequiredDate", data.RequiredDate);
                cmd.Parameters.AddWithValue("@ShipAddress", data.ShipAddress);
                cmd.Parameters.AddWithValue("@ShipCity", data.ShipCity);
                cmd.Parameters.AddWithValue("@ShipCountry", data.ShipCountry);
                cmd.Parameters.AddWithValue("@ShippedDate", data.ShippeDate);
                cmd.Parameters.AddWithValue("@ShipperID", data.ShipperID);
                cmd.Parameters.AddWithValue("@Status", "cho xac nhan");

                productId = Convert.ToInt32(cmd.ExecuteScalar());

                connection.Close();
            }

            return productId;
        }

        public bool Update(int orderID, string status)
        {
            int rowsAffected = 0;
            using (SqlConnection connection = new SqlConnection(this.connectionString))
            {
                connection.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = @"UPDATE Orders
                                           SET  Status = @Status
                                          WHERE OrderID = @OrderID";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                cmd.Parameters.AddWithValue("@OrderID", orderID);
                cmd.Parameters.AddWithValue("@Status", status);


                rowsAffected = Convert.ToInt32(cmd.ExecuteNonQuery());

                connection.Close();
            }

            return rowsAffected > 0;
        }

        public int Delete(int[] orderIDs)
        {
            int countDeleted = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = @"DELETE FROM Orders
                                            WHERE(OrderID = @orderID)
                                              AND(OrderID NOT IN(SELECT OrderID FROM OrderDetails))";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                cmd.Parameters.Add("@orderID", SqlDbType.Int);
                foreach (int orderID in orderIDs)
                {
                    cmd.Parameters["@orderID"].Value = orderID;
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                        countDeleted += 1;
                }

                connection.Close();
            }
            return countDeleted;
        }
    }
}
