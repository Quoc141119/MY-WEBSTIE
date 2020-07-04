package com.shopdongho.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.annotations.MetaValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.shopdongho.model.CustomerModel;
import com.shopdongho.model.EmployeeModel;
import com.shopdongho.service.CustomerService;

@Controller
public class CustomerController {

	@Autowired
	CustomerService customerSer;
	
	@RequestMapping("admin-listCustomer")
	public String showListCustomer(Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		List<CustomerModel> lsCtm = customerSer.findAll();
		model.addAttribute("listCustomer", lsCtm);
		return "admin/listCustomer";
	}
	
	@RequestMapping("admin-deleteCustomer")
	public String deleteCustomer(@RequestParam String id, HttpSession session ,Model model) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("message", customerSer.delete(Integer.parseInt(id)));
		model.addAttribute("listCustomer", customerSer.findAll());
		return "redirect:admin-listCustomer";
	}
	
	@RequestMapping("admin-searchCustomer")
	public String searchCustomer(@RequestParam String search, HttpSession session ,Model model) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("listCustomer", customerSer.searchCustomerByName(search));
		return "admin/listCustomer";
	}
	
	@RequestMapping("admin-showCustomerInfo")
	public String showCustomerInfo(@RequestParam("id") String id, @RequestParam("list") String list, HttpSession session, Model model) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}
		model.addAttribute("customer", customerSer.findOne(Integer.parseInt(id)));
		model.addAttribute("list", list);
		return "admin/infoCustomer";
	}
}
