package com.guet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.guet.entity.JzType;

import com.guet.service.JzTypeService;

@Controller
@SessionAttributes("rolemap")
@RequestMapping("/jzType.do")
public class JzTypeController {
	
	@Autowired
	private JzTypeService jzTypeService;
	
	
	
	@RequestMapping
	public String findAll(ModelMap mm,HttpSession session){
		
		List<JzType> jt = jzTypeService.findAll();
		mm.put("jts", jt);
		return "jsp/jzType/jzType";
		
	}
	
	@RequestMapping(params="method=insertView")
	public String insertView(ModelMap mm,HttpSession session){		
		
		return "jsp/jzType/insertView";
		
	}
	
	@RequestMapping(params="method=insert")
	public String insert(ModelMap mm,HttpSession session ,JzType jz){		
		int i = jzTypeService.insert(jz);
		if(i>0) {
			return "redirect:/jzType.do";
		}
		return "redirect:jsp/common/404.jsp";
		
	}
	
	@RequestMapping(params="method=update")
	public String update(ModelMap mm,HttpSession session,JzType jz){		
		int i = jzTypeService.update(jz);
		if(i>0) {
			return "redirect:/jzType.do";
		}
		return "redirect:jsp/common/404.jsp";
		
	}
	
	@RequestMapping(params="method=delete")
	public String delete(ModelMap mm,HttpSession session,int id){		
		int i = jzTypeService.delete(id);
		if(i>0) {
			return "redirect:/jzType.do";
		}
		return "redirect:jsp/common/404.jsp";
		
	}
	
	
	
}
