using LiteCommerce.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiteCommerce.DataLayers
{
    public interface IOrderDAL
    {
        /// <summary>
        /// Hiển thị product (phân trang)
        /// </summary>
        /// <param name="page"></param>
        /// <param name="pagesize"></param>
        /// <param name="searchValue"></param>
        /// <returns></returns>
        List<Order> List(int page, int pagesize, string searchValue, string status);

        /// <summary>
        /// count
        /// </summary>
        /// <param name="searchValue"></param>
        /// <returns></returns>
        int Count(string searchValue, string status);

        Order Get(int orderID);

        int Add(Order data);

        bool Update(int orderID, string status);

        int Delete(int[] orderIDs);
    }
}
