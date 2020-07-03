﻿using LiteCommerce.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiteCommerce.DataLayers
{
    public interface IChangePassDAL
    {
        ChangePass Get(int employeeID);
        bool UpdatePass(ChangePass data);
    }
}
