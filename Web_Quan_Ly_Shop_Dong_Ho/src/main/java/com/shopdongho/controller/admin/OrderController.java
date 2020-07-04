package com.shopdongho.controller.admin;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopdongho.model.EmployeeModel;
import com.shopdongho.model.OrderDetailModel;
import com.shopdongho.model.OrderModel;
import com.shopdongho.model.ProductModel;
import com.shopdongho.service.EmployeeService;
import com.shopdongho.service.OrderDetailService;
import com.shopdongho.service.OrderService;
import com.shopdongho.service.ProductService;

@Controller
public class OrderController {

	@Autowired
	OrderService orderService;

	@Autowired
	OrderDetailService orderDetailSer;

	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	ProductService productService;

	@RequestMapping("admin-listOrderQueue")
	public String showListOderQueue(Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}
		else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("listQueue", orderService.findListQueue());
		return "admin/listOrderQueue";
	}

	@RequestMapping("admin-listOrderComfirmed")
	public String showListOderComfirmed(Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}
		else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("listComfirmed", orderService.findListComfirmed());
		return "admin/listOrderComfirmed";
	}
	
	@RequestMapping("admin-listOrderCancelled")
	public String showListOderCancelled(Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}
		else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("listCancelled", orderService.findListCancelled());
		return "admin/listOrderCancelled";
	}
	
	@RequestMapping("admin-listOrderHistory")
	public String showListOderHistory(Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}
		else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("listHistory", orderService.findListHistory());
		return "admin/listOrderHistorys";
	}
	
	@RequestMapping("admin-listOrderError")
	public String showListOderError(Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}
		else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("listError", orderService.findListError());
		return "admin/listOrderError";
	}

	@RequestMapping("admin-showOrderDetail")
	public String showOderDetail(@RequestParam("id") int id, @RequestParam("list") String list, Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}
		else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		List<OrderDetailModel> listDetail = orderDetailSer.findBy(orderService.findOne(id));
		model.addAttribute("list", list);
		model.addAttribute("listDetail", listDetail);
		return "admin/orderDetail";
	}

	@RequestMapping("admin-comfirmOrder")
	public String comfirmOrder(@RequestParam("id") int id, Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}
		else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		OrderModel order = orderService.findOne(id);
		List<OrderDetailModel> listDetail = orderDetailSer.findBy(order);
		for (OrderDetailModel detail : listDetail) {
			if(detail.getQuantity() > detail.getProduct().getQuantity()) {
				order.setStatus("Error: quantity not enough");
				order.setEmployee((EmployeeModel)session.getAttribute("employeeSession"));
				orderService.save(order);
				return "redirect:admin-listOrderQueue";
			}
		}
		for (OrderDetailModel detail : listDetail) {
			ProductModel product = detail.getProduct();
			product.setQuantity(product.getQuantity() - detail.getQuantity());
			productService.update(product.getQuantity(), product.getProductID());
		}
		order.setStatus("comfirmed");
		order.setEmployee((EmployeeModel)session.getAttribute("employeeSession"));
		orderService.save(order);
		return "redirect:admin-listOrderQueue";
	}

	@RequestMapping("admin-destroyOrder")
	public String destroyOrder(@RequestParam("id") int id, @RequestParam("list") String list, Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}
		else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		OrderModel order = orderService.findOne(id);
		order.setStatus("cancelled");
		order.setEmployee((EmployeeModel)session.getAttribute("employeeSession"));
		orderService.save(order);
		return "redirect:" + list;
	}
	
	@RequestMapping("admin-unfollowOrder")
	public String unfollowOrder(@RequestParam("id") int id, @RequestParam("list") String list, Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}
		else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		OrderModel order = orderService.findOne(id);
		order.setStatus(order.getStatus() + ".");
		order.setEmployee((EmployeeModel)session.getAttribute("employeeSession"));
		orderService.save(order);
		return "redirect:" + list;
	}
}
