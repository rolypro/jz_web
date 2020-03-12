package com.guet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guet.entity.Life;
import com.guet.entity.News;
import com.guet.service.LifeService;

@Controller
//@SessionAttributes("rolemap")
@RequestMapping("/life.do")
public class LifeController {
	
	@Autowired
	private LifeService lifeService;
	
	
	
	@RequestMapping
	public String findAll(ModelMap mm,HttpSession session){
		
		List<Life> ls = lifeService.findAll();
		mm.put("ls", ls);
		return "jsp/life/life";
		
	}
	
	@RequestMapping(params="method=insertView")
	public String insertView(ModelMap mm,HttpSession session){		
		
		return "jsp/life/insertView";
		
	}
	
	@RequestMapping(params="method=insert")
	public @ResponseBody String insert(ModelMap mm,HttpSession session ,Life l){		
		int i = lifeService.insert(l);
		if(i>0) {
			return "{\"msg\": \"ok\"}";
		}
		return "{\"msg\": \"error\"}";
		
	}
	
	@RequestMapping(params="method=updateView")
	public String updateView(ModelMap mm,HttpSession session,int id){		
		mm.put("l", lifeService.findById(id));
		return "jsp/life/updateView";
		
	}
	
	@RequestMapping(params="method=update")
	public @ResponseBody String update(ModelMap mm,HttpSession session,Life l){		
		int i = lifeService.update(l);
		if(i>0) {
			return "{\"msg\": \"ok\"}";
		}
		return "{\"msg\": \"error\"}";
		
	}
	
	@RequestMapping(params="method=delete")
	public String delete(ModelMap mm,HttpSession session,int id){		
		int i = lifeService.delete(id);
		if(i>0) {
			return "redirect:/life.do";
		}
		return "redirect:jsp/common/404.jsp";
		
	}
	
	
	
}
