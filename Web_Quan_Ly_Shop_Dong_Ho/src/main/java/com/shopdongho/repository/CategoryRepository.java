package com.shopdongho.repository;

import java.security.cert.PKIXRevocationChecker.Option;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.shopdongho.model.CategoryModel;

@Transactional
@Repository
public interface CategoryRepository extends CrudRepository<CategoryModel, Integer> {

	// Lay tat ca category
	List<CategoryModel> findAll();

	// Them category
	CategoryModel save(CategoryModel categoryModel);
	
	
	@Query("select c from CategoryModel c where c.categoryName = ?1 ")
	List<CategoryModel> findByName(@Param("categoryName") String categoryName);


	// Tim category bang ID
	List<CategoryModel> findBy(String CategoryID);

	@Query("SELECT CASE WHEN COUNT(c) > 0 THEN true ELSE false END FROM CategoryModel c WHERE c.categoryID = :categoryid")
	public Boolean existsById(@Param("categoryid") int categoryid);

	@Query("SELECT CASE WHEN COUNT(c) > 0 THEN true ELSE false END FROM CategoryModel c WHERE c.categoryName = :categoryname")
	public Boolean existsByCategoryName(@Param("categoryname") String categoryname);

	@Modifying
	@Query("update CategoryModel c set c.categoryName = :categoryname where c.categoryID = :categoryid")
	public int  editCategorysByID(@Param("categoryid") int categoryid, @Param("categoryname") String categoryname);
	
	

}
