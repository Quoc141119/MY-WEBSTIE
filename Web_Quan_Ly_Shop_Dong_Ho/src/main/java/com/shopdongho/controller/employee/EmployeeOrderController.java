package com.shopdongho.controller.employee;

import java.util.Collection;
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
public class EmployeeOrderController {

	@Autowired
	OrderService orderService;

	@Autowired
	OrderDetailService orderDetailSer;

	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("employee-listOrderQueue")
	public String showListOderQueue(Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 1) {
				return "redirect:admin-home";
			}
		}
		model.addAttribute("list", "employee-listOrderQueue");
		model.addAttribute("listQueue", orderService.findListQueue());
		return "employee/listOrderQueue";
	}

	@RequestMapping("employee-listOrderComfirmed")
	public String showListOderComfirmed(Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 1) {
				return "redirect:admin-home";
			}
		}
		model.addAttribute("list", "employee-listOrderComfirmed");
		model.addAttribute("listComfirmed", orderService.findListComfirmed());
		return "employee/listOrderComfirmed";
	}
	
	@RequestMapping("employee-listOrderCancelled")
	public String showListOderCancelled(Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 1) {
				return "redirect:admin-home";
			}
		}
		model.addAttribute("listCancelled", orderService.findListCancelled());
		return "employee/listOrderCancelled";
	}
	
	@RequestMapping("employee-listOrderHistory")
	public String showListOderHistory(Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 1) {
				return "redirect:admin-home";
			}
		}
		model.addAttribute("listHistory", orderService.findListHistory());
		return "employee/listOrderHistorys";
	}
	
	@RequestMapping("employee-listOrderError")
	public String showListOderError(Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 1) {
				return "redirect:admin-home";
			}
		}
		model.addAttribute("listError", orderService.findListError());
		return "employee/listOrderError";
	}


	@RequestMapping("employee-showOrderDetail")
	public String showOderDetail(@RequestParam("id") int id, @RequestParam("list") String list, Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 1) {
				return "redirect:admin-home";
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("listDetail", orderDetailSer.findBy(orderService.findOne(id)));
		return "employee/orderDetail";
	}

	@RequestMapping("employee-comfirmOrder")
	public String comfirmOrder(@RequestParam("id") int id, Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 1) {
				return "redirect:admin-home";
			}
		}
		OrderModel order = orderService.findOne(id);
		List<OrderDetailModel> listDetail = orderDetailSer.findBy(order);
		for (OrderDetailModel detail : listDetail) {
			if(detail.getQuantity() > detail.getProduct().getQuantity()) {
				order.setStatus("quantity not enough");
				order.setEmployee((EmployeeModel)session.getAttribute("employeeSession"));
				orderService.save(order);
				return "redirect:employee-listOrderQueue";
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
		return "redirect:employee-listOrderQueue";
	}
	
	@RequestMapping("employee-destroyOrder")
	public String destroyOrder(@RequestParam("id") int id, @RequestParam("list") String list, Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 1) {
				return "redirect:admin-home";
			}
		}
		OrderModel order = orderService.findOne(id);
		order.setStatus("cancelled");
		order.setEmployee((EmployeeModel)session.getAttribute("employeeSession"));
		orderService.save(order);
		return "redirect:" + list;
	}
	
	@RequestMapping("employee-unfollowOrder")
	public String unfollowOrder(@RequestParam("id") int id, @RequestParam("list") String list, Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 1) {
				return "redirect:admin-home";
			}
		}
		OrderModel order = orderService.findOne(id);
		order.setStatus("complete");
		order.setEmployee((EmployeeModel)session.getAttribute("employeeSession"));
		orderService.save(order);
		return "redirect:" + list;
	}

	@RequestMapping("employee-deleteOrder")
	public String deleteOrder(@RequestParam("id") int id, @RequestParam("list") String list, Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 1) {
				return "redirect:admin-home";
			}
		}
		orderService.deleteOrder(id);
		if(list.equals("queue")) {
			return "redirect:employee-listOrderQueue";
		}else {
			return "redirect:employee-listOrderComfirmed";
		}
	}
}
