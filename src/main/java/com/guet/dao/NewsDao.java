package com.guet.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.guet.entity.News;

public interface NewsDao {
	
	//查所有
	public List<News> findAll();
	//根据id查询
	public News findById(int id);
	//删除
	public int delete(int id);
	//更新
	public int update(News n);
	//插入一条
	public int insert(News n);
	
	
	
	
	//给工号集合返回id  声明gonghao直接用
	//public int findByEmployee_id(@Param("gonghao")String gonghao);
	
	
	
}
