package com.shopdongho.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopdongho.model.AccountModel;
import com.shopdongho.model.EmployeeModel;
import com.shopdongho.repository.EmployeeRepository;

@Service
public class EmployeeService {

	@Autowired
	EmployeeRepository employeeRepo;

	public List<EmployeeModel> findAll() {
		return employeeRepo.findAll();
	}

	public EmployeeModel save(EmployeeModel employeeModel) {
		return employeeRepo.save(employeeModel);
	}

	public boolean exists(EmployeeModel employeeModel) {
		//return employeeRepo.exists(employeeModel.getEmployeeID());
		return true;
	}

	public EmployeeModel findOne(Integer id) {
		return employeeRepo.findOne(id);
	}
	
	public String delete(Integer id) {
		employeeRepo.delete(id);
		return "Đã xóa nhân viên " +id;
	}
	
	public List<EmployeeModel> searchEmployee(String search){
		return employeeRepo.searchEmployee(search);
	}

	public EmployeeModel findOneByAccount(AccountModel account) {
		List<EmployeeModel> lsEmp = employeeRepo.findAll();
		for(EmployeeModel emp : lsEmp) {
			if(emp.getAccount().getAccountID() == account.getAccountID()) {
				return emp;
			}
		}
		return null;
	}

	
}
