package com.shopdongho.controller.web;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopdongho.model.CustomerModel;
import com.shopdongho.model.ItemModel;
import com.shopdongho.model.Login;
import com.shopdongho.model.ProductModel;
import com.shopdongho.service.CustomerService;
import com.shopdongho.service.ProductService;
import com.shopdongho.validate.CustomerValidate;

@Controller(value = "customerControllerOfWeb")
@RequestMapping(value = "/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;

	@Autowired
	private ProductService productService;

	// Show Login
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, HttpSession session) {
		// Kiem tra ton tai customer
		if (session.getAttribute("customer") != null) {
			CustomerModel customer = (CustomerModel) session.getAttribute("customer");
			model.addAttribute("login", new Login(customer.getUsername(), customer.getPassword()));
			return "web/login";
		} else {
			CustomerModel customer = new CustomerModel();
			session.setAttribute("customer", customer);
			model.addAttribute("login", new Login());
			return "web/login";
		}
	}

	// Check Login
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("login") Login login, Model model, HttpSession session,
			HttpServletRequest request) {
		CustomerModel customer = customerService.getCustomerByNameAndPass(login.getUsername(), login.getPassword());
		// Kiem tra customer login
		if (customer != null) {
			// Kiem tra chuyen huong tu trang checkout khong
			if (request.getParameter("isCheckout") != null) {
				// Kiem tra don hang
				if (session.getAttribute("cart") != null) {
					float total = 0;
					List<ItemModel> cart = (List<ItemModel>) session.getAttribute("cart");
					for (ItemModel itemModel : cart) {
						ProductModel product = itemModel.getProduct();
						total += (product.getPrice() - product.getPrice() * product.getDiscount() / 100)
								* itemModel.getQuantity();
					}
					model.addAttribute("totalPrice", total);
				}
				session.setAttribute("customer", customer);
				return "redirect:/checkout";
			} else {
				session.setAttribute("customer", customer);
				model.addAttribute("lstProductsNew", productService.getTopProductsNew());
				model.addAttribute("lstProductTopSell", productService.getTopSellId());
				return "web/home";
			}
		} else {
			model.addAttribute("error", true);
			return "redirect:/customer/login";
		}
	}

	// Show Register
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model) {
		model.addAttribute("customer", new CustomerModel());
		return "web/register";
	}

	// Check Register
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@ModelAttribute("customer") CustomerModel customer, Model model) {
		List<CustomerModel> lstCustomer = customerService.findAll();
		boolean validate = new CustomerValidate().validate(customer, lstCustomer);
		if (validate) {
			customerService.insertCustomer(customer);
			model.addAttribute("login", new Login());
			return "redirect:/customer/login";
		} else {
			model.addAttribute("error", true);
			return "redirect:/customer/register";
		}
	}

	// Show Info
	@RequestMapping(value = "/info")
	public String showCustomerInfo(Model model, HttpSession session) {
		return "web/customer-info";
	}

	// Update Info
	@RequestMapping(value = "/info/edit", method = RequestMethod.GET)
	public String showCustomerEditInfo(Model model, HttpSession session) {
		if(session.getAttribute("customer") != null) {
			CustomerModel customer = (CustomerModel)session.getAttribute("customer");
			model.addAttribute("customer", customer);
			return "web/customer-update-info";
		}
		return "web/customer-update-info";
	}
	
	@RequestMapping(value = "/info/edit", method = RequestMethod.POST)
	public String customerEditInfo(@ModelAttribute("customer") CustomerModel customer, Model model, 
			HttpSession session) {	
		model.addAttribute("customer", customer);
		if(session.getAttribute("customer") != null) {
			CustomerModel cus = (CustomerModel)session.getAttribute("customer");
			cus.setCountry(customer.getCountry());
			cus.setCustomerName(customer.getCustomerName());
			cus.setAddress(customer.getAddress());
			cus.setEmail(customer.getEmail());
			cus.setPhone(customer.getPhone());
			cus.setPassword(customer.getPassword());
			
			if(customerService.insertCustomer(cus) != null) {
				model.addAttribute("status", "success");
			}else {
				model.addAttribute("status", "error");
			}
			return "redirect:/customer/info/edit";
		}else {
			return "redirect:/customer/info/edit";
		}
	}

	// Logout
	@RequestMapping(value = "/logout")
	public String logout(Model model, HttpSession session) {
		if (session.getAttribute("customer") != null)
			session.removeAttribute("customer");
		if (session.getAttribute("cart") != null)
			session.removeAttribute("cart");
		if (session.getAttribute("wishlist") != null)
			session.removeAttribute("wishlist");
		model.addAttribute("login", new Login());
		return "redirect:/home";
	}

}
