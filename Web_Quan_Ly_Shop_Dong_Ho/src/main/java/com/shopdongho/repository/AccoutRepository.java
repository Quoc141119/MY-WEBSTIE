package com.shopdongho.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.shopdongho.model.AccountModel;

public interface AccoutRepository extends JpaRepository<AccountModel, Integer>{
	
	AccountModel save(AccountModel accout);
	
	@Query ("SELECT c FROM AccountModel c ORDER BY c.accountID DESC")
	List<AccountModel> getLastAccount();
	
	@Query ("SELECT c FROM AccountModel c WHERE c.username = ?1")
	AccountModel checkAccount(String username);

	@Query ("SELECT c FROM AccountModel c WHERE c.username = ?1 and c.accountID != ?2")
	AccountModel checkAccount(String username, int accountID);

	@Query ("SELECT c FROM AccountModel c WHERE c.username = ?1 and c.password = ?2")
	AccountModel checkLogin(String uname, String psw);
}
