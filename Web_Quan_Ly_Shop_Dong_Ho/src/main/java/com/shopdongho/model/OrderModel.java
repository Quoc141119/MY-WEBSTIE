package com.shopdongho.model;

import java.sql.Time;
import java.time.LocalTime;
import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Table(name = "Orders")
@Entity(name = "OrderModel")
public class OrderModel {
	@Id
	@Column(name = "OrderID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int orderID; 
	
	@Column(name = "OrderDate", columnDefinition = "date")
	private Date orderDate; 
	

	@Column(name = "Time", columnDefinition = "time(0)")
	private Time time;
	
	@Column(name = "Status", columnDefinition = "nvarchar(100)")
	private String status;
	
	@Column(name = "TotalPrice")
	private float totalPrice;

	@OneToMany(mappedBy = "Order", cascade = CascadeType.ALL)
	private Collection<OrderDetailModel> orderDetails;
	
	@ManyToOne
	@JoinColumn(name = "CustomerID")
	private CustomerModel Customer;
	
	@ManyToOne
	@JoinColumn(name = "EmployeeID")
	private EmployeeModel Employee;
	
	@OneToMany(mappedBy = "Order", cascade = CascadeType.ALL)
	private Collection<CheckoutModel> checkoutModels; 

	@Transient
	private int customerID;
	
	@Transient
	private int employeeID;
	
	public OrderModel() {
		super();
	}

	public OrderModel(int orderID, Date orderDate, Time time, String status, float totalPrice,
			Collection<OrderDetailModel> orderDetails, CustomerModel customer, EmployeeModel employee,
			Collection<CheckoutModel> checkoutModels, int customerID, int employeeID) {
		super();
		this.orderID = orderID;
		this.orderDate = orderDate;
		this.time = time;
		this.status = status;
		this.totalPrice = totalPrice;
		this.orderDetails = orderDetails;
		Customer = customer;
		Employee = employee;
		this.checkoutModels = checkoutModels;
		this.customerID = customerID;
		this.employeeID = employeeID;
	}

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Time getTime() {
		return time;
	}

	public void setTime(Time time) {
		this.time = time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Collection<OrderDetailModel> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Collection<OrderDetailModel> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public CustomerModel getCustomer() {
		return Customer;
	}

	public void setCustomer(CustomerModel customer) {
		Customer = customer;
	}

	public EmployeeModel getEmployee() {
		return Employee;
	}

	public void setEmployee(EmployeeModel employee) {
		Employee = employee;
	}

	public Collection<CheckoutModel> getCheckoutModels() {
		return checkoutModels;
	}

	public void setCheckoutModels(Collection<CheckoutModel> checkoutModels) {
		this.checkoutModels = checkoutModels;
	}

	public int getCustomerID() {
		return customerID;
	}

	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}

	public int getEmployeeID() {
		return employeeID;
	}

	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}


	
}
