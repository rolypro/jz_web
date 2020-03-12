package com.guet.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guet.dao.LifeDao;
import com.guet.entity.Life;




@Service("lifeService")
public class LifeService{

	@Autowired
	private LifeDao dao;
	
	
	//查所有
	public List<Life> findAll(){
		return dao.findAll();
	}
	//根据id查询
	public Life findById(int id) {
		return dao.findById(id);
	}
	//删除
	public int delete(int id) {
		return dao.delete(id);
	}
	//更新
	public int update(Life l) {
		return dao.update(l);
	}
	//插入一条
	public int insert(Life l) {
		Date nowTime=new Date(); 
		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		l.setCreateTime(nowTime);
		return dao.insert(l);
	}
	
}
