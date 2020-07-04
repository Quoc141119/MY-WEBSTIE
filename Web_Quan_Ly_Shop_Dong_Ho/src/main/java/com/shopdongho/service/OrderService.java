package com.shopdongho.service;


import java.sql.Time;
import java.util.Date;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopdongho.model.OrderModel;
import com.shopdongho.repository.OrderRepository;

@Service
public class OrderService {


	@Autowired
	private OrderRepository orderRepository;
	
	public void insertOrder(Date OrderDate, String Status, Time OrderTime, float TotalPrice, int CustomerID) {
		orderRepository.insertOrder(OrderDate, Status, OrderTime, TotalPrice, CustomerID);
	}
	
	public OrderModel getIdOrderInsert(String OrderDate, float TotalPrice, int CustomerID) {
		return orderRepository.getIdOrder(OrderDate, TotalPrice, CustomerID);
	}
	
	public List<OrderModel> findListQueue(){
		return orderRepository.findListQueue();
	}
	
	public List<OrderModel> findListComfirmed(){
		return orderRepository.findListComfirmed();
	}
	
	public OrderModel findOne(Integer id){
		return orderRepository.findOne(id);
	}

	public void save(OrderModel order) {
		orderRepository.save(order);
	}

	public void deleteOrder(int id) {
		orderRepository.delete(id);
	}
	
	public List<OrderModel> getAllOrderByCustomerID(int customerID){
		return orderRepository.getAllOrderByCustomerID(customerID);
	}

	public List<OrderModel> findListCancelled() {
		return orderRepository.findListCancelled();
	}

	public List<OrderModel> findListHistory() {
		return orderRepository.findListHistorys();
	}

	public List<OrderModel> findListError() {
		return orderRepository.findListError();
	}
}
