package com.shopdongho.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopdongho.model.CategoryModel;
import com.shopdongho.model.EmployeeModel;
import com.shopdongho.service.CategoryService;

@Controller
public class CategoryController {

	@Autowired
	CategoryService categoryService;

	@RequestMapping(value = "admin-listcategory")
	public String showListCategory(Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("listcategory", categoryService.findAll());
		return "admin/listcategory";
	}

	@RequestMapping("admin-addcategory")
	public String addCategory(Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("savecategory", new CategoryModel());
		return "admin/addcategory";
	}

	@RequestMapping(value = "/admin-saveCategory")
	public String saveCategory(@ModelAttribute("savecategory") CategoryModel categoryModel, Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		if (categoryService.existsByCategoryName(categoryModel.getCategoryName()) == false) {
			// System.out.println("a");
			categoryService.save(categoryModel);
			return "redirect:admin-listcategory";
		}
		// System.out.println("b");
		model.addAttribute("thongbao", "Thêm Thất Bại");
		return "admin/addcategory";
	}

	@RequestMapping(value = "admin-deletecategory")
	public String deleteCategory(@RequestParam int id, Model model, HttpSession session) {
		// System.out.println(id);
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		categoryService.deleteCategorysByID(id);
		model.addAttribute("listcategory", categoryService.findAll());
		return "redirect:admin-listcategory";
	}

	@RequestMapping(value = "/admin-editcategory")
	public String editCategory(Model model, @RequestParam int id, HttpSession session) {
		// System.out.println();
//		System.out.println(categoryService.findOne(Integer.valueOf(request.getParameter("id"))).getCategoryName());
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("editcategory", categoryService.findOne(id));

		return "admin/editcategory";
	}

	@RequestMapping(value = "admin-saveeditCategory")
	public String saveeditCategory(Model model, @ModelAttribute("editcategory") CategoryModel categoryModel, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		if (categoryService.existsByCategoryName(categoryModel.getCategoryName()) == false) {
			categoryService.editCategorysByID(categoryModel.getCategoryID(), categoryModel.getCategoryName());
			return "redirect:admin-listcategory";
		}

		model.addAttribute("thongbao", "mees");
		return "admin/editcategory";

	}

	@RequestMapping(value = "admin-searchCategory")
	public String searchListCategory(Model model, @RequestParam String search, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("listcategory", categoryService.findByCategoryName(search));

		return "admin/listcategory";
	}

}
