﻿using LiteCommerce.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LiteComemerce.Admin.Models
{
    public class EmployeePaginationResult : PaginationResult
    {
        public List<Employee> Data { get; set; }
    }
}