package com.guet.dao;

import java.util.List;

import com.guet.entity.Life;



public interface LifeDao {
	
	//查所有
	public List<Life> findAll();
	//根据id查询
	public Life findById(int id);
	//删除
	public int delete(int id);
	//更新
	public int update(Life l);
	//插入一条
	public int insert(Life l);
	
	
	
	
	//给工号集合返回id  声明gonghao直接用
	//public int findByEmployee_id(@Param("gonghao")String gonghao);
	
	
	
}
