package com.shopdongho.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.shopdongho.model.OrderDetailModel;
import com.shopdongho.model.OrderModel;

public interface OrderDetailRepository extends JpaRepository<OrderDetailModel, Integer> {

	@Query("SELECT c FROM OrderDetailModel c WHERE c.Order = ?1")
	List<OrderDetailModel> findBy(OrderModel id);

	// Them OrderDetail
	@Transactional
	@Modifying
	@Query(value = "INSERT INTO dbo.OrderDetails( Quantity, OrderID, ProductID ) VALUES (?1, ?2, ?3)", nativeQuery = true)
	void insertOrderDetail(int Quantity, int OrderID, int ProductID);
}
