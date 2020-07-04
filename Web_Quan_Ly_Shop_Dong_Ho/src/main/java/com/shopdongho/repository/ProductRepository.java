package com.shopdongho.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.shopdongho.model.ProductModel;

@Transactional
@Repository
public interface ProductRepository extends CrudRepository<ProductModel, Integer> {

	@Query(value = "SELECT TOP 8 * FROM dbo.Products WHERE Quantity > 0 ORDER BY ProductID DESC", nativeQuery = true)
	List<ProductModel> getTop8ProductNew();

	@Query(value = "SELECT TOP 4 P.ProductID FROM dbo.OrderDetails O INNER JOIN dbo.Products P ON P.ProductID = O.ProductID "
			+ "WHERE P.Quantity > 0 GROUP BY P.ProductID ORDER BY COUNT(O.Quantity) DESC", nativeQuery = true)
	List<Integer> getTopSellId();

	// Lay tat ca san pham con hang
	@Query(value = "SELECT * FROM dbo.Products WHERE Quantity > 0", nativeQuery = true)
	List<ProductModel> getAllProductInStock();
	
	// Tim kiem san pham bang CategoryID
	@Query(value = "SELECT * FROM dbo.Products WHERE CategoryID = ?1 AND Quantity > 0", nativeQuery = true)
	List<ProductModel> findProductByCategoryID(int id);

	// Tim kiem san pham bang SupplierID
	@Query(value = "SELECT * FROM dbo.Products WHERE SupplierID = ?1 AND Quantity > 0", nativeQuery = true)
	List<ProductModel> findProductBySupplierID(int id);

	// Tim kiem gan dung
	@Query(value = "SELECT * FROM dbo.Products WHERE ProductName LIKE %?1% AND Quantity > 0", nativeQuery = true)
	List<ProductModel> searchProductByName(String productName);

	List<ProductModel> findAll();

	@Modifying
	@Query(value = "INSERT INTO Products(ProductName, SupplierID, CategoryID, Quantity, Image, Unit, Discount, Price, Description)"
			+ "VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9)", nativeQuery = true)
	int insertProduct(@Param("ProductName") String ProductName, @Param("SupplierID") int SupplierID,
			@Param("CategoryID") int CategoryID, @Param("Quantity") Long Quantity, @Param("Image") String Image,
			@Param("Unit") String Unit, @Param("Discount") Float Discount, @Param("Price") Float Price,
			@Param("Description") String Description);

	@Modifying
	@Query("update ProductModel u set u.quantity = ?1 where u.id = ?2")
	void update(Long quantity, Integer id);
	
	public void delete(Integer id);

	@Query("select c from ProductModel c where c.productName = :productname")
	List<ProductModel> findByName(@Param("productname") String productname);

	@Modifying
	@Query("update ProductModel c set c.productName = :productName, c.quantity = :quantity, c.image = :image, c.discount =:discount, c.price =:price, c.description =:description where c.productID = :productID")
	public void editProduct(@Param("productName")String productName, @Param("quantity") Long quantity,@Param("image") String image,@Param("discount") Float discount,@Param("price") Float price,@Param("description") String description,@Param("productID") int productID);
}
