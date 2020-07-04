package com.shopdongho.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.shopdongho.model.CategoryModel;
import com.shopdongho.repository.CategoryRepository;


@Service
public class CategoryService {

	@Autowired
	CategoryRepository categoryRepository;
	
	public CategoryModel insertCategory(CategoryModel categoryModel) {
		return categoryRepository.save(categoryModel);
	}
	
	public List<CategoryModel> findAll(){
		return categoryRepository.findAll();
	}
	
	public List<CategoryModel> findByCategoryName(String name){
		return categoryRepository.findByName(name);
	}
	
	public void save(CategoryModel categoryModel){
		categoryRepository.save(categoryModel);
	}
	
	public Boolean existsByCategoryName(String categoryname) {
		if(categoryRepository.existsByCategoryName(categoryname) == false)
			return false;
		return true;
	}
	
	public void deleteCategorysByID(int categoryid){
		categoryRepository.delete(categoryid);
	}
	
	public int editCategorysByID(int categoryid, String categoryname) {
		if(categoryRepository.editCategorysByID(categoryid, categoryname)!=0)
			return 1;
		return 0;
	}
	
	public CategoryModel findOne(int id){
		 return categoryRepository.findOne(id);
		 
	}
}
