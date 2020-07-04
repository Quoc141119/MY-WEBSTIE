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
    public class OrderDetailDAL : IOrderDetailsDAL
    {
        private string connectionString;

        /// <summary>
        /// COnstruct
        /// </summary>
        /// <param name="connectionString"></param>
        public OrderDetailDAL(string connectionString)
        {
            this.connectionString = connectionString;
        }
        public int Count(string searchValue)
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
                cmd.CommandText = @"select count(*) from OrderDetails where @searchValue = N'' 
                                                                or ProductID like @searchValue";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                cmd.Parameters.AddWithValue("@searchValue", searchValue);

                count = Convert.ToInt32(cmd.ExecuteScalar());

                connection.Close();
            }
            return count;

        }

        public List<OrderDetail> List(int orderID)
        {
            List<OrderDetail> data = new List<OrderDetail>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                //chuẩn bị câu lệnh
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = @"select * from OrderDetails
                                            where OrderID = @orderID";

                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                cmd.Parameters.AddWithValue("@orderID", orderID);
                using (SqlDataReader dbReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    while (dbReader.Read())
                    {
                        data.Add(new OrderDetail()
                        {
                            OrderID = Convert.ToInt32(dbReader["OrderID"]),
                            ProductID = Convert.ToInt32(dbReader["ProductID"]),
                            Discount = Convert.ToInt32(dbReader["Discount"]),
                            Quantity = Convert.ToInt32(dbReader["Quantity"]),
                            UnitPrice = Convert.ToInt32(dbReader["UnitPrice"])
                        });
                    }
                }

                connection.Close();
            }
            return data;
        }

        public OrderDetail Get(int orderID, int productID)
        {
            OrderDetail data = null;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = @"SELECT * FROM OrderDetails WHERE OrderID = @orderID and ProductID = @productID";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                cmd.Parameters.AddWithValue("@orderID", orderID);
                cmd.Parameters.AddWithValue("@productID", productID);

                using (SqlDataReader dbReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    if (dbReader.Read())
                    {
                        data = new OrderDetail()
                        {
                            OrderID = Convert.ToInt32(dbReader["OrderID"]),
                            ProductID = Convert.ToInt32(dbReader["ProductID"]),
                            Discount = Convert.ToInt32(dbReader["Discount"]),
                            Quantity = Convert.ToInt32(dbReader["Quantity"]),
                            UnitPrice = Convert.ToInt32(dbReader["UnitPrice"])
                        };
                    }
                }

                connection.Close();
            }
            return data;
        }

        public int Add(OrderDetail data)
        {
            int rowsAffected = 0;
            using (SqlConnection connection = new SqlConnection(this.connectionString))
            {
                connection.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = @"INSERT INTO OrderDetails
                                          (
                                              OrderID,
	                                          ProductID,
	                                          Discount,
                                              Quantity,
	                                          UnitPrice
                                          )
                                          VALUES
                                          (
	                                          @OrderID,
	                                          @ProductID,
	                                          @Discount,
                                              @Quantity,
	                                          @UnitPrice
                                          );";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                cmd.Parameters.AddWithValue("@OrderID", data.OrderID);
                cmd.Parameters.AddWithValue("@ProductID", data.ProductID);
                cmd.Parameters.AddWithValue("@Discount", data.Discount);
                cmd.Parameters.AddWithValue("@Quantity", data.Quantity);
                cmd.Parameters.AddWithValue("@UnitPrice", data.UnitPrice);
                rowsAffected =  cmd.ExecuteNonQuery();

                connection.Close();
            }

            return rowsAffected;
        }

        public bool Update(OrderDetail data)
        {
            int rowsAffected = 0;
            using (SqlConnection connection = new SqlConnection(this.connectionString))
            {
                connection.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = @"UPDATE OrderDetails
                                           SET Discount = @Discount,
                                              Quantity = @Quantity,
	                                          UnitPrice = @UnitPrice
                                          WHERE OrderID = @OrderID AND ProductID = @ProductID";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                cmd.Parameters.AddWithValue("@OrderID", data.OrderID);
                cmd.Parameters.AddWithValue("@ProductID", data.ProductID);
                cmd.Parameters.AddWithValue("@Discount", data.Discount);
                cmd.Parameters.AddWithValue("@Quantity", data.Quantity);
                cmd.Parameters.AddWithValue("@UnitPrice", data.UnitPrice);

                rowsAffected = Convert.ToInt32(cmd.ExecuteNonQuery());

                connection.Close();
            }

            return rowsAffected > 0;
        }

        public int Delete(int orderID)
        {
            int countDeleted = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = @"DELETE FROM OrderDetails
                                            WHERE OrderID = @orderID";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                cmd.Parameters.AddWithValue("@orderID", orderID);
                int rowsAffected = cmd.ExecuteNonQuery();

                connection.Close();
            }
            return countDeleted;
        }
    }
}
