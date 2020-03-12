package com.guet.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.guet.entity.Account;


public interface AccountDao {
	
	//验证用户名是否重复
	public Account checkUserName(@Param("username")String username);
	//插入一条记录，用于注册
	public int insertAccount(Account acc);
	//update
	public int updateAccount(Account acc); 
	//修改账户余额
	public int changeGold(@Param("id")int id,@Param("gold")int gold);
	
	//updateUserinfo
	public int updateUserInfo(Account acc);
	
	public Account findById(int id);
	
	public List<Account> findAll();
	
	public List<Account> findAllAdmin();
	
	public int updateIpAndTime(@Param("id")int id,@Param("ip")String ip,@Param("time")Date time);
	
	//修改启用停用状态 power
	public int updatePower(@Param("id")int id,@Param("power")int power);
	
	//updatepass
	public int updatePass(@Param("id")int id,@Param("pass")String pass);
	
	public int delete(@Param("id")int id);
	
	//给工号集合返回id  声明gonghao直接用
	//public int findByEmployee_id(@Param("gonghao")String gonghao);
	
	
	
}
