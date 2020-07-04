package com.shopdongho.repository;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.shopdongho.model.OrderModel;

@Repository
public interface OrderRepository extends JpaRepository<OrderModel, Integer> {

	@Query("SELECT c FROM OrderModel c WHERE c.status = 'queue'")
	List<OrderModel> findListQueue();

	@Query("SELECT c FROM OrderModel c WHERE c.status != 'queue'")
	List<OrderModel> findListHistorys();

	// Them Order
	@Transactional
	@Modifying
	@Query(value = "INSERT INTO dbo.Orders( OrderDate ,Status ,Time ,TotalPrice ,CustomerID) "
			+ "VALUES (?1, ?2, ?3, ?4, ?5)", nativeQuery = true)
	void insertOrder(Date OrderDate, String Status, Time OrderTime, float TotalPrice, int CustomerID);

	// Get Id Order cuoi cung vua them vao
	@Query(value = "SELECT TOP 1 * FROM dbo.Orders WHERE OrderDate = ?1 AND TotalPrice = ?2 "
			+ "AND CustomerID = ?3 ORDER BY OrderID DESC", nativeQuery = true)
	OrderModel getIdOrder(String OrderDate, float TotalPrice, int CustomerID);

	OrderModel findOne(Integer id);
	
	// Lay tat ca Order theo CustomerID
	@Query(value = "SELECT * FROM dbo.Orders WHERE CustomerID = ?1", nativeQuery = true)
	List<OrderModel> getAllOrderByCustomerID(int customerID);

	@Query("SELECT c FROM OrderModel c WHERE c.status = 'cancelled'")
	List<OrderModel> findListCancelled();
	
	@Query("SELECT c FROM OrderModel c WHERE c.status = 'comfirmed'")
	List<OrderModel> findListComfirmed();
	
	@Query("SELECT c FROM OrderModel c WHERE c.status = 'Error: quantity not enough'")
	List<OrderModel> findListError();
}
