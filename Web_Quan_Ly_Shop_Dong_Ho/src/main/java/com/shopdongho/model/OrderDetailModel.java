package com.shopdongho.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Table(name = "OrderDetails")
@Entity(name = "OrderDetailModel")
public class OrderDetailModel {
	@Id
	@Column(name = "OrderDetailID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int orderDetailID;
	
	@Column(name = "Quantity")
	private int quantity;
	
	@ManyToOne
	@JoinColumn(name = "ProductID")
	private ProductModel Product;
	
	@ManyToOne
	@JoinColumn(name = "OrderID")
	private OrderModel Order;
	
	public OrderDetailModel() {
		super();
	}
	
	public int getOrderDetailID() {
		return orderDetailID;
	}

	public void setOrderDetailID(int orderDetailID) {
		this.orderDetailID = orderDetailID;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public ProductModel getProduct() {
		return Product;
	}

	public void setProduct(ProductModel product) {
		Product = product;
	}

	public OrderModel getOrder() {
		return Order;
	}

	public void setOrder(OrderModel order) {
		Order = order;
	}
	
	
}
