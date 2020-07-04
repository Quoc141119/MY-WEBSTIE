package com.shopdongho.model;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Table(name = "Customers")
@Entity(name = "CustomerModel")
public class CustomerModel {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "CustomerID", columnDefinition = "int")
	private int customerId;
	
	@Column(name = "Username", columnDefinition = "nvarchar(50)")
	private String username;
	
	@Column(name = "Password", columnDefinition = "nvarchar(50)")
	private String password;
	
	@Column(name = "CustomerName", columnDefinition = "nvarchar(50)")
	private String customerName;
	
	@Column(name = "Email", columnDefinition = "nvarchar(50)")
	private String email;
	
	@Column(name = "Phone", columnDefinition = "nvarchar(50)")
	private String phone;
	
	@Column(name = "Address", columnDefinition = "nvarchar(50)")
	private String address;
	
	@Column(name = "Country", columnDefinition = "nvarchar(50)")
	private String country;
	
	@OneToMany(mappedBy = "Customer", cascade = CascadeType.ALL)
	private Collection<OrderModel> orders;
	
	@OneToMany(mappedBy = "Customer", cascade = CascadeType.ALL)
	private Collection<CheckoutModel> checkouts;
	
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	public CustomerModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CustomerModel(String username, String password, String customerName, String email, String phone,
			String address, String country) {
		super();
		this.username = username;
		this.password = password;
		this.customerName = customerName;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.country = country;
	}
	
}
