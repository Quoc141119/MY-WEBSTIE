package com.shopdongho.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Table(name = "Accounts")
@Entity(name = "AccountModel")
public class AccountModel {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "AccountID", columnDefinition = "int")
	private int accountID;
	
	@Column(name = "Username", columnDefinition = "nvarchar(50)")
	private String username;
	
	@Column(name = "Password", columnDefinition = "nvarchar(50)")
	private String password;
	
	@Column(name = "Role", columnDefinition = "int")
	private int role;

	public AccountModel() {
		super();
	}

	
	
	public AccountModel(int accountID, String username, String password, int role) {
		super();
		this.accountID = accountID;
		this.username = username;
		this.password = password;
		this.role = role;
	}



	public int getAccountID() {
		return accountID;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
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

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}
	
	
}
