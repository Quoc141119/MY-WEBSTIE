package com.shopdongho.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shopdongho.model.AccountModel;
import com.shopdongho.model.EmployeeModel;
import com.shopdongho.service.AccountService;
import com.shopdongho.service.CategoryService;
import com.shopdongho.service.EmployeeService;
import com.shopdongho.service.OrderService;
import com.shopdongho.service.ProductService;

@Controller
public class LoginController {

	@Autowired
	AccountService accountSer;

	@Autowired
	EmployeeService employeeSer;
	
	@Autowired 
	ProductService productService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	OrderService orderService;

	@RequestMapping("admin-home")
	public String adminHome(Model model, HttpSession session) {
		if (session.getAttribute("employeeSession") != null) {
			EmployeeModel employeeSession = (EmployeeModel) session.getAttribute("employeeSession");
			if (employeeSession.getAccount().getRole() == 1) {
				model.addAttribute("productSize", productService.findAll().size());
				model.addAttribute("categorySize", categoryService.findAll().size());
				model.addAttribute("lstQueueSize", orderService.findListQueue().size());
				return "admin/home";

			}else {
				model.addAttribute("lstQueueSize", orderService.findListQueue().size());
				return "employee/employeeHome";

			} 
		} else {
			return "admin/login";
		}
	}

	@RequestMapping("admin-login")
	public String loginAdmin(HttpSession session, HttpServletRequest request,
			Model model) {
		if (request.getParameter("uname") != null && request.getParameter("psw") != null) {
			String uname = request.getParameter("uname");
			String psw = request.getParameter("psw");
			AccountModel account = accountSer.checkLogin(uname, psw);
			if (account != null) {
				session.setAttribute("employeeSession", employeeSer.findOneByAccount(account));
				return "redirect:admin-home";
			} else {
				model.addAttribute("uname", uname);
				model.addAttribute("psw", psw);
				model.addAttribute("message", "Username hoặc password không đúng!");
				return "admin/login";
			}
		}
		return "redirect:admin-home";
	}

	@RequestMapping("admin-logout")
	public String logoutAdmin(HttpSession session, Model model) {
		if (session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}
		session.removeAttribute("employeeSession");
		return "redirect:admin-home";
	}
}
