package com.shopdongho.service;

import java.sql.Time;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopdongho.repository.CheckoutRepository;

@Service
public class CheckoutService {

	@Autowired 
	private CheckoutRepository checkoutRepository;
	
	public void insertCheckout(String city, Date checkOutDate, String district, String notes, String payment,
			Time checkOutTime, int customerId, int orderId) {
		checkoutRepository.insertCheckout(city, checkOutDate, district, notes, payment, checkOutTime, customerId, orderId);
	}
}
