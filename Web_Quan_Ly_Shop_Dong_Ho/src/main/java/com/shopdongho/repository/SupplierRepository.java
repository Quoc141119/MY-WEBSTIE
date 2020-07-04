package com.shopdongho.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.shopdongho.model.CategoryModel;
import com.shopdongho.model.SupplierModel;

@Transactional
@Repository
public interface SupplierRepository extends CrudRepository<SupplierModel, Integer> {

	List<SupplierModel> findAll();

	SupplierModel save(SupplierModel supplierModel);

	public void delete(Integer id);

	@Query("SELECT CASE WHEN COUNT(c) > 0 THEN true ELSE false END FROM SupplierModel c WHERE c.supplierName =:suppliername and c.address = :address and c.country =:country")
	public Boolean existsBySupplier(@Param("suppliername") String suppliername, @Param("address") String address,
			@Param("country") String country);

	@Modifying
	@Query("update SupplierModel c set c.supplierName = :suppliername, c.address = :address, c.country = :country where c.supplierID = :supplierid")
	public int editSupplier(@Param("supplierid") int supplierid, @Param("suppliername") String suppliername,
			@Param("address") String address, @Param("country") String country);

	@Query("select c from SupplierModel c where c.supplierName = :categoryname")
	List<CategoryModel> findByName(@Param("categoryname") String categoryname);

}
