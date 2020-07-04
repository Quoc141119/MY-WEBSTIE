package com.shopdongho.controller.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.bouncycastle.asn1.icao.CscaMasterList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopdongho.model.ItemModel;
import com.shopdongho.model.ProductModel;
import com.shopdongho.service.ProductService;

@Controller
public class CartController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/cart")
	private String showCart() {
		return "web/cart";
	}
	
	@RequestMapping(value = "/cart/add")
	private String addProductToCart(@RequestParam int id, HttpSession session) {
		// Kiem tra ton tai cua gio hang
		if(session.getAttribute("cart") != null) {
			List<ItemModel> cart = (List<ItemModel>)session.getAttribute("cart");
			ProductModel product = productService.findBy(id);
			
			// Kiem tra ton tai cua san pham trong gio hang
			int index = this.exists(id, cart);
			if(index == -1) { // Not exist
				cart.add(new ItemModel(product, 1));
			}else {
				int quantity = cart.get(index).getQuantity() + 1;
				cart.get(index).setQuantity(quantity);
			}
			session.setAttribute("cart", cart);
		}else {
			List<ItemModel> cart = new ArrayList<ItemModel>();
			cart.add(new ItemModel(productService.findBy(id), 1));
			session.setAttribute("cart", cart);
		}
		
		// Neu ton tai wishlist
		if(session.getAttribute("wishlist") != null) {
			List<ItemModel> wishlist = (List<ItemModel>)session.getAttribute("wishlist");
			// Neu wishlist khac rong
			if(wishlist.size() > 0) {
				// Tim kiem san pham moi them vao co nam trong wishlist hay khong
				// Neu co thi xoa
				int index = exists(id, wishlist);
				if(index != -1) {
					wishlist.remove(index);
					session.setAttribute("wishlist", wishlist);
				}
			}
		}
		return "redirect:/cart";
	}
	
	@RequestMapping(value = "/cart/remove")
	private String remove(@RequestParam int id,HttpSession session) {
		List<ItemModel> cart = (List<ItemModel>)session.getAttribute("cart");
		int index = this.exists(id, cart);
		cart.remove(index);
		session.setAttribute("cart", cart);
		return "redirect:/cart";
	}
	
	@RequestMapping(value = "/cart/update", method = RequestMethod.POST)
	private String update(HttpServletRequest request, HttpSession session) {
		List<ItemModel> cart = (List<ItemModel>)session.getAttribute("cart");
		String[] quantity = request.getParameterValues("quantity");
		for (int i = 0; i < cart.size(); i++) {
			cart.get(i).setQuantity(Integer.parseInt(quantity[i]));
		}
		return "redirect:/cart";
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
