package com.guet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guet.entity.JzType;
import com.guet.entity.News;
import com.guet.service.NewsService;

@Controller
//@SessionAttributes("rolemap")
@RequestMapping("/news.do")
public class NewsController {
	
	@Autowired
	private NewsService newsService;
	
	
	
	@RequestMapping
	public String findAll(ModelMap mm,HttpSession session){
		
		List<News> ns = newsService.findAll();
		mm.put("ns", ns);
		return "jsp/news/news";
		
	}
	
	@RequestMapping(params="method=insertView")
	public String insertView(ModelMap mm,HttpSession session){		
		
		return "jsp/news/insertView";
		
	}
	
	@RequestMapping(params="method=insert")
	public @ResponseBody String insert(ModelMap mm,HttpSession session ,News n){		
		int i = newsService.insert(n);
		if(i>0) {
			return "{\"msg\": \"ok\"}";
		}
		return "{\"msg\": \"error\"}";
		
	}
	
	@RequestMapping(params="method=updateView")
	public String updateView(ModelMap mm,HttpSession session,int id){		
		mm.put("n", newsService.findById(id));
		return "jsp/news/updateView";
		
	}
	
	@RequestMapping(params="method=update")
	public @ResponseBody String update(ModelMap mm,HttpSession session,News n){		
		int i = newsService.update(n);
		if(i>0) {
			return "{\"msg\": \"ok\"}";
		}
		return "{\"msg\": \"error\"}";
		
	}
	
	@RequestMapping(params="method=delete")
	public String delete(ModelMap mm,HttpSession session,int id){		
		int i = newsService.delete(id);
		if(i>0) {
			return "redirect:/news.do";
		}
		return "redirect:jsp/common/404.jsp";
		
	}
	
	
	
}
