package com.shopdongho.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopdongho.model.ProductModel;
import com.shopdongho.service.ProductService;

@Controller(value = "productControllerOfWeb")
@RequestMapping(value = "/product")
public class ProductController {

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/details", method = RequestMethod.GET)
	private String showProductDetail(Model model, @RequestParam int id) {
		ProductModel product = productService.findBy(id);
		model.addAttribute("product", product);
		model.addAttribute("lstProductsNew", productService.getTopProductsNew());
		return "web/product-details";
	}
	
	
}
