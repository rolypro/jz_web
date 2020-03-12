package com.guet.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guet.dao.NewsDao;
import com.guet.entity.News;



@Service("newsService")
public class NewsService{

	@Autowired
	private NewsDao newsDao;
	
	
	//查所有
	public List<News> findAll(){
		return newsDao.findAll();
	}
	//根据id查询
	public News findById(int id) {
		return newsDao.findById(id);
	}
	//删除
	public int delete(int id) {
		return newsDao.delete(id);
	}
	//更新
	public int update(News n) {
		return newsDao.update(n);
	}
	//插入一条
	public int insert(News n) {
		Date nowTime=new Date(); 
		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		n.setCreateTime(nowTime);
		return newsDao.insert(n);
	}
	
}
