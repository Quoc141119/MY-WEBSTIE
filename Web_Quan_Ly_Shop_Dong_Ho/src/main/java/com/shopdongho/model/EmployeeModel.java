package com.shopdongho.model;

import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.JoinColumn;

import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;


@Table(name = "Employees")
@Entity(name = "EmployeeModel")
public class EmployeeModel {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "EmployeeID", columnDefinition = "int")
	private int employeeID;
	
	@OneToOne
	@JoinColumn(name = "AccountID", nullable = false)
	private AccountModel Account;
	
	
	@Column(name = "LastName", columnDefinition = "nvarchar(50)")
	private String lastName;
	
	@Column(name = "FirstName", columnDefinition = "nvarchar(50)")
	private String firstName;
	
	@Column(name = "Phone", columnDefinition = "nvarchar(50)")
	private String phone;
	
	@Column(name = "Email", columnDefinition = "nvarchar(50)")
	private String email;
	
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	@Column(name = "BirthDate", columnDefinition = "date")
	private Date birthDate;
	
	@Column(name = "Photo", columnDefinition = "nvarchar(50)")
	private String photo;
	
	@Column(name = "Notes", columnDefinition = "nvarchar(50)")
	private String notes;
	
	@OneToMany(mappedBy = "Employee", cascade = CascadeType.ALL) // Quan he 1-n voi oder
	private Collection<OrderModel> orderModels;

	public EmployeeModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EmployeeModel(int employeeID, AccountModel account, String lastName, String firstName, String phone,
			String email, Date birthDate, String photo, String notes) {
		super();
		this.employeeID = employeeID;
		Account = account;
		this.lastName = lastName;
		this.firstName = firstName;
		this.phone = phone;
		this.email = email;
		this.birthDate = birthDate;
		this.photo = photo;
		this.notes = notes;
	}

	public int getEmployeeID() {
		return employeeID;
	}

	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}

	public AccountModel getAccount() {
		return Account;
	}

	public void setAccount(AccountModel account) {
		Account = account;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Collection<OrderModel> getOrderModels() {
		return orderModels;
	}

	public void setOrderModels(Collection<OrderModel> orderModels) {
		this.orderModels = orderModels;
	}

	
	
	
}
