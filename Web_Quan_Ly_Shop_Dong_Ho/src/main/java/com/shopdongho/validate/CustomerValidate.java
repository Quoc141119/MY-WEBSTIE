package com.shopdongho.validate;

import java.util.List;

import com.shopdongho.model.CustomerModel;

public class CustomerValidate {
	public boolean validate(CustomerModel customerModel, List<CustomerModel> lstCustomer) {
		for(CustomerModel customer : lstCustomer) {
			if(customer.getUsername().equals(customerModel.getUsername())) {
				return false;
			}
		}
		return true;
	}
}
