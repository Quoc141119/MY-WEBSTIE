package com.shopdongho.controller.web;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shopdongho.model.CustomerModel;
import com.shopdongho.model.ItemModel;
import com.shopdongho.model.Login;
import com.shopdongho.model.OrderModel;
import com.shopdongho.model.ProductModel;
import com.shopdongho.service.CheckoutService;
import com.shopdongho.service.OrderDetailService;
import com.shopdongho.service.OrderService;

@Controller
public class CheckoutController {
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	@Autowired
	private CheckoutService checkoutService;
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	@RequestMapping(value = "/checkout")
	private String showCheckout(Model model, HttpServletRequest request,HttpSession session) {
		// Kiem tra ton tai customer
		if(session.getAttribute("customer") == null) {
			CustomerModel customer = new CustomerModel();
			session.setAttribute("customer", customer);
			model.addAttribute("login", new Login());
			model.addAttribute("isCheckout", "isCheckout");
			return "web/login";
		}
		else {
			// Kiem tra gio hang
			if(session.getAttribute("cart") != null) {
				float total = 0;
				List<ItemModel> cart = (List<ItemModel>)session.getAttribute("cart");
				for (ItemModel itemModel : cart) {
					ProductModel product = itemModel.getProduct();
					total += (product.getPrice() - product.getPrice()*product.getDiscount()/100) 
							* itemModel.getQuantity();
				}
				model.addAttribute("totalPrice", total);
			}
			return "web/checkout";
		}	
	}
	
	@RequestMapping(value = "/checkout/buy", method = RequestMethod.POST)
	private String buy(Model model, HttpServletRequest request, HttpSession session) {
		Date dateOrder = new Date();
		Time timeOrder = new Time(dateOrder.getTime());
		float totalPrice = 0;
		int customerId;
		String city = "";
		String district = ""; 
		String payment = "";
		String notes = "";
		
		// Kiem tra customer
		if(session.getAttribute("customer") != null) {
			CustomerModel customer = (CustomerModel)session.getAttribute("customer");
			customerId = customer.getCustomerId();
			if(session.getAttribute("cart") != null) {
				// Get danh sach san pham trong gio hang
				List<ItemModel> cart = (List<ItemModel>)session.getAttribute("cart");
				if(cart.size() > 0) {
					if(request.getParameter("total_bill") != null)
						totalPrice = Float.parseFloat(request.getParameter("total_bill"));
					
					//Them vao Order
					orderService.insertOrder(dateOrder, "queue", timeOrder, totalPrice , customerId);
					
					//Tim kiem idOrder vua them
					OrderModel order = orderService.getIdOrderInsert(dateFormat.format(dateOrder), totalPrice, customerId);
					int orderId = order.getOrderID();
					
					// Them vao OrderDetail
					for(int i = 0; i < cart.size(); i++) {
						int quantity = cart.get(i).getQuantity();
						int productId = cart.get(i).getProduct().getProductID();
						orderDetailService.insertOrderDetail(quantity, orderId, productId);
					}
					
					//Them vao checkout
					if(request.getParameter("bil-city") != null)
						city = request.getParameter("bil-city");
					if(request.getParameter("bil-district") != null)
						district = request.getParameter("bil-district");
					if(request.getParameter("notes") != null)
						notes = request.getParameter("notes");
					if(request.getParameter("bil-payment") != null)
						payment = request.getParameter("bil-payment");
					checkoutService.insertCheckout(city, dateOrder, district, notes, payment, timeOrder, customerId, orderId);
					
					// Xoa gio hang
					session.removeAttribute("cart");
					
					model.addAttribute("status", "success");
					return "redirect:/checkout";
				}else {
					model.addAttribute("status", "error");
					return "redirect:/checkout";
				}
			}else {
				model.addAttribute("status", "error");
				return "redirect:/checkout";
			}
		}else {
			return "redirect:/customer/login";
		}
	}
	
}
