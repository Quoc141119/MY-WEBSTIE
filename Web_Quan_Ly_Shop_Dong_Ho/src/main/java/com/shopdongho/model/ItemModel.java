package com.shopdongho.model;

public class ItemModel {
	private ProductModel product;
	private int quantity;
	
	public ItemModel() {
		super();
	}
	
	public ItemModel(ProductModel product, int quantity) {
		super();
		this.product = product;
		this.quantity = quantity;
	}
	
	public ProductModel getProduct() {
		return product;
	}
	public void setProduct(ProductModel product) {
		this.product = product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
