using LiteCommerce.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LiteComemerce.Admin.Models
{
    public class CountryPaginationResult : PaginationResult
    {
        /// <summary>
        /// danh sách danh mục
        /// </summary>
        public List<Country> Data { get; set; }
    }
}