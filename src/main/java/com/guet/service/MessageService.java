package com.guet.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guet.dao.MessageDao;
import com.guet.dao.SubMessageDao;
import com.guet.entity.Message;
import com.guet.entity.News;


@Service("messageService")
public class MessageService{

	@Autowired
	private MessageDao messageDao;
	@Autowired
	private SubMessageDao subMessageDao;
	
	
	//查所有
	public List<Message> findAll(){
		return messageDao.findAll();
	}
	
	//根据id查询
	public Message findById(int id) {
		return messageDao.findById(id);
	}
	//删除
	public int delete(int id) {
		//先删除子评论
		int i = subMessageDao.deleteByFid(id);
		if(i>0) {
			//返回删除留言条数
			return messageDao.delete(id);
		} 
		//删除失败返回0
		return 0;
	}
	
	//插入一条
	public int insert(Message m) {
		Date nowTime=new Date(); 
		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		m.setCreateTime(nowTime);
		return messageDao.insert(m);
	}
	
}
