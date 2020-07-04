package com.shopdongho.repository;

import java.sql.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.shopdongho.model.OrderModel;



@Transactional
@Repository
public interface StatisticRepository extends CrudRepository<OrderModel, Integer> {

	@Query(value = "SELECT OrderID, OrderDate, Status, Time, TotalPrice, CustomerID, EmployeeID\r\n"
			+ "FROM Orders", nativeQuery = true)
	List<OrderModel> finAll();
	
	@Query(value = "SELECT OrderID, OrderDate, Status, Time, TotalPrice, CustomerID, EmployeeID\r\n" + 
			"FROM Orders\r\n" + 
			"WHERE OrderDate >=  ?1	and OrderDate <= ?2 ", nativeQuery = true)
	List<OrderModel> finStatisticFromDate(@Param("OrderDate") Date date1 ,@Param("OrderDate") Date date2 );
	

}
