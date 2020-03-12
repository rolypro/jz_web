package com.guet.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guet.dao.SubMessageDao;
import com.guet.entity.SubMessage;


@Service("subMessageService")
public class SubMessageService{

	@Autowired
	private SubMessageDao subMessageDao;
	
	
	//删除
	public int delete(int id) {
		//删除一条子评论
		return subMessageDao.deleteById(id);
		
	}
	
	//插入一条
	public int insert(SubMessage sm) {
		Date nowTime=new Date(); 
		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		sm.setCreateTime(nowTime);
		return subMessageDao.insert(sm);
	}
	
}
