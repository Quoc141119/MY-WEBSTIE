using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LiteCommerce.DomainModels;

namespace LiteCommerce.DataLayers.SqlSever
{
    public class CustomerUserAccountDAL : IUserAccountDAL
    {
        private string connectionString;
        public CustomerUserAccountDAL(string connectionString)
        {
            this.connectionString = connectionString;
        }
        public UserAccount Authorize(string username, string password)
        {
            //TODO: lấy user từ database
            return new UserAccount()
            {
                UserID = username,
                FullName = "Customer A",
                Title = "A",
                Photo = "customer.jpg"
            };
        }
    }
}
