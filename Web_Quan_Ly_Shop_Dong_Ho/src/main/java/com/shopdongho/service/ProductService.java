package com.shopdongho.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopdongho.model.ProductModel;
import com.shopdongho.repository.ProductRepository;

@Service
public class ProductService {
	@Autowired
	private ProductRepository productRepository;

	public int insertProduct(String ProductName, int SupplierID, int CategoryID, Long Quantity, String Image,
			String Unit, Float Discount, Float Price, String Description) {
		return productRepository.insertProduct(ProductName, SupplierID, CategoryID, Quantity, Image, Unit, Discount,
				Price, Description);

	}

	public void update(Long quantity, Integer id) {
		productRepository.update(quantity,id);
	}
	
	public void deleteProductByID(Integer id) {
		productRepository.delete(id);
	}

	public List<ProductModel> findByName(String productname){
		return productRepository.findByName(productname);
	}
	
	public ProductModel findOne(int id){
		return productRepository.findOne(id);
	}
	
	public void updateProduct(String productName, Long quantity,String image,Float discount,Float price,String description,int productID) {
		productRepository.editProduct(productName, quantity, image, discount, price, description, productID);
	}

	//Lay tat ca san pham
	public List<ProductModel> findAll() {
		return productRepository.findAll();
	}

	// Lay nhung san pham moi nhat
	public List<ProductModel> getTopProductsNew() {
		return productRepository.getTop8ProductNew();
	}
	
	// Lay san pham tu Id
	public ProductModel findBy(int id) {
		return productRepository.findOne(id);
	}
	
	// Lay nhung san pham ban nhieu nhat
	public List<ProductModel> getTopSellId(){
		List<ProductModel> lstTopSellProduct = new ArrayList<ProductModel>();
		List<Integer> lstId = productRepository.getTopSellId();
		for(int i = 0; i < lstId.size(); i++) {
			ProductModel product = findBy(lstId.get(i));
			lstTopSellProduct.add(product);
		}
		return lstTopSellProduct;
	}
	
	// Lay san pham theo categoryID
	public List<ProductModel> findProductByCategoryID(int id){
		return productRepository.findProductByCategoryID(id);
	}
	
	// Lay san pham theo supplierID
	public List<ProductModel> findProductBySupplierID(int id){
		return productRepository.findProductBySupplierID(id);
	}
	
	// Lay san pham theo page (phan trang)
	public List<ProductModel> getListByPage(List<ProductModel> lstProduct, int start, int end){
		List<ProductModel> lstNew = new ArrayList<ProductModel>();
		for(int i = start; i < end; i++) {
			lstNew.add(lstProduct.get(i));
		}
		return lstNew;
	}
	
	// Tim kiem gan dung san pham
	public List<ProductModel> searchProductByName(String productName){
		return productRepository.searchProductByName(productName);
	}
	
	// Lay tat ca san pham con hang
	public List<ProductModel> getAllProductInStock(){
		return productRepository.getAllProductInStock();
	}
}