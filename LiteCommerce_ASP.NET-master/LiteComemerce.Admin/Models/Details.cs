using LiteCommerce.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LiteComemerce.Admin.Models
{
    public class Details
    {
        public int orderID { get; set; }
        public List<OrderDetail> data { get; set; }
        public float total
        {
            get
            {
                float t = 0;
                foreach (var detail in data)
                {
                    t += detail.UnitPrice;
                }
                return t;
            }
        }
    }
}