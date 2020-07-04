using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LiteComemerce.Admin
{
    /// <summary>
    /// Lưu thông tin liên quan đến tài khoản đăng nhập tại 1 phiên làm việc
    /// </summary>
    public class WebUserData
    {
        /// <summary>
        /// ID/tên đăng nhập của tài khoản
        /// </summary>
        public string UserID { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string Title { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string Roles { get; set; }
        /// <summary>
        /// Tên gọi/tên hiển thị của tài khoản
        /// </summary>
        /// <summary>
        /// Tên gọi/tên hiển thị của tài khoản
        /// </summary>
        public string FullName { get; set; }
        /// <summary>
        /// Tên nhóm
        /// </summary>
        public string GroupName { get; set; }
        /// <summary>
        /// Thời điểm đăng nhập
        /// </summary>
        public DateTime LoginTime { get; set; }
        /// <summary>
        /// Session ID
        /// </summary>
        public string SessionID { get; set; }
        /// <summary>
        /// Địa chỉ IP của user khi đăng nhập
        /// </summary>
        public string ClientIP { get; set; }
        /// <summary>
        /// Ảnh
        /// </summary>
        public string Photo { get; set; }

        /// <summary>
        /// Chuyển thông tin tài khoản đăng nhập thành chuỗi để ghi Cookie
        /// </summary>
        /// <returns></returns>
        public string ToCookieString()
        {
            return string.Format($"{UserID}|{FullName}|{Title}|{Roles}|{GroupName}|{LoginTime}|{SessionID}|{ClientIP}|{Photo}");
        }

        /// <summary>
        /// Lấy thông tin tài khoản đăng nhập từ Cookie
        /// </summary>
        /// <param name="cookie"></param>
        /// <returns></returns>
        public static WebUserData FromCookieString(string cookie)
        {
            try
            {
                string[] infos = cookie.Split('|');
                if (infos.Length == 9)
                {
                    return new WebUserData()
                    {
                        UserID = infos[0],
                        FullName = infos[1],
                        Title = infos[2],
                        Roles = infos[3],
                        GroupName = infos[4],
                        LoginTime = Convert.ToDateTime(infos[5]),
                        SessionID = infos[6],
                        ClientIP = infos[7],
                        Photo = infos[8]
                    };
                }
                else
                {
                    return null;
                }
            }
            catch
            {
                return null;
            }
        }
    }
}