package com.shopdongho.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopdongho.model.AccountModel;
import com.shopdongho.repository.AccoutRepository;

@Service
public class AccountService {

	@Autowired
	AccoutRepository accoutRepository;
	
	public String insert(AccountModel accout) {
		if(accoutRepository.checkAccount(accout.getUsername()) != null) {
			return "Username đã tồn tại!";
		}else {
			accoutRepository.save(accout);
			return "Đã thêm account";
		}
	}

	public String edit(AccountModel accout) {
		if(accoutRepository.checkAccount(accout.getUsername(), accout.getAccountID()) != null) {
			return "Username " + accout.getUsername() +" đã tồn tại!";
		}else {
			accoutRepository.save(accout);
			return "Đã lưu account";
		}
	}	
	
	public void save(AccountModel account) {
		accoutRepository.save(account);
	}

	public AccountModel findOne(int parseInt) {
		return accoutRepository.findOne(parseInt);
	}
	
	public void delete(AccountModel account) {
		accoutRepository.delete(account);
	}
	
	public List<AccountModel> getLastAccount() {
		return accoutRepository.getLastAccount();
	}

	public AccountModel checkLogin(String uname, String psw) {
		if(accoutRepository.checkLogin(uname, psw) != null) {
			return accoutRepository.checkLogin(uname, psw);
		}else {
			return null;
		}
	}
}
