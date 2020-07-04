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
    /// cung cấp các tác nghiệp liên quan đến người dùng
    /// </summary>
    public class UserAccountBLL
    {
        private static string _connectString;

        public static void Initialize(string connectionString)
        {
            _connectString = connectionString;
        }

        public static UserAccount Authorize(string userName, string password, UserAccountTypes userType)
        {
            IUserAccountDAL userAccountDB;
            switch (userType)
            {
                case UserAccountTypes.Employee:
                    userAccountDB = new EmployeeUserAccountDAL(_connectString);
                    break;
                case UserAccountTypes.Customer:
                    userAccountDB = new CustomerUserAccountDAL(_connectString);
                    break;
                default:
                    return null;
            }
            return userAccountDB.Authorize(userName, password);
        }
    }
}
