package com.guet.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guet.dao.JzTypeDao;
import com.guet.entity.JzType;

@Service("jzTypeService")
public class JzTypeService{

	@Autowired
	private JzTypeDao jzTypeDao;
	
	
	//查所有
	public List<JzType> findAll(){
		return jzTypeDao.findAll();
	}
	//根据id查询
	public JzType findById(int id) {
		return jzTypeDao.findById(id);
	}
	//删除
	public int delete(int id) {
		return jzTypeDao.delete(id);
	}
	//更新
	public int update(JzType jt) {
		return jzTypeDao.update(jt);
	}
	//插入一条
	public int insert(JzType jt) {
		Date nowTime=new Date(); 
		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		jt.setCreateTime(nowTime);
		return jzTypeDao.insert(jt);
	}
	
}
