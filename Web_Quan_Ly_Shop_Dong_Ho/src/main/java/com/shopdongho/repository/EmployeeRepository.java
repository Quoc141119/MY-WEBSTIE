package com.shopdongho.repository;

import java.awt.print.Pageable;
import java.util.List;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.shopdongho.model.AccountModel;
import com.shopdongho.model.EmployeeModel;

public interface EmployeeRepository extends JpaRepository<EmployeeModel, Integer>{

	// Lay tat ca Employee
	List<EmployeeModel> findAll();
	
	// Them Employee
	EmployeeModel save(EmployeeModel employeeModel);
	
	// Tim Employee bang ID
	List<EmployeeModel> findBy(String employeeID);
	List<EmployeeModel> findBy(Integer employeeID);
	
	@Query("SELECT c FROM EmployeeModel c WHERE c.lastName + '-' + c.firstName LIKE %:id%")
	List<EmployeeModel> searchEmployee(@Param("id") String search);

}
