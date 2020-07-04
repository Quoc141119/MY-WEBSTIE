package com.shopdongho.controller.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopdongho.model.ProductModel;
import com.shopdongho.service.CategoryService;
import com.shopdongho.service.ProductService;

@Controller(value = "categoryControllerOfWeb")
@RequestMapping(value = "/category")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ProductService productService;

	@RequestMapping("/list")
	public String showCategory(Model model, HttpServletRequest request) {
		model.addAttribute("lstCategory", categoryService.findAll());
		model.addAttribute("lstProductTopSell", productService.getTopSellId());

		int start = 0, end = 9;
		if (request.getParameter("start") != null)
			start = Integer.parseInt(request.getParameter("start"));
		if (request.getParameter("end") != null)
			end = Integer.parseInt(request.getParameter("end"));

		if (request.getParameter("id") != null) {
			int idCategory = Integer.parseInt(request.getParameter("id"));
			List<ProductModel> products = productService.findProductByCategoryID(idCategory);
			request.setAttribute("kqProducts", products);

			if (products.size() < 9)
				end = products.size();

			model.addAttribute("lstProduct", productService.getListByPage(products, start, end));
		} else {
			List<ProductModel> products = productService.getAllProductInStock();
			request.setAttribute("kqProducts", products);
			if (products.size() < 9)
				end = products.size();

			model.addAttribute("lstProduct", productService.getListByPage(products, start, end));
		}
		return "web/category";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(Model model, @RequestParam String name, HttpServletRequest request) {
		model.addAttribute("lstCategory", categoryService.findAll());
		model.addAttribute("lstProductTopSell", productService.getTopSellId());

		List<ProductModel> kqProducts = new ArrayList<ProductModel>();
		kqProducts = productService.searchProductByName(name);
		model.addAttribute("lstProduct", kqProducts);
		request.setAttribute("kqProducts", kqProducts);

		return "web/category";
	}
}
