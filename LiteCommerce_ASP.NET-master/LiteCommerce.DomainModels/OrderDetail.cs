using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiteCommerce.DomainModels
{
    /// <summary>
    /// chi tiết đơn đặt hàng
    /// </summary>
    public class OrderDetail
    {
        public int OrderID { get; set; }
        public int ProductID { get; set; }
        public float UnitPrice { get; set; }
        public long Quantity { get; set; }
        public float Discount { get; set; }
        public Product Product { get; set; }
    }
}
