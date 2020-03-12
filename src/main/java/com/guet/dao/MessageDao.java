package com.guet.dao;

import java.util.List;

import com.guet.entity.Message;
import com.guet.entity.News;



public interface MessageDao {
	
	//查所有
	public List<Message> findAll();
	//根据id查询
	public Message findById(int id);
	//删除
	public int delete(int id);
	//更新
	//public int update(Message m);
	//插入一条
	public int insert(Message m);
	
	
	
	
	//给工号集合返回id  声明gonghao直接用
	//public int findByEmployee_id(@Param("gonghao")String gonghao);
	
	
	
}
