﻿using LiteComemerce.Admin;
using LiteCommerce.BusinessLayers;
using LiteCommerce.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LiteComemerce.Admin.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    /// 
    [Authorize]
    public class AccountController : Controller
    {
        // GET: Account
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ChangePassword()
        {
            return View();
        }

        public ActionResult SignOut()
        {
            Session.Abandon();
            Session.Clear();
            System.Web.Security.FormsAuthentication.SignOut();
            return RedirectToAction("SignIn");
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [AllowAnonymous]
        [HttpGet]
        public ActionResult SignIn()
        {
            //nếu đã đăng nhập chuyển về dashboard
            if (User.Identity.IsAuthenticated)
                return RedirectToAction("Index", "Dashboard");
            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        [ValidateAntiForgeryToken] //kiểm tra token hợp lệ không
        public ActionResult SignIn(string email = "", string password = "")
        {
            UserAccount user = UserAccountBLL.Authorize(email, password, UserAccountTypes.Employee);
            if(user != null)//đăng nhập thành công
            {
                //Ghi nhận phiên đăng nhập
                WebUserData userData = new WebUserData()
                {
                    UserID = user.UserID,
                    FullName = user.FullName,
                    GroupName = "Employee",
                    LoginTime = DateTime.Now,
                    SessionID = Session.SessionID,
                    ClientIP = Request.UserHostAddress,
                    Photo = user.Photo,
                    Title = user.Title,
                    Roles = user.Roles
                };
                System.Web.Security.FormsAuthentication.SetAuthCookie(userData.ToCookieString(), false);
                return RedirectToAction("Index", "Dashboard");
            }
            else
            {
                ModelState.AddModelError("LoginError", "Login Fail");
                //gửi dữ liệu qua form
                ViewBag.Email = email;
                return View();
            }


            ////TODO: kiểm tra tài khoản thông qua cơ sở dữ liệu
            //if(email == "quoc@gmail.com" && password == "123")
            //{
            //    //ghi nhận phiên đăng nhập của tài khoản
            //    System.Web.Security.FormsAuthentication.SetAuthCookie(email,false);
            //    //chuyển về dashboad
            //    return RedirectToAction("Index", "Dashboard");
            //}
            //else
            //{
            //    //gửi dữ liệu qua form theo LoginError
            //    ModelState.AddModelError("LoginError", "Login Fail");
            //    //gửi dữ liệu qua form
            //    ViewBag.Email = email;
            //    return View();
            //}
        }

        [AllowAnonymous]
        public ActionResult ForgotPassword()
        {
            return View();
        }
    }
}