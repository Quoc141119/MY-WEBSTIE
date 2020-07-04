package com.shopdongho.controller.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shopdongho.model.CustomerModel;
import com.shopdongho.service.OrderService;

@Controller(value = "orderControllerOfWeb")
@RequestMapping(value = "/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/history")
	public String showOrderHistory(Model model, HttpSession session) {
		if(session.getAttribute("customer") != null) {
			CustomerModel customer = (CustomerModel)session.getAttribute("customer");
			model.addAttribute("lstOrderHistory", orderService.getAllOrderByCustomerID(customer.getCustomerId()));
			return "web/order-History";
		}
		return "web/order-History";
	}
}
