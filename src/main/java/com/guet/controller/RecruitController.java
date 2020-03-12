package com.guet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guet.entity.News;
import com.guet.entity.Recruit;
import com.guet.service.RecruitService;

@Controller
//@SessionAttributes("rolemap")
@RequestMapping("/recruit.do")
public class RecruitController {
	
	@Autowired
	private RecruitService recruitService;
	
	
	
	@RequestMapping
	public String findAll(ModelMap mm,HttpSession session){
		
		List<Recruit> rs = recruitService.findAll();
		mm.put("rs", rs);
		return "jsp/recruit/recruit";
		
	}
	
	@RequestMapping(params="method=insertView")
	public String insertView(ModelMap mm,HttpSession session){		
		
		return "jsp/recruit/insertView";
		
	}
	
	@RequestMapping(params="method=insert")
	public @ResponseBody String insert(ModelMap mm,HttpSession session ,Recruit r){		
		int i = recruitService.insert(r);
		if(i>0) {
			return "{\"msg\": \"ok\"}";
		}
		return "{\"msg\": \"error\"}";
		
	}
	
	@RequestMapping(params="method=updateView")
	public String updateView(ModelMap mm,HttpSession session,int id){		
		mm.put("r", recruitService.findById(id));
		return "jsp/recruit/updateView";
		
	}
	
	@RequestMapping(params="method=update")
	public @ResponseBody String update(ModelMap mm,HttpSession session,Recruit r){		
		int i = recruitService.update(r);
		if(i>0) {
			return "{\"msg\": \"ok\"}";
		}
		return "{\"msg\": \"error\"}";
		
	}
	
	@RequestMapping(params="method=delete")
	public String delete(ModelMap mm,HttpSession session,int id){		
		int i = recruitService.delete(id);
		if(i>0) {
			return "redirect:/recruit.do";
		}
		return "redirect:jsp/common/404.jsp";
		
	}
	
	
	
}
