package com.guet.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guet.dao.JzOrderDao;
import com.guet.entity.JzOrder;
import com.guet.entity.OrderForDay;


@Service("statisticsService")
public class StatisticsService{

	@Autowired
	private JzOrderDao jzOrderDao;
	
	//直接统计订单
	private List<OrderForDay> staOrder(List<JzOrder> jos) {
		//一样就继续相加，不一样就插入一条再继续计算
		String date = "";
		List<OrderForDay> ofds = new ArrayList<OrderForDay>();
		OrderForDay ofd = null;
		
		for(JzOrder jo : jos) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String tmpDate = sdf.format(jo.getCreateTime());
			
			if(!tmpDate.equals(date)) {
				//碰到下一个日期先处理前面的数据
				date = tmpDate;
				if(null!=ofd) {
					ofds.add(ofd);
				}
				ofd = new OrderForDay();
			}
			
			ofd.setDay(tmpDate);
			ofd.setGold(ofd.getGold()+jo.getGold());
			
		}
		//最后一组数据没有处理
		ofds.add(ofd);		
		
		return ofds;
		
	}
	
	public List<OrderForDay> findWeekOrder(){
		//获取所有数据
		List<JzOrder> jos = jzOrderDao.findOrderWeek();
		//分类统计
		return staOrder(jos);
		
	}
	

}
