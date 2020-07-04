package com.shopdongho.controller.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopdongho.model.ItemModel;
import com.shopdongho.model.ProductModel;
import com.shopdongho.service.ProductService;

@Controller
public class WishlistController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/wishlist")
	public String showWishList() {
		return "web/wishlist";
	}
	
	@RequestMapping(value = "/wishlist/add")
	private String addProductToWishlist(@RequestParam int id, HttpSession session) {
		if(session.getAttribute("wishlist") != null) {
			List<ItemModel> wishlist = (List<ItemModel>)session.getAttribute("wishlist");
			ProductModel product = productService.findBy(id);
			int index = this.exists(id, wishlist);
			
			if(index == -1) { // Not exist
				wishlist.add(new ItemModel(product, 1));
			}
			session.setAttribute("wishlist", wishlist);
		}else {
			List<ItemModel> wishlist = new ArrayList<ItemModel>();
			wishlist.add(new ItemModel(productService.findBy(id), 1));
			session.setAttribute("wishlist", wishlist);
		}
		return "redirect:/wishlist";
	}
	
	@RequestMapping(value = "/wishlist/remove")
	private String remove(@RequestParam int id,HttpSession session) {
		List<ItemModel> wishlist = (List<ItemModel>)session.getAttribute("wishlist");
		int index = this.exists(id, wishlist);
		wishlist.remove(index);
		session.setAttribute("wishlist", wishlist);
		return "redirect:/wishlist";
	}
	
	private int exists(int id, List<ItemModel> cart) {
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getProduct().getProductID() == id) {
				return i;
			}
		}
		return -1;
	}
}
