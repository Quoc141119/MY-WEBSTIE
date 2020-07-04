package com.shopdongho.model;

import java.util.Collection;

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

@Table(name = "Products")
@Entity(name = "ProductModel")
public class ProductModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ProductID", columnDefinition = "int")
	private int productID;
	
	@Column(name = "ProductName" , columnDefinition = "nvarchar(50)")
	private String productName;
	
	@ManyToOne
	@JoinColumn(name = "SupplierID")
	private SupplierModel Supplier;
	
	// có nhiêu sản phẩm ở 1 danh mục.... many to one
	@ManyToOne
	@JoinColumn(name = "CategoryID") // thông qua khóa ngoại category_ID
	private CategoryModel Category;
	
	@OneToMany(mappedBy = "Product", cascade = CascadeType.ALL)
	private Collection<OrderDetailModel> orderDetails;
	
	@Column(name = "Quantity", columnDefinition = "int")
	private Long quantity;
	
	@Column(name = "Image",columnDefinition = "nvarchar(100)")
	private String image;
	
	@Column(name = "Unit", columnDefinition = "nvarchar(50)")
	private String unit;
	
	@Column(name = "Discount", columnDefinition = "float")
	private Float discount;
	
	@Column(name = "Price", columnDefinition = "float")
	private Float price;
	
	@Column(name = "Description", columnDefinition = "nvarchar(500)")
	private String description;
	
	public ProductModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductModel(int productID, String productName, SupplierModel supplier, CategoryModel category,
			Collection<OrderDetailModel> orderDetails, Long quantity, String image, String unit, Float discount,
			Float price, String description) {
		super();
		this.productID = productID;
		this.productName = productName;
		Supplier = supplier;
		Category = category;
		this.orderDetails = orderDetails;
		this.quantity = quantity;
		this.image = image;
		this.unit = unit;
		this.discount = discount;
		this.price = price;
		this.description = description;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public SupplierModel getSupplier() {
		return Supplier;
	}

	public void setSupplier(SupplierModel supplier) {
		Supplier = supplier;
	}

	public CategoryModel getCategory() {
		return Category;
	}

	public void setCategory(CategoryModel category) {
		Category = category;
	}

	public Collection<OrderDetailModel> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Collection<OrderDetailModel> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public Long getQuantity() {
		return quantity;
	}

	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Float getDiscount() {
		return discount;
	}

	public void setDiscount(Float discount) {
		this.discount = discount;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
}
