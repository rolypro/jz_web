package com.guet.dao;

import java.util.List;

import com.guet.entity.Evaluate;
import com.guet.entity.News;

public interface EvaluateDao {
	
	//查所有
	public List<Evaluate> findAll();
	//查所有
	public List<Evaluate> findPeopleById(int sID);
	public List<Evaluate> findCompanyById(int sID);
	//根据id查询
	public Evaluate findById(int id);
	//删除
	public int delete(int id);
	//更新
	//public int update(Evaluate e);
	//插入一条
	public int insert(Evaluate e);
	
	
	
	
	//给工号集合返回id  声明gonghao直接用
	//public int findByEmployee_id(@Param("gonghao")String gonghao);
	
	
	
}
