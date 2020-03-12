package com.guet.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guet.dao.RecruitDao;
import com.guet.entity.News;
import com.guet.entity.Recruit;



@Service("recruitService")
public class RecruitService{

	@Autowired
	private RecruitDao dao;
	
	
	//查所有
	public List<Recruit> findAll(){
		return dao.findAll();
	}
	//根据id查询
	public Recruit findById(int id) {
		return dao.findById(id);
	}
	
	//删除
	public int delete(int id) {
		return dao.delete(id);
	}
	//更新
	public int update(Recruit r) {
		return dao.update(r);
	}
	//插入一条
	public int insert(Recruit r) {
		Date nowTime=new Date(); 
		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		r.setCreateTime(nowTime);
		return dao.insert(r);
	}
	
}
