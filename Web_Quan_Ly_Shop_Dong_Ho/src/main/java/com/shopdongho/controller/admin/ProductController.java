package com.shopdongho.controller.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopdongho.model.CategoryModel;
import com.shopdongho.model.EmployeeModel;
import com.shopdongho.model.ProductModel;
import com.shopdongho.model.SupplierModel;
import com.shopdongho.service.CategoryService;
import com.shopdongho.service.ProductService;
import com.shopdongho.service.SupplierService;
import com.shopdongho.validate.ProductValidate;

@Controller
@ControllerAdvice
public class ProductController {
	@Autowired
	ProductService productService;
	
	@Autowired
	SupplierService SupplierService;
	
	@Autowired
	CategoryService categoryService;
	
	private Map<Long, ProductModel> productMap = new HashMap<>();
	
	@RequestMapping(value = "admin-listproduct")
	public String listProduct(Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("listproduct", productService.findAll());
		return "admin/listproduct";
	}
	
	@GetMapping(value = "admin-addproduct")
	public String addProduct(Model model, HttpSession session) {	
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("saveproduct", new ProductModel());
		model.addAttribute("listsupplier", SupplierService.findAll());
		model.addAttribute("listcategory", categoryService.findAll());
		
		return "admin/addproduct";
	}
	
	@RequestMapping(value = "admin-saveProduct")
	public String saveaddProduct(Model model, @ModelAttribute("saveproduct") ProductModel productModel,
			@RequestParam("listsupplier") int listsupplier,@RequestParam("listcategory") int listcategory
			, HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		String ProductName = productModel.getProductName();
		int SupplierID =listsupplier;
		int CategoryID = listcategory;
		Long Quantity = productModel.getQuantity();
		String Image = productModel.getImage();
		String Unit = productModel.getUnit();
		Float Discount = productModel.getDiscount();
		Float Price = productModel.getPrice();
		String Description = productModel.getDescription();
			
		productService.insertProduct(ProductName, SupplierID, CategoryID, Quantity,
				"/static/images/products/" + Image, Unit, Discount, Price, Description);
		
		return "redirect:admin-listproduct";
	}
	
	@RequestMapping(value = "admin-deleteproduct")
	public String deleteProduct(Model model, @RequestParam int id, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		productService.deleteProductByID(id);
		model.addAttribute("listproduct", productService.findAll());
		return "redirect:admin-listproduct";
	}
	
	@RequestMapping(value = "admin-searchProduct")
	public String searchProduct(Model model, @RequestParam String search, HttpSession session) {	
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		if(productService.findByName(search).size()>0) {
			model.addAttribute("listproduct", productService.findByName(search));
			return "admin/listproduct";
		}
		model.addAttribute("thongbao", "err");
		
		return "admin/listproduct";
	}
	
	@RequestMapping(value = "admin-editproduct")
	public String editProduct(Model model, @RequestParam("id") int id, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("editproduct", productService.findOne(id));
		
		return "admin/editproduct";
	}
	
	@RequestMapping(value = "admin-saveeditProducut")
	public String saveeditProduct(Model model,@ModelAttribute("editproduct") ProductModel productModel, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		String productName = productModel.getProductName();
		Long quantity = productModel.getQuantity();
		String image = productModel.getImage();
		Float discount = productModel.getDiscount();
		Float price = productModel.getPrice();
		String description = productModel.getDescription();
		int productID = productModel.getProductID();
	
		productService.updateProduct(productName, quantity, 
				"/static/images/products/" + image, discount, price, description, productID);
		
		return "redirect:admin-listproduct";
	}
	
}
