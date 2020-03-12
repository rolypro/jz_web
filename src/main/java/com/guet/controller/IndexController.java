package com.guet.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guet.entity.Account;

import com.guet.service.AccountService;




@Controller
@RequestMapping("/index.do")
//@SessionAttributes({"user","is_login","is_systemrole"})
public class IndexController {
	@Autowired
	private AccountService accountService;
	
	
    private String getClientIp(HttpServletRequest request) {

        String remoteAddr = "";

        if (request != null) {
            remoteAddr = request.getHeader("X-FORWARDED-FOR");
            if (remoteAddr == null || "".equals(remoteAddr)) {
                remoteAddr = request.getRemoteAddr();
            }
        }

        return remoteAddr;
    }
	
	@RequestMapping//表示让此方法去实现/index.do
	public String Index(){
		return "jsp/index/Index";
	}
	
	@RequestMapping(params="method=login")
	public @ResponseBody String Login(String username,String password,HttpServletRequest request,HttpSession session){
		
		String ip = getClientIp(request);
		System.out.println(ip);
		
		//power==2表示该账号停用
		Account acc = accountService.checkUserName(username);
		if(acc!=null){
			if(!acc.getPassword().equals(password))
				return "{\"msg\": \"error\"}";
			
			session.setAttribute("user", acc);
			session.setAttribute("is_login", true);
			
			//是否超级管理员
			boolean is_systemrole = false;
			if (Integer.parseInt(acc.getPower()) == 0) {
				is_systemrole = true;
			}
			//更新登录信息
			accountService.updateIpAndTime(acc.getId(), ip, new Date());
			
			//mm.put("is_systemrole", is_systemrole);
			session.setAttribute("is_systemrole", is_systemrole);
			return "{\"msg\": \"ok\",\"is_systemrole\":"+is_systemrole+"}";
		}
		
		return "{\"msg\": \"error\"}";
	}
	
	@RequestMapping(params="method=checkusername")
	public @ResponseBody String checkUsername(String username,HttpSession session){		
		Account acc = accountService.checkUserName(username);
		if(acc == null){
			
			return "{\"msg\": \"ok\"}";
		}
		
		return "{\"msg\": \"error\"}";
	}
	
	@RequestMapping(params="method=logout")
	public String Logout(HttpSession session){
		Enumeration em = session.getAttributeNames();
		while(em.hasMoreElements()){
			session.removeAttribute(em.nextElement().toString());
		}
		return "redirect:/index.do";
	}
	
	@RequestMapping(params="method=signinview")
	public String SigninView(){
		return "jsp/index/Signin";
	}
	
	@RequestMapping(params="method=signin")
	public String Signin(ModelMap mm,Account acc){
		Account acc1 = accountService.checkUserName(acc.getUsername());
		if(null != acc1) {
			//再次验证是否重复，重复返回错误
			return "jsp/common/404.jsp";
		}
		int i = accountService.insertAccount(acc);
		if(i>0){
			mm.put("username",acc.getUsername());
			return "jsp/index/Signininfo";
		}else{
			return "jsp/common/404.jsp";
		}
		
	}
	
}
