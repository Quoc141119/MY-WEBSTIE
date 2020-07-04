using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LiteComemerce.Admin
{
    /// <summary>
    /// Định nghĩa danh sách các Role của user
    /// </summary>
    public class WebUserRoles
    {
        /// <summary>
        /// Nhân viên bán hàng
        /// </summary>
        public const string SALEMAN = "saleman";
        /// <summary>
        /// Quản trị dữ liệu
        /// </summary>
        public const string MANAGERDATA = "managedata";
        /// <summary>
        /// Quản trị tài khoản
        /// </summary>
        public const string MANAGERACCOUNT = "manageraccount";
    }
}