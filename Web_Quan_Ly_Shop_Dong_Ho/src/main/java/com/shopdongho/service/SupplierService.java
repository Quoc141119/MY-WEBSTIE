package com.shopdongho.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopdongho.model.CategoryModel;
import com.shopdongho.model.SupplierModel;
import com.shopdongho.repository.SupplierRepository;

@Service
public class SupplierService {
	
	@Autowired
	private SupplierRepository supplierRepository;

	public List<SupplierModel> findAll(){
		return supplierRepository.findAll();
	}
	
	public SupplierModel insertSupplier(SupplierModel supplierModel) {
		return supplierRepository.save(supplierModel);
	}

	public void deleteSupplierByID(Integer id) {
		supplierRepository.delete(id);
		
	}

	public SupplierModel findOne(int id) {		
		return supplierRepository.findOne(id); 
	}
	
	public int editSupplier(int id, String name, String add, String country) {
		if(supplierRepository.editSupplier(id, name, add, country)!=0)
			return 1;
		return 0;
	}
	
	public Boolean existSupplier(String name, String add, String cou) {
		if(supplierRepository.existsBySupplier(name, add, cou)==true)
			return true;
		return false;
	}
	
	public List<CategoryModel> findByName(String categoryname){
		return supplierRepository.findByName(categoryname);
	}

}
