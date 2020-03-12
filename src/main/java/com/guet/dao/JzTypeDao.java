package com.guet.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.guet.entity.Account;
import com.guet.entity.JzType;

public interface JzTypeDao { 
	
	//查所有
	public List<JzType> findAll();
	//根据id查询
	public JzType findById(int id);
	//删除
	public int delete(int id);
	//更新
	public int update(JzType jt);
	//插入一条
	public int insert(JzType jt);
	
	
	
	
	
	
}
