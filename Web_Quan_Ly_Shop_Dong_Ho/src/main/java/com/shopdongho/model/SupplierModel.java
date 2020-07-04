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

@Table(name = "Suppliers")
@Entity(name = "SupplierModel")
public class SupplierModel {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "SupplierID", columnDefinition = "int")
	private int supplierID;
	
	@Column(name = "SupplierName", columnDefinition = "nvarchar(50)")
	private String supplierName;
	
	@Column(name = "Address", columnDefinition = "nvarchar(50)")
	private String address;
	
	@Column(name = "Country", columnDefinition = "nvarchar(50)")
	private String country;
	
	@OneToMany(mappedBy = "Supplier", cascade = CascadeType.ALL)
	private Collection<ProductModel> products;
			
	public SupplierModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getSupplierID() {
		return supplierID;
	}

	public void setSupplierID(int supplierID) {
		this.supplierID = supplierID;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
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
}
