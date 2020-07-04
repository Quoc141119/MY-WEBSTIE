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
import com.shopdongho.model.SupplierModel;
import com.shopdongho.service.SupplierService;

@Controller
public class SupplierController {
	
	@Autowired
	SupplierService supplierService;
	
	@RequestMapping(value = "admin-listsupplier")
	public String showListSupplier(Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("listsupplier", supplierService.findAll());

		return "admin/listsupplier";
	}
	
	@RequestMapping("admin-addsupplier")
	public String addSupplier(Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("savesupplier", new SupplierModel());
		return "admin/addsupplier";
	}

	@RequestMapping(value = "/admin-saveSupplier", method = RequestMethod.GET)
	public String saveSupplier(@ModelAttribute("savesupplier") SupplierModel supplierModel, Model model, HttpSession session) {
	//	System.out.println(supplierModel.getSupplierName());
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		if(supplierService.existSupplier(supplierModel.getSupplierName(), supplierModel.getAddress(), supplierModel.getCountry())==false) {
			supplierService.insertSupplier(supplierModel);
			return "redirect:admin-listsupplier";
		}
		model.addAttribute("thongbao", "add");
		return "admin/addsupplier";
		
	}
	
	@RequestMapping(value = "admin-deletesupplier", method = RequestMethod.GET)
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
		supplierService.deleteSupplierByID(id);
		model.addAttribute("listcategory", supplierService.findAll());
		return "redirect:admin-listsupplier";
	}
	
	@RequestMapping(value = "/admin-editsupplier", method = RequestMethod.GET)
	public String editSupplier(@RequestParam int id, Model model, HttpSession session) {
//		System.out.println(id);
//		System.out.println(supplierService.findOne(id).getCountry());
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("editsupplier", supplierService.findOne(id));
		return "admin/editsupplier";
	}
	
	@RequestMapping(value = "admin-saveeditSupplier", method = RequestMethod.GET)
	public String saveEditSupplier(@ModelAttribute("editsupplier") SupplierModel supplierModel, Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		if(supplierService.existSupplier(supplierModel.getSupplierName(), supplierModel.getAddress(), supplierModel.getCountry())==false) {
//			System.out.println(supplierModel.getSupplierID());
//			System.out.println(supplierModel.getSupplierName());
			supplierService.editSupplier(supplierModel.getSupplierID(), supplierModel.getSupplierName(), supplierModel.getAddress(), supplierModel.getCountry());
			return "redirect:admin-listsupplier";
		}			
		model.addAttribute("thongbao", "edit");
		return "admin/editsupplier";
		
	}
	
	@RequestMapping(value = "admin-searchSupplier")
	public String searchListCategory(Model model, @RequestParam String search, HttpSession session) {
	//	System.out.println(search);
	//	System.out.println(categoryService.findByCategoryName(search).get(1).getCategoryName());
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		if(supplierService.findByName(search).size() == 0)
			model.addAttribute("thongbao", "mees");
		else
			model.addAttribute("listsupplier", supplierService.findByName(search));

		return "admin/listsupplier";
	}
}
