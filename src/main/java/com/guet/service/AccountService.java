package com.guet.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guet.dao.AccountDao;
import com.guet.entity.Account;


@Service("accountService")
public class AccountService{

	@Autowired
	private AccountDao accountDao;
	
	
	//验证用户名是否重复或者用于登陆验证
	public Account checkUserName(@Param("username")String username) {
		Account acc = accountDao.checkUserName(username);
		return acc;
	}
	//插入一条记录，用于注册
	public int insertAccount(Account acc) {
		return accountDao.insertAccount(acc);
	}
	//update
	public int updateAccount(Account acc) {
		return accountDao.updateAccount(acc);
	}
	
	public int updatePower(int id,int power) {
		return accountDao.updatePower(id, power);
	}
	
	public int updateIpAndTime(int id,String ip,Date time) {
		return accountDao.updateIpAndTime(id, ip, time);
	}
	
	
	//updateUserinfo
	public int updateUserInfo(Account acc) {
		return accountDao.updateUserInfo(acc);
	}
	
	public Account findById(int id) {
		return accountDao.findById(id);
	}
	
	public List<Account> findAll() {
		return accountDao.findAll();
	}
	
	public List<Account> findAllAdmin() {
		return accountDao.findAllAdmin();
	}
	
	//updatepass
	public int updatePass(@Param("id")int id,@Param("pass")String pass) {
		return accountDao.updatePass(id, pass);
	}
	
	public int chageGold(int id,int gold) {
		return accountDao.changeGold(id, gold);
	}
	
	public int delete(int id) {
		return accountDao.delete(id);
	}

}
