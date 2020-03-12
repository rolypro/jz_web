package com.guet.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;







import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("rolemap")
@RequestMapping("/home.do")
public class HomeController {
	
	/*@Autowired
	private Sys_RoleService sys_RoleService;
	@Autowired
	private Sys_UserDao sys_UserDao;*/
	
	
	
	@RequestMapping
	public String index(ModelMap mm,HttpSession session){
		
		boolean is_systemrole = (boolean) session.getAttribute("is_systemrole");
		if(!is_systemrole){
			/*
			 * 
			 * 
			 * */
		}
		return "jsp/home/Home";
	}
	
	/*@RequestMapping(params="method=updateview")
	public String updateview(ModelMap mm,HttpSession session){
		Sys_User user = (Sys_User) session.getAttribute("user");
		mm.put("u",sys_UserDao.findById(user.getId()));
		return "jsp/home/User";
	}
	
	@RequestMapping(params="method=update")
	public String update(Sys_User su){
		//sys_UserDao.updateUser2(su);
		return "redirect:/main.do?method=updateview";
	}
	
	@RequestMapping(params="method=passview")
	public String passview(){
		//EL直接从session拿user了
		return "jsp/home/Pass";
	}
	
	@RequestMapping(params="method=passbefor")
	public @ResponseBody String passBefor(String pass,HttpSession session){
		Sys_User user = (Sys_User) session.getAttribute("user");
		String password = user.getPassword();
		if(pass.equals(password)){
			return "{\"msg\":\"ok\"}";
		}else{
			return "{\"msg\":\"error\"}";
		}
	}
	
	@RequestMapping(params="method=updatepass")
	public String updatePass(String pass,HttpSession session ){
		Sys_User user = (Sys_User) session.getAttribute("user");
		int id = user.getId();
		sys_UserDao.updatePass(pass, id);
		return "redirect:/index.do?method=logout";
	}*/
	
	
}
