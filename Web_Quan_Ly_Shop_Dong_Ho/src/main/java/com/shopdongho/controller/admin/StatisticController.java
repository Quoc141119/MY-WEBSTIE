package com.shopdongho.controller.admin;

import java.sql.Date;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopdongho.model.EmployeeModel;
import com.shopdongho.model.OrderModel;
import com.shopdongho.service.StatisticService;

@Controller
public class StatisticController {

	@Autowired
	StatisticService statisticService;

	@RequestMapping(value = "admin-statistic")
	public String showStatistc(Model model, HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("liststatistic", statisticService.finAll());
		request.setAttribute("sum",showSum() );
		return "admin/liststatictis";
	}

	@RequestMapping(value = "admin-searchStatistic", method = RequestMethod.GET)
	public String showSearchStatistic(Model model, @RequestParam("date1") Date date1,
			@RequestParam("date2") Date date2, HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("liststatistic", statisticService.finStatisticFromDate(date1, date2));
		request.setAttribute("sum",showSumSearch(date1,date2) );
		return "admin/liststatictis";
	}
	
	public Long showSum() {
		Double sum =(double)0;
		int size  = statisticService.finAll().size();
		
		for(int i=0; i<size; i++) {
			OrderModel or = statisticService.finAll().get(i);
			sum  = sum + or.getTotalPrice();
		}
		return Math.round(sum);
	}
	
	public Long showSumSearch(Date date1, Date date2) {
		Double sum =(double)0;
		int size  = statisticService.finStatisticFromDate(date1, date2).size();
		
		for(int i=0; i<size; i++) {
			OrderModel or =  statisticService.finStatisticFromDate(date1, date2).get(i);
			sum  = sum + or.getTotalPrice();
		}
		return Math.round(sum);
	}
}
