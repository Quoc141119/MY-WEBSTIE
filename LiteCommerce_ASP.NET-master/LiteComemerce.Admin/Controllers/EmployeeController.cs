using LiteCommerce.BusinessLayers;
using LiteCommerce.DomainModels;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LiteComemerce.Admin.Controllers
{
    [Authorize(Roles = WebUserRoles.MANAGERACCOUNT)]
    public class EmployeeController : Controller
    {
        // GET: Employee
        public ActionResult Index(int page = 1, string searchValue = "")
        {
            int pageSize = 3;
            int rowCount = 0;
            List<Employee> ListOfEmployees = CatalogBLL.ListOfEmployees(page,pageSize,searchValue, out rowCount);
            var model = new Models.EmployeePaginationResult()
            {
                Page = page,
                PageSize = pageSize,
                SearchValue = searchValue,
                RowCount = rowCount,
                Data = ListOfEmployees
            };
            return View(model);
        }

        [HttpGet]
        public ActionResult Input(string id = "")
        {
            try
            {           
                if(string.IsNullOrEmpty(id))
                {
                    ViewBag.Title = "Create New Employee";
                    Employee newEmployee = new Employee()
                    {
                        EmployeeID = 0,
                        PhotoPath = "637268811398077242.jpg",
                        Roles = "saleman",
                        BirthDate = DateTime.UtcNow,
                        HireDate = DateTime.UtcNow
                    };
                    return View(newEmployee);
                }
                else
                {
                    ViewBag.Title = "Edit a Employee";
                    Employee editEmployee = CatalogBLL.GetEmployee(Convert.ToInt32(id));
                    if (editEmployee == null)
                        return RedirectToAction("Index");
                    return View(editEmployee);
                }
               
            }
            catch (Exception ex)
            {
                return Content(ex.Message + ": " + ex.StackTrace);
            }
        }

        [HttpPost]
        public ActionResult Input(Employee model, string[] Roles, HttpPostedFileBase uploadFile)
        {
            if(string.IsNullOrEmpty(model.LastName))
                ModelState.AddModelError("LastName", "LastName Expected");
            if (string.IsNullOrEmpty(model.FirstName))
                ModelState.AddModelError("FirstName", "FirstName Expected");
            if (string.IsNullOrEmpty(model.Title))
                ModelState.AddModelError("Title", "Title Expected");

            DateTime birthDate = model.BirthDate;
            if (birthDate == null)
                ModelState.AddModelError("BirthDate", "");
            DateTime hireDate = model.HireDate;
            if (hireDate == null)
                ModelState.AddModelError("HireDate", "");

            if (Roles != null)
                for(int i = 1; i < Roles.Length; i++)
                {
                    model.Roles += "," + Roles[i];
                }
            else
            {
                model.Roles = "";
            }
            if (string.IsNullOrEmpty(model.Country))
                model.Country = "";
            if (string.IsNullOrEmpty(model.Email))
                model.Email = "";
            if (string.IsNullOrEmpty(model.Address))
                model.Address = "";
            if (string.IsNullOrEmpty(model.City))
                model.City = "";
            if (string.IsNullOrEmpty(model.Country))
                model.Country = "";
            if (string.IsNullOrEmpty(model.HomePhone))
                model.HomePhone = "";
            if (string.IsNullOrEmpty(model.Notes))
                model.Notes = "";
            if (string.IsNullOrEmpty(model.PhotoPath))
                model.PhotoPath = "";
            //if (string.IsNullOrEmpty(model.Password))
            //    model.Password = model.Password;

           

            //upload ảnh
            if (uploadFile != null)
            {
                string folder = Server.MapPath("~/Images/Uploads");
                string fileName = $"{DateTime.Now.Ticks}{Path.GetExtension(uploadFile.FileName)}";
              //  string fileName = Guid.NewGuid() + uploadFile.FileName;
                string filePath = Path.Combine(folder, fileName);
                uploadFile.SaveAs(filePath);
                model.PhotoPath = fileName;
            }
            

            if (!ModelState.IsValid)
            {
                ViewBag.Title = model.EmployeeID == 0 ? "Create new Employee" : "Edit Employee";
                return View(model);
            }
            //Lưu vào DB
            //TODO: Lưu dữ liệu vao DB 
            
            if (model.EmployeeID == 0)
            {
                CatalogBLL.AddEmployee(model);
            }
            else
            {
                CatalogBLL.UpdateEmployee(model);
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult Delete(int[] employeeIDs = null)
        {
            if (employeeIDs != null)
            {
                CatalogBLL.DeleteEmployees(employeeIDs);
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult ChangePassword(string id = "")
        {
            if (!string.IsNullOrEmpty(id))
            {
                ViewBag.Title = "ChangePassword";
                ChangePass changePass = CatalogBLL.GetEmployeeChange(Convert.ToInt32(id));
                if (changePass != null)
                    return View(changePass);
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ChangePassword(ChangePass model)
        {
            if(string.IsNullOrEmpty(model.NewPassWord))
                ModelState.AddModelError("NewPassWord", "NewPassWord Expected");
            if (string.IsNullOrEmpty(model.EnterAgain))
                ModelState.AddModelError("EnterAgain", "EnterAgain Expected");
            if (model.OldPassWord == model.NewPassWord)
                ModelState.AddModelError("NewPassWord", "The new password must not be the same as the old password");
            if (model.NewPassWord != model.EnterAgain)
                ModelState.AddModelError("EnterAgain", "Password do not match");
            if (!ModelState.IsValid)
            {
                ViewBag.Title = "ChangePassword";
                return View(model);
            }
            if(model.EmployeeID != 0)
            {
                CatalogBLL.UpdatePass(model);
                if (!CatalogBLL.UpdatePass(model))
                {                
                    return RedirectToAction("ChangePassword");
                }                          
            }       
            return RedirectToAction("Index");
        }


    }
}