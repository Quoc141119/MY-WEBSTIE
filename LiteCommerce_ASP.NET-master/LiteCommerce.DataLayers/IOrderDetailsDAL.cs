using LiteCommerce.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiteCommerce.DataLayers
{
    public interface IOrderDetailsDAL
    {
        /// <summary>
        /// Hiển thị product (phân trang)
        /// </summary>
        /// <param name="page"></param>
        /// <param name="pagesize"></param>
        /// <param name="searchValue"></param>
        /// <returns></returns>
        List<OrderDetail> List(int orderID);

        /// <summary>
        /// count
        /// </summary>
        /// <param name="searchValue"></param>
        /// <returns></returns>
        int Count(string searchValue);

        OrderDetail Get(int orderID, int productID);

        int Add(OrderDetail data);

        bool Update(OrderDetail data);

        int Delete(int order);
    }
}
