package com.shopdongho.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopdongho.model.CustomerModel;
import com.shopdongho.model.EmployeeModel;
import com.shopdongho.repository.CustomerRepository;

@Service
public class CustomerService {

	@Autowired
	private CustomerRepository customerRepository;

	public List<CustomerModel> findAll() {
		return customerRepository.findAll();
	}

	public CustomerModel getCustomerByNameAndPass(String username, String password) {
		return customerRepository.getCustomerByNameAndPass(username, password);
	}

	public List<CustomerModel> getLastCustomer() {
		return customerRepository.findLastCustomer();
	}

	public List<CustomerModel> findBy(int customerID) {
		return customerRepository.findBy(customerID);
	}
	
	public String delete(Integer id) {
		customerRepository.delete(id);
		return "Đã xóa khách hàng " + id;
	}
	
	public List<CustomerModel> searchCustomerByName(String id){
		return customerRepository.searchCustomerByName(id);
	}
	
	public CustomerModel findOne(Integer id) {
		return customerRepository.findOne(id);
	}

	public String editCustomer(CustomerModel customer) {
		if(customerRepository.editCustomer(customer.getCustomerId(), customer.getUsername()) != null) {
			return "Username " + customer.getUsername() + " đã tồn tại!";
		}else {
			customerRepository.save(customer);
			return "Ok";
		}
	}

	public CustomerModel insertCustomer(CustomerModel customer) {
		return customerRepository.save(customer);
	}
}
