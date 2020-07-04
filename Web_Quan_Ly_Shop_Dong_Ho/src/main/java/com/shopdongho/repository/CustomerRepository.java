package com.shopdongho.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.shopdongho.model.CustomerModel;

public interface CustomerRepository extends JpaRepository<CustomerModel, Integer>{
	
	// Lay customer bang username va pass
	@Query("SELECT c FROM CustomerModel c WHERE c.username = ?1 AND c.password = ?2")
	CustomerModel getCustomerByNameAndPass(String username, String password);
	
	// Tim customer cuoi cung
	@Query("SELECT c FROM CustomerModel c ORDER BY c.customerId DESC")
	List<CustomerModel> findLastCustomer();
	
	// Lay tat ca customer
	@Query("SELECT c FROM CustomerModel c WHERE c.customerName LIKE %:id%")
	List<CustomerModel> searchCustomerByName(@Param("id") String id);
	
	List<CustomerModel> findAll();
	
	// Them customer
	CustomerModel save(CustomerModel customerModel);
	
	// Tim customer bang ID
	List<CustomerModel> findBy(int customerID);

	@Query("SELECT c FROM CustomerModel c WHERE c.customerId != ?1 and c.username = ?2")
	CustomerModel editCustomer(int customerId, String username);
}
