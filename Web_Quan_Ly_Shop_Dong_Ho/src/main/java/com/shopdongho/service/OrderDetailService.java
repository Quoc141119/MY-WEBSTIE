package com.shopdongho.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopdongho.model.OrderDetailModel;
import com.shopdongho.model.OrderModel;
import com.shopdongho.repository.OrderDetailRepository;

@Service
public class OrderDetailService {
	@Autowired
	private OrderDetailRepository orderDetailRepository;
	
	public void insertOrderDetail(int Quantity, int OrderID, int ProductID) {
		orderDetailRepository.insertOrderDetail(Quantity, OrderID, ProductID);
	}

	public List<OrderDetailModel> findBy(OrderModel id){
		return orderDetailRepository.findBy(id);

	}
}
