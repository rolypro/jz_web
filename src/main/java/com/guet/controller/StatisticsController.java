package com.guet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.guet.entity.OrderForDay;
import com.guet.service.StatisticsService;

@Controller
//@SessionAttributes("rolemap")
@RequestMapping("/statistics.do")
public class StatisticsController {
	
	@Autowired
	private StatisticsService statisticsServer;
	
	
	
	@RequestMapping(params="method=findWeekOrderCount")
	public String findWeekOrderCount(ModelMap mm,HttpSession session){
		
		List<OrderForDay> ofds = statisticsServer.findWeekOrder();
		mm.put("ofds", ofds);
		
		return "jsp/statistics/findWeekOrderCount";
		
	}
	
	
	
	
	
	
	
}
