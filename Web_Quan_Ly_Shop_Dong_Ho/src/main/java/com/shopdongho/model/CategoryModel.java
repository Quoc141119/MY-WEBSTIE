package com.shopdongho.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Collection;

import javax.persistence.CascadeType;


import javax.persistence.OneToMany;
import javax.persistence.Table;

@Table(name = "Categorys")
@Entity(name = "CategoryModel")
public class CategoryModel {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "CategoryID")
	private int categoryID;
	
	@Column(name = "CategoryName", columnDefinition = "nvarchar(50)")
	private String categoryName;
	
	@OneToMany(mappedBy = "Category", cascade = CascadeType.ALL) // Quan he 1-n voi product
	private Collection<ProductModel> products;

	public CategoryModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CategoryModel(int categoryID, String categoryName, Collection<ProductModel> products) {
		super();
		this.categoryID = categoryID;
		this.categoryName = categoryName;
		this.products = products;
	}

	public int getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Collection<ProductModel> getProducts() {
		return products;
	}

	public void setProducts(Collection<ProductModel> products) {
		this.products = products;
	}

}
