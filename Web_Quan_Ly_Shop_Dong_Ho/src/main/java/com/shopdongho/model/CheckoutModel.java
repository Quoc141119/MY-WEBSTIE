package com.shopdongho.model;

import java.sql.Time;
import java.time.LocalTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Table(name = "Checkouts")
@Entity(name = "CheckoutModel")
public class CheckoutModel {
	@Id
	@Column(name = "CheckoutID", columnDefinition = "int")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int checkoutID;
	
	@ManyToOne
	@JoinColumn(name = "CustomerID")
	private CustomerModel Customer;
	
	@ManyToOne
	@JoinColumn(name = "OrderID")
	private OrderModel Order;
	
	@Column(name = "City", columnDefinition = "nvarchar(50)")
	private String City;
	
	@Column(name = "District" , columnDefinition = "nvarchar(50)")
	private String district;
	
	@Column(name = "Time", columnDefinition = "time(0)")
	private Time time;
	
	@Column(name = "Date", columnDefinition = "date")
	private Date date;
	
	@Column(name = "Payment", columnDefinition = "nvarchar(50)")
	private String payment;
	
	@Column(name = "Notes" , columnDefinition = "nvarchar(500)")
	private String notes;

	public CheckoutModel() {
		super();
	}
	
	public CheckoutModel(String city, String district, String payment, String notes) {
		super();
		City = city;
		this.district = district;
		this.payment = payment;
		this.notes = notes;
	}

	public int getCheckoutID() {
		return checkoutID;
	}

	public void setCheckoutID(int checkoutID) {
		this.checkoutID = checkoutID;
	}

	public String getCity() {
		return City;
	}

	public void setCity(String city) {
		City = city;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public Time getTime() {
		return time;
	}

	public void setTime(Time time) {
		this.time = time;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}
	
	
	
}
