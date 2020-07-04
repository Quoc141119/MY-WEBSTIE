package com.shopdongho.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shopdongho.service.ProductService;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/home")
	public String homePage(Model model) {
		model.addAttribute("lstProductsNew", productService.getTopProductsNew());
		model.addAttribute("lstProductTopSell", productService.getTopSellId());
		return "web/home";
	}
}
