package com.shopdongho.repository;

import java.sql.Time;
import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.shopdongho.model.CheckoutModel;

@Repository
public interface CheckoutRepository extends JpaRepository<CheckoutModel, Integer>{

	// Them Checkout
	@Transactional
	@Modifying
	@Query(value = "INSERT INTO dbo.Checkouts( City ,Date ,District ,Notes ,Payment ,Time ,CustomerID ,OrderID)"
			+ "VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8)", nativeQuery = true)
	void insertCheckout(String city, Date checkOutDate, String district, String notes, String payment,
			Time checkOutTime, int customerId, int orderId);
}
