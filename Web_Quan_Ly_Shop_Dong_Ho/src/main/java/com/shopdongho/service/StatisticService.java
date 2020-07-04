package com.shopdongho.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.shopdongho.model.OrderModel;

import com.shopdongho.repository.StatisticRepository;

@Service
public class StatisticService {
	
	@Autowired
	StatisticRepository statisticRepository;
	
//	public List<StatisticModel> listStatistic(){
//		return statisticRepository.listStatistic();
//	}
	public List<OrderModel> finAll(){
		return statisticRepository.finAll();
	}
	
	public List<OrderModel> finStatisticFromDate(Date date1 , Date date2 ){
		return statisticRepository.finStatisticFromDate(date1, date2);
	}
}
