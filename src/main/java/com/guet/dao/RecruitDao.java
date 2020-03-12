package com.guet.dao;

import java.util.List;

import com.guet.entity.Recruit;

public interface RecruitDao {
	
	//查所有
	public List<Recruit> findAll();
	//根据id查询
	public Recruit findById(int id);
	//删除
	public int delete(int id);
	//更新
	public int update(Recruit r);
	//插入一条
	public int insert(Recruit r);
	
	
	
	
	//给工号集合返回id  声明gonghao直接用
	//public int findByEmployee_id(@Param("gonghao")String gonghao);
	
	
	
}
